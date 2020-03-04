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

import in.nit.model.ShipmentType;
import in.nit.service.IShipmentTypeService;
import in.nit.util.ShipmentTypeUtil;
import in.nit.view.ShipmentTypeExcelView;
import in.nit.view.ShipmentTypePdfView;

@Controller
@RequestMapping("/shipment")
public class ShipmentTypeController {

	@Autowired
	private IShipmentTypeService service;
	@Autowired
	private ServletContext context;
	@Autowired
	private ShipmentTypeUtil util;
	@RequestMapping("/register")
	public String showShipmentPage(Model model)
	{
		model.addAttribute("shipmentType",new ShipmentType());
		return "ShipmentTypeRegister";
	}
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String saveShipmentData(@ModelAttribute ShipmentType shipmentType,Model model)
	{
		service.saveShipmentType(shipmentType);
		String message="Register Successfully";
		model.addAttribute("message",message);
		model.addAttribute("shipmentType",new ShipmentType());
		return "ShipmentTypeRegister";
	}
	@RequestMapping("/all")
	public String getAllShipmentType(Model model)
	{
		List<ShipmentType> list=service.getAllShipmentTypes();
		model.addAttribute("list",list);
		return "ShipmentTypeData";
	}
	@RequestMapping("/delete")
	public String deleteShipmentType(@RequestParam("sid")Integer id,Model model)
	{
		service.deleteShipmentType(id);
		List<ShipmentType> list=service.getAllShipmentTypes();
		model.addAttribute("list",list);
		return "ShipmentTypeData";
	}
	@RequestMapping("/edit")
	public String showEditPage(@RequestParam("sid")Integer id,Model model)
	{
		ShipmentType obj=service.getOneShipmentType(id);
		model.addAttribute("shipmentType",obj);
		return "ShipmentTypeEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateShipmentType(@ModelAttribute ShipmentType shipmentType,Model model)
	{
		service.updateShipmentType(shipmentType);
		List<ShipmentType> list=service.getAllShipmentTypes();
		model.addAttribute("list",list);
		return "ShipmentTypeData";
	}
	@RequestMapping("/view")
	public String viewShipmentTypeData(@RequestParam("sid")Integer id,Model model)
	{
		ShipmentType st=service.getOneShipmentType(id);
		model.addAttribute("ob",st);
		return "ShipmentTypeView";
	}
	@RequestMapping("/excel")
	public ModelAndView showExcel(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new ShipmentTypeExcelView());
		if(id==null)
		{
			List<ShipmentType> list=service.getAllShipmentTypes();
			m.addObject("list",list);
		}else
		{
			ShipmentType st=service.getOneShipmentType(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	@RequestMapping("/pdf")
	public ModelAndView showPdf(
			@RequestParam(value="id",required = false)Integer id
			)
	{
		ModelAndView m=new ModelAndView();
		m.setView(new ShipmentTypePdfView());
		if(id==null)
		{
		List<ShipmentType> list=service.getAllShipmentTypes();
		m.addObject("list",list);
		}else {
			ShipmentType st=service.getOneShipmentType(id);
			m.addObject("list",Arrays.asList(st));
		}
		return m;
	}
	@RequestMapping("/charts")
	public String showCharts()
	{
		List<Object[]> list=service.getShipmentModeCount();
		String path=context.getRealPath("/");
		util.generatePie(path, list);
		util.generateBar(path, list);
		return "ShipmentTypeCharts";
	}
}
