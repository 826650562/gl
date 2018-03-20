package com.soecode.lyf.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soecode.lyf.service.ModeSevice;

@Controller
@RequestMapping("/page")
public class IndexController {

	@Autowired
	private ModeSevice modeSevice;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	private String index(Model model) {
		String[] types = modeSevice.getTypes();
		model.addAttribute("_types", types);
		return "/page/index";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	private String detail(Model model,HttpServletRequest request) {
		String tag_id = (String) request.getParameter("tag_id");
		model.addAttribute("tag_id", tag_id);
		return "/page/detail2";
	}
	
	@RequestMapping(value = "/loadMode", method = RequestMethod.GET)
	private String loadMode(Model model) {
		return "/page/mode2";
	}
	
	@RequestMapping(value = "/casedetail", method = RequestMethod.GET)
	private String casedetail(Model model) {
		return "/page/casedetail";
	}
	
	@RequestMapping(value = "/ydy", method = RequestMethod.GET)
	private String ydy(Model model) {
		return "/page/ydy";
	}
	
	@RequestMapping(value = "head", method = RequestMethod.GET)
	private String head(Model model) {
		return "/page/head";
	}
	
}
