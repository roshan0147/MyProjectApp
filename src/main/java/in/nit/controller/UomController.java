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

import in.nit.model.Uom;
import in.nit.service.IUomService;
import in.nit.util.UomUtil;
import in.nit.view.UomExcelView;
import in.nit.view.UomPdfView;

@Controller
@RequestMapping("/uom")
public class UomController {
	@Autowired
	private IUomService service;
	@Autowired
	private ServletContext context;
	@Autowired
	private UomUtil util;
	@RequestMapping("/register")
	public String showUomPage(Model model)
	{
		model.addAttribute("uom",new Uom());
		return "UomRegister";
	}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveUomData(@ModelAttribute Uom uom,Model model)
	{
		Integer id=service.saveUom(uom);
		String message="Uom '"+id+"'Saved";
		model.addAttribute("message",message);
		model.addAttribute("uom",new Uom());
		return "UomRegister";
	}
	@RequestMapping("/all")
	public String getAllUoms(Model model)
	{
		List<Uom> list=service.getAllUoms();
		model.addAttribute("list",list);
		return "UomData";
	}
	@RequestMapping("/delete")
	public String deleteUom(@RequestParam("uid")Integer id,Model model)
	{
		service.deleteUom(id);
		List<Uom> list=service.getAllUoms();
		model.addAttribute("list",list);
		return "UomData";
	}
	@RequestMapping("/view")
	public String viewUomData(@RequestParam("uid")Integer id,Model model)
	{
		Uom u=service.getOneUom(id);
		model.addAttribute("ob",u);
		return "UomView";
	}
	@RequestMapping("/edit")
	public String editUomData(@RequestParam("uid")Integer id,Model model)
	{
		Uom u=service.getOneUom(id);
		model.addAttribute("uom",u);
		return "UomEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateUomData(@ModelAttribute Uom uom,Model model)
	{
		service.updateUom(uom);
		List<Uom> list=service.getAllUoms();
		model.addAttribute("list",list);
		return "UomData";
	}
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new UomExcelView());
		if(id==null)
		{
		List<Uom> list=service.getAllUoms();
		m.addObject("list",list);
		}else {
			Uom u=service.getOneUom(id);
			m.addObject("list",Arrays.asList(u));
		}
		return m;
	}
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new UomPdfView());
		if(id==null)
		{
			List<Uom> list=service.getAllUoms();
			m.addObject("list",list);
		}else {
			Uom u=service.getOneUom(id);
			m.addObject("list",Arrays.asList(u));
		}
		return m;
	}
	@RequestMapping("/charts")
	public String showCharts()
	{
		List<Object[]> list=service.getUomTyoeCount();
		String path=context.getRealPath("/");
		util.generatePieChart(path, list);
		util.generateBarChart(path, list);
		return "UomCharts";
		
	}

}
