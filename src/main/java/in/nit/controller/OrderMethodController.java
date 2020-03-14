package in.nit.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.OrderMethod;
import in.nit.service.IOrderMethodService;
import in.nit.util.OrderMethodUtil;
import in.nit.view.OrderMethodExcelView;
import in.nit.view.OrderMethodPdfView;

@Controller
@RequestMapping("/ordermethod")
public class OrderMethodController {
	
	@Autowired
	private IOrderMethodService service;
	@Autowired
	private ServletContext context;
	@Autowired
	private OrderMethodUtil util;
	@RequestMapping("/register")
	public String showOrderMethodPage(Model model)
	{
		model.addAttribute("orderMethod",new OrderMethod());
		return "OrderMethodRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveOrderMethodData(@ModelAttribute OrderMethod orderMethod,Model model)
	{
		service.saveOrderMethod(orderMethod);
		String message=" Saved Successfully";
		model.addAttribute("message",message);
		model.addAttribute("orderMethod",new OrderMethod());
		return "OrderMethodRegister";
	}
	@RequestMapping("/all")
	public String getAllOrderMethods(Model model)
	{
		List<OrderMethod> list=service.getAllOrderMethods();
		model.addAttribute("list",list);
		return "OrderMethodData";
	}
	@RequestMapping("/delete")
	public String deleteOrderMethod(@RequestParam("oid")Integer id,Model model)
	{
		service.deleteOrderMethod(id);
		List<OrderMethod> list=service.getAllOrderMethods();
		model.addAttribute("list",list);
		return "OrderMethodData";
	}
	@RequestMapping("/view")
	public String viewOrderMethodData(@RequestParam("oid")Integer id,Model model)
	{
		OrderMethod om=service.getOneOrderMethod(id);
		model.addAttribute("ob",om);
		return "OrderMethodView";
	}
	@RequestMapping("/edit")
	public String editOrderMethodData(@RequestParam("oid")Integer id,Model model)
	{
		OrderMethod om=service.getOneOrderMethod(id);
		model.addAttribute("orderMethod",om);
		return "OrderMethodEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateOrderMethod(@ModelAttribute OrderMethod orderMethod,Model model)
	{
		service.updateOrderMethod(orderMethod);
		List<OrderMethod> list=service.getAllOrderMethods();
		model.addAttribute("list",list);
		return "OrderMethodData";
	}
	@RequestMapping("/excel")
	public ModelAndView OrderMethodExcelView(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new OrderMethodExcelView());
		if(id==null)
		{
		List<OrderMethod> list=service.getAllOrderMethods();
	    m.addObject("list",list);
		}else {
			OrderMethod om=service.getOneOrderMethod(id);
			m.addObject("list",Arrays.asList(om));
		}
	    return m;
	}
	@RequestMapping("/pdf")
	public ModelAndView OrderMethodPdfView(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
	    m.setView(new OrderMethodPdfView());
	    if(id==null)
	    {
		List<OrderMethod> list=service.getAllOrderMethods();
	    m.addObject("list",list);
	    }else {
	    	OrderMethod om=service.getOneOrderMethod(id);
	    	m.addObject("list",Arrays.asList(om));
	    }
	    return m;
	}
	@RequestMapping("/charts")
	public String showCharts()
	{
		List<Object[]> list=service.getOrderMethodTypeCount();
		String path=context.getRealPath("/");
		util.generatePieChart(path,list);
		util.generateBarChart(path, list);
		return "OrderMethodCharts";
	}

}
