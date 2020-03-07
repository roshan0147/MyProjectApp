package in.nit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.nit.model.PurchaseOrder;
import in.nit.service.IPurchaseOrderService;

@Controller
@RequestMapping("/purchaseOrder")
public class PurchaseOrderController {
	
	@Autowired
	private IPurchaseOrderService service;
	@RequestMapping("/register")
	public String showRegisterPage(Model model)
	{
		model.addAttribute("purchaseOrder",new PurchaseOrder());
		return "PurchaseOrderRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String savePurchaseOrder(@ModelAttribute PurchaseOrder purchaseOrder,Model model)
	{
		Integer id=service.savePurchaseOrder(purchaseOrder);
		String message=id+" Saved";
		model.addAttribute("message",message);
		model.addAttribute("purchaseOrder",new PurchaseOrder());
		return "PurchaseOrderRegister";
	}
	@RequestMapping("/all")
	public String showAllData(Model model)
	{
		List<PurchaseOrder> list=service.getAllPurchaseOrders();
		model.addAttribute("list",list);
		return "PurchaseOrderData";
	}

}
