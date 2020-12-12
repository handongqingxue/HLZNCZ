package com.hlzncz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Controller
@RequestMapping("/"+JHXTController.MODULE_NAME)
public class JHXTController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DuiLieService duiLieService;
	@Autowired
	private HaoMaService haoMaService;
	@Autowired
	private ShouHuoDanWeiService shouHuoDanWeiService;
	public static final String MODULE_NAME="jhxt";

	@RequestMapping(value="/jhxx/hmcx/new")
	public String goHmcxNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/jhxx/hmcx/new";
	}

	@RequestMapping(value="/jhxx/hmcx/list")
	public String goHmcxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/jhxx/hmcx/list";
	}
	
	@RequestMapping(value="/pzgl/dlgl/new")
	public String goJhxtPzglDlglNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/pzgl/dlgl/new";
	}

	@RequestMapping(value="/pzgl/dlgl/edit")
	public String goJhxtPzglDlglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/pzgl/dlgl/edit";
	}

	@RequestMapping(value="/pzgl/dlgl/list")
	public String goJhxtPzglDlglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/pzgl/dlgl/list";
	}

	@RequestMapping(value="/pzgl/dlgl/detail")
	public String goJhxtPzglDlglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/pzgl/dlgl/detail";
	}

	@RequestMapping(value="/queryHaoMaList")
	@ResponseBody
	public Map<String, Object> queryHaoMaList(String hm,String pdh,Integer ztId,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = haoMaService.queryHaoMaForInt(hm, pdh, ztId);
		List<HaoMa> hmList=haoMaService.queryHaoMaList(hm, pdh, ztId, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", hmList);
		
		return jsonMap;
	}
}
