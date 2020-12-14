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
@RequestMapping("/"+BQGLController.MODULE_NAME)
public class BQGLController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	public static final String MODULE_NAME="bqgl";

	@RequestMapping(value="/wgjc/ybwj/list")
	public String goWzlxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/wgjc/ybwj/list";
	}
	
	@RequestMapping(value="/queryBqglWgjcYbwjList")
	@ResponseBody
	public Map<String, Object> queryBqglWgjcYbwjList(String ddh,String cph,String jhysrq,String wlmc,String fhdwmc,String shdwmc,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryBqglWgjcYbwjForInt(ddh,cph,jhysrq,wlmc,fhdwmc,shdwmc);
			List<DingDan> zhglList=dingDanService.queryBqglWgjcYbwjList(ddh, cph,jhysrq,wlmc,fhdwmc,shdwmc, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
}
