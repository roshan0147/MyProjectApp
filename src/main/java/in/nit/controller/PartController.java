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

import in.nit.model.Part;
import in.nit.service.IPartService;
import in.nit.service.IUomService;
import in.nit.util.CommonUtil;

@Controller
@RequestMapping("/part")
public class PartController {
	@Autowired
	private IPartService service;
	@Autowired
	private IUomService uomService;
	private void commonUi(Model model)
	{
		List<Object[]> uomList=uomService.getUomIdAndUomModel();
		Map<Integer,String> uomMap=CommonUtil.convert(uomList);
		model.addAttribute("uomList",uomMap);
	}
	@RequestMapping("/register")
	public String partRegisterPage(Model model)
	{
		model.addAttribute("part",new Part());
		commonUi(model);
		return "PartRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String savePartData(@ModelAttribute Part part,Model model)
	{
		service.savePart(part);
		String message="Saved Successfully";
		model.addAttribute("message",message);
		model.addAttribute("part",new Part());
	    commonUi(model);
		return "PartRegister";	
	}
	@RequestMapping("/all")
	public String showPartData(Model model)
	{
		List<Part> list=service.getAllParts();
		model.addAttribute("list",list);
		return "PartData";
		
	}
	@RequestMapping("/delete")
	public String deletePart(@RequestParam Integer pid)
	{
		service.deletePart(pid);
		return "redirect:all";
	}
	@RequestMapping("/view")
	public String getOnePart(@RequestParam Integer pid,Model model)
	{
		Part p=service.getOnePart(pid);
		model.addAttribute("ob",p);
		return "PartView";
	}
	@RequestMapping("/edit")
	public String editPart(@RequestParam Integer pid,Model model)
	{
		Part p=service.getOnePart(pid);
		model.addAttribute("part",p);
		commonUi(model);
		return "PartEdit";
	}
	@RequestMapping(value="/update",method = RequestMethod.POST)
    public String updatePart(@ModelAttribute Part part,Model model)
    {
		service.updatePart(part);
		List<Part> list=service.getAllParts();
		model.addAttribute("list",list);
    	return "PartData";
    }
}
