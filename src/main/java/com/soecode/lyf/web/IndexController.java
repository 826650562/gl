package com.soecode.lyf.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soecode.lyf.service.ModeSevice;

@Controller
@RequestMapping("/page")
public class IndexController {

	@Resource(name = "ModeSevice")
	private ModeSevice modeSevice;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private String index(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "/page/index";
	}
	
	
	
	

}
