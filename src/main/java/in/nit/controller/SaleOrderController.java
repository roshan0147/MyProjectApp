package in.nit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.nit.model.SaleOrder;
import in.nit.service.ISaleOrderService;
import in.nit.service.IShipmentTypeService;
import in.nit.service.IWhUserTypeService;
import in.nit.util.CommonUtil;

@Controller
@RequestMapping("/saleOrder")
public class SaleOrderController {
	
	@Autowired
	private ISaleOrderService service;
	@Autowired
	private IShipmentTypeService shipmentService;
	@Autowired
	private IWhUserTypeService userService;
	
	private void commonUi(Model model)
	{
		List<Object[]> shipList=shipmentService.getShipmentIdAndCode();
	    Map<Integer,String> shipMap=CommonUtil.convert(shipList);
	    model.addAttribute("shipMap",shipMap);
	    
	    List<Object[]> whList=userService.getWhUserTypeIdAndUserCode("Customer");
	    Map<Integer,String> whMap=CommonUtil.convert(whList);
	    model.addAttribute("whMap",whMap);
	}
	
	@RequestMapping("/register")
	public String showRegisterPage(Model model)
	{
		SaleOrder so=new SaleOrder();
		so.setDefaultStatus("SALE-OPEN");
		model.addAttribute("saleOrder",so);
		commonUi(model);
		return "SaleOrderRegister";
	}
	@RequestMapping(value="/save",method =RequestMethod.POST)
	public String saveSaleOrderData(@ModelAttribute SaleOrder saleOrder,Model model)
	{
		service.saveSaleOrder(saleOrder);
		String message="Saved Successfully";
		model.addAttribute("message",message);
		SaleOrder so=new SaleOrder();
		so.setDefaultStatus("SALE-OPEN");
		model.addAttribute("saleOrder",so);
		commonUi(model);
		return "SaleOrderRegister";
	}
	@RequestMapping("/all")
	public String getAllSaleOrderData(Model model)
	{
		List<SaleOrder> list=service.getAllSaleOrders();
		model.addAttribute("list",list);
		return "SaleOrderData";
		
	}
	@RequestMapping("/edit")
	public String editSaleOrder(@RequestParam Integer soid,Model model)
	{
		SaleOrder so=service.getOneSaleOrder(soid);
		model.addAttribute("saleOrder",so);
		commonUi(model);
		return "SaleOrderEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updateSaleOrder(@ModelAttribute SaleOrder saleOrder,Model model)
	{
		service.updateSaleOrder(saleOrder);
		List<SaleOrder> list=service.getAllSaleOrders();
		model.addAttribute("list",list);
		return "SaleOrderData";
	}
	@RequestMapping("/delete")
	public String deleteSaleOrder(@RequestParam Integer soid)
	{
		service.deleteSaleOrder(soid);
		return "redirect:all";
	}

}
