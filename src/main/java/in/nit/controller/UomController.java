package in.nit.controller;

import java.security.Principal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.Uom;
import in.nit.service.IUomService;
import in.nit.util.UomUtil;
import in.nit.validator.UomValidator;
import in.nit.view.UomExcelView;
import in.nit.view.UomPdfView;

@Controller
@RequestMapping("/uom")
@SessionAttributes({"datenow","useremail"})
public class UomController {
	
	private static Logger log=Logger.getLogger(UomController.class);
	@Autowired
	private IUomService service;
	@Autowired
	private ServletContext context;
	@Autowired
	private UomUtil util;
	@Autowired
	private UomValidator validator;
	@RequestMapping("/register")
	public String showUomPage(Model model,Principal p)
	{
		model.addAttribute("datenow",new Date());
		model.addAttribute("useremail",p.getName());
		model.addAttribute("uom",new Uom());
		return "UomRegister";
	}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveUomData(@ModelAttribute Uom uom,Errors errors,Model model)
	{
		validator.validate(uom, errors);
		if(!errors.hasErrors()) {
			log.info("Enter Into method");
			service.saveUom(uom);
			String message="Register Successfully";
			model.addAttribute("message",message);
			model.addAttribute("uom",new Uom());
		}else {
			model.addAttribute("message","Check all errors");
		}
		
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
	@RequestMapping("/modelExist")
	public @ResponseBody String isModelExist(
			@RequestParam("model")String model
			)
	{
		String message="";
		boolean exist=service.isUomModelExist(model);
		if(exist) {
			message=model+" already exist";
		}
		return message;
	}

}
