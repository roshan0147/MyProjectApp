package in.nit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import in.nit.model.Part;

@Controller
@RequestMapping("/part")
public class PartController {
	
	@RequestMapping("/register")
	public String partRegisterPage(Model model)
	{
		model.addAttribute("part",new Part());
		return "PartRegister";
	}

}
