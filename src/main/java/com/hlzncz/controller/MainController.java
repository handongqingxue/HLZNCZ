package com.hlzncz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.service.PublicService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private PublicService publicService;
	
	@RequestMapping(value="/toIndex")
	public String toIndex() {
		
		CaiDan caiDan = publicService.selectParCaiDan();
		System.out.println("===="+caiDan.getMc());
		return "index";
	}
}
