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
import org.springframework.web.servlet.ModelAndView;

import in.nit.model.PurchaseDtl;
import in.nit.model.PurchaseOrder;
import in.nit.service.IPartService;
import in.nit.service.IPurchaseOrderService;
import in.nit.service.IShipmentTypeService;
import in.nit.service.IWhUserTypeService;
import in.nit.util.CommonUtil;
import in.nit.view.VendorInvoicePdf;

@Controller
@RequestMapping("/purchaseOrder")
public class PurchaseOrderController {
	@Autowired
	private IPartService partService;
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
		commonUi(model);
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
	@RequestMapping("/parts")
    public String showChilds(@RequestParam("poid")Integer poid,Model model) {
    	PurchaseOrder po=service.getOnePurchaseOrder(poid);
    	model.addAttribute("parent",po);
    	model.addAttribute("purchaseDtl",new PurchaseDtl());
		List<Object[]> partsList=partService.getPartIdAndCodes();
		Map<Integer,String> partsMap=CommonUtil.convert(partsList);
		model.addAttribute("partsMap",partsMap);
		List<PurchaseDtl> childs=po.getChilds();
		int i=1;
		for(PurchaseDtl dtl:childs)
		{
			dtl.setSlno(i++);
		}
		model.addAttribute("childs",childs);
    	return "PurchaseParts";
    }
	@RequestMapping(value="/addPart",method = RequestMethod.POST)
	public String addPart(@ModelAttribute PurchaseDtl purchaseDtl) {
		service.savePurchaseDtl(purchaseDtl);
		Integer poid=purchaseDtl.getPo().getPoId();
		service.updatePoStatus(poid, "PICKING");
		return "redirect:parts?poid="+poid;
	}
	@RequestMapping("/removePart")
	public String deletePart(
			@RequestParam("dtlId")Integer dtlId,
			@RequestParam("poId")Integer poId
			) 
	{
		service.deletePurchaseDtl(dtlId);
		if(service.getOnePurchaseOrder(poId).getChilds().isEmpty()) {
			service.updatePoStatus(poId, "OPEN");
		}
		return "redirect:parts?poid="+poId;
	}
	@RequestMapping("/placeOrder")
	public String placeOrderConfirm(
			@RequestParam("poId")Integer poId
			) 
	{
		service.updatePoStatus(poId, "ORDERED");
		return "redirect:parts?poid="+poId;
	}
	@RequestMapping("/invoceOrder")
	public String placeOrderForInvoice(
			@RequestParam("poId")Integer poId
			) 
	{
		service.updatePoStatus(poId, "INVOICED");
		return "redirect:all";
	}
	@RequestMapping("/downloadInvoce")
	public ModelAndView downloadInvoiceAsPdf(
			@RequestParam("poId")Integer id
			)
	{
		PurchaseOrder po=service.getOnePurchaseOrder(id);
		ModelAndView m=new ModelAndView();
		m.setView(new VendorInvoicePdf());
		m.addObject("po", po);
		return m;
	}
}
