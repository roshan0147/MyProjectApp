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

import in.nit.model.PurchaseOrder;
import in.nit.service.IPurchaseOrderService;
import in.nit.service.IShipmentTypeService;
import in.nit.service.IWhUserTypeService;
import in.nit.util.CommonUtil;

@Controller
@RequestMapping("/purchaseOrder")
public class PurchaseOrderController {
	
	@Autowired
	private IPurchaseOrderService service;
	@Autowired
	private IShipmentTypeService shipmentService;
	@Autowired
	private IWhUserTypeService whuserService;
	private void commonUi(Model model)
	{
		List<Object[]> shipList=shipmentService.getShipmentIdAndCode();
		Map<Integer,String> shipMap=CommonUtil.convert(shipList);
		model.addAttribute("shipMap",shipMap);
		
		List<Object[]> whVendorList=whuserService.getWhUserTypeIdAndUserCode("Vendor");
	    Map<Integer,String> whVendorMap=CommonUtil.convert(whVendorList);
	    model.addAttribute("whVendorMap",whVendorMap);
	}
	@RequestMapping("/register")
	public String showRegisterPage(Model model)
	{
		PurchaseOrder po=new PurchaseOrder();
		po.setDefaultStatus("OPEN");
		model.addAttribute("purchaseOrder",po);
		commonUi(model);
		return "PurchaseOrderRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String savePurchaseOrder(@ModelAttribute PurchaseOrder purchaseOrder,Model model)
	{
		service.savePurchaseOrder(purchaseOrder);
		String message="Saved Successfully";
		model.addAttribute("message",message);
		PurchaseOrder po=new PurchaseOrder();
		po.setDefaultStatus("OPEN");
		model.addAttribute("purchaseOrder",po);
		return "PurchaseOrderRegister";
	}
	@RequestMapping("/all")
	public String showAllData(Model model)
	{
		List<PurchaseOrder> list=service.getAllPurchaseOrders();
		model.addAttribute("list",list);
		return "PurchaseOrderData";
	}
	@RequestMapping("/edit")
	public String showEditPage(@RequestParam Integer poid,Model model)
	{
		PurchaseOrder po=service.getOnePurchaseOrder(poid);
		model.addAttribute("purchaseOrder",po);
		commonUi(model);
		return "PurchaseOrderEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updatePurchaseOrder(@ModelAttribute PurchaseOrder purchaseOrder,Model model)
	{
		service.updatePurchaseOrder(purchaseOrder);
		return "redirect:all";
	}
	@RequestMapping("/delete")
	public String deletePurchaseOrder(@RequestParam Integer poid)
	{
		service.deletePurchaseOrder(poid);
		return "redirect:all";
	}

}
