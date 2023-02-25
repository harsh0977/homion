package com.homion.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GeneralController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	private ModelAndView general() {
		return new ModelAndView("general");
	}

}
