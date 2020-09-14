package com.hlzncz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public String toIndex(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicService.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		Integer parId = leftNavList.get(0).getId();
		List<CaiDan> topNavList = publicService.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicService.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
		
		return "index";
	}
}
