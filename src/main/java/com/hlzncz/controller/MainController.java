package com.hlzncz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
		
		selectNav(request);
		
		return "index";
	}
	
	private void selectNav(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicService.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		String id = request.getParameter("id");
		Integer parId = null;
		if(StringUtils.isEmpty(id)) {
			parId = leftNavList.get(0).getId();
		}
		else {
			parId=Integer.parseInt(id);
		}
		List<CaiDan> topNavList = publicService.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicService.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
	}
}
