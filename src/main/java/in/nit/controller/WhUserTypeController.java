package in.nit.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.WhUserType;
import in.nit.service.IWhUserTypeService;
import in.nit.util.WhUserTypeUtil;
import in.nit.validator.WhUserTypeValidator;
import in.nit.view.WhUserTypeExcelView;
import in.nit.view.WhUserTypePdfView;

@Controller
@RequestMapping("/user")
public class WhUserTypeController {
	
	@Autowired
	private IWhUserTypeService service;
	@Autowired
	private ServletContext context;
	@Autowired
	private WhUserTypeUtil util;
	@Autowired
	private WhUserTypeValidator validator;
	@RequestMapping("/register")
	public String showUserRegister(Model model)
	{
		model.addAttribute("whUserType",new WhUserType());
		return "WhUserTypeRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String saveWhUserType(@ModelAttribute WhUserType whUserType,Errors errors,Model model)
	{
		validator.validate(whUserType, errors);
		if(!errors.hasErrors()) {
			service.saveWhUserType(whUserType);
			String message="Saved Successfully";
			model.addAttribute("message",message);
			model.addAttribute("whUserType",new WhUserType());
		}else {
			model.addAttribute("message","Please Check All Errors");
		}
		
		return "WhUserTypeRegister";
	}
	@RequestMapping("/all")
	public String showAllWhUserTypeData(Model model)
	{
		List<WhUserType> list=service.getAllWhUserTypes();
		model.addAttribute("list",list);
		return "WhUserTypeData";
	}
	@RequestMapping("/delete")
	public String deleteWhUserTypeData(@RequestParam("wid")Integer id,Model model)
	{
		service.deleteWhUserType(id);
		List<WhUserType> list=service.getAllWhUserTypes();
		model.addAttribute("list",list);
		return "WhUserTypeData";
	}
	@RequestMapping("/view")
	public String viewWhUserTypeData(@RequestParam("wid")Integer id,Model model)
	{
		WhUserType wh=service.getOneWhUserType(id);
		model.addAttribute("ob",wh);
		return "WhUserTypeView";
	}
	@RequestMapping("/edit")
	public String editWhUserTypeData(@RequestParam("wid")Integer id,Model model)
	{
		WhUserType wh=service.getOneWhUserType(id);
		model.addAttribute("whUserType",wh);
		return "WhUserTypeEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateWhUserTypeData(@ModelAttribute WhUserType whUserType,Model model)
	{
		service.updateWhUserType(whUserType);
		List<WhUserType> list=service.getAllWhUserTypes();
		model.addAttribute("list",list);
		return "WhUserTypeData";
	}
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new WhUserTypeExcelView());
		if(id==null)
		{
			List<WhUserType> list=service.getAllWhUserTypes();
			m.addObject("list",list);
		}else {
			WhUserType wh=service.getOneWhUserType(id);
			m.addObject("list",Arrays.asList(wh));
		}
		return m;
	}
	@RequestMapping("/pdf")
    public ModelAndView showPdf(
    		@RequestParam(value="id",required = false)Integer id
    		)
    {
		ModelAndView m=new ModelAndView();
		m.setView(new WhUserTypePdfView());
		if(id==null)
		{
			List<WhUserType> list=service.getAllWhUserTypes();
			m.addObject("list",list);
		}else {
			WhUserType wh=service.getOneWhUserType(id);
			m.addObject("list",Arrays.asList(wh));
		}
		return m;	
    }
	@RequestMapping("/charts")
	public String showCharts()
	{
		List<Object[]> list=service.getWhUserTypeIdTypeCount();
		String path=context.getRealPath("/");
		util.generatePieChart(path, list);
		util.generateBarChart(path, list);
		return "WhUserTypeCharts";
	}
}
