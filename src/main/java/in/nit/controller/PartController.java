package in.nit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import in.nit.model.Part;
import in.nit.service.IPartService;

@Controller
@RequestMapping("/part")
public class PartController {
	@Autowired
	private IPartService service;
	
	@RequestMapping("/register")
	public String partRegisterPage(Model model)
	{
		model.addAttribute("part",new Part());
		return "PartRegister";
	}
	@RequestMapping(value="/save",method = RequestMethod.POST)
	public String savePartData(@ModelAttribute Part part,Model model)
	{
		Integer id=service.savePart(part);
		String message=id+" Saved";
		model.addAttribute("message",message);
		model.addAttribute("part",new Part());
	    return "PartRegister";	
	}
	@RequestMapping("/all")
	public String showPartData(Model model)
	{
		List<Part> list=service.getAllParts();
		model.addAttribute("list",list);
		return "PartData";
		
	}

}
