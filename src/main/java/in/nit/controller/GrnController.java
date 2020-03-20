package in.nit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import in.nit.model.Grn;

@Controller
@RequestMapping("/grn")
public class GrnController {
     
	@RequestMapping("/register")
	public String grnRegitserPage(Model model)
	{
		model.addAttribute("grn",new Grn());
		return "GrnRegister";
	}
}
