package com.hlzncz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;
import com.hlzncz.util.FileUploadUtils;
import com.hlzncz.util.JsonUtil;
import com.hlzncz.util.PlanResult;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/"+XTGLController.MODULE_NAME)
public class XTGLController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private YongHuService yongHuService;
	public static final String MODULE_NAME="xtgl";

	@RequestMapping(value="/yhqx/yhgl/new")
	public String goXtglYhqxYhglNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/yhqx/yhgl/new";
	}

	@RequestMapping(value="/yhqx/yhgl/edit")
	public String goXtglYhqxYhglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		YongHu yh=yongHuService.selectYongHuById(id);
		request.setAttribute("yh", yh);
		
		return MODULE_NAME+"/yhqx/yhgl/edit";
	}
	
	@RequestMapping(value="/yhqx/yhgl/list")
	public String goXtglYhqxYhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/yhqx/yhgl/list";
	}

	@RequestMapping(value="/newYongHu")
	@ResponseBody
	public Map<String, Object> newYongHu(YongHu yh,
			@RequestParam(value="tx_file",required=false) MultipartFile tx_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			MultipartFile[] fileArr=new MultipartFile[3];
			fileArr[0]=tx_file;
			for (int i = 0; i < fileArr.length; i++) {
				String jsonStr = null;
				if(fileArr[i]!=null) {
					if(fileArr[i].getSize()>0) {
						jsonStr = FileUploadUtils.appUploadContentImg(request,fileArr[i],"");
						JSONObject fileJson = JSONObject.fromObject(jsonStr);
						if("成功".equals(fileJson.get("msg"))) {
							JSONObject dataJO = (JSONObject)fileJson.get("data");
							switch (i) {
							case 0:
								yh.setTx(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=yongHuService.newYongHu(yh);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建用户信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建用户信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteYongHu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteYongHu(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=yongHuService.deleteYongHu(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除用户信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除用户信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/queryYongHuList")
	@ResponseBody
	public Map<String, Object> queryYongHuList(String yhm,Integer zt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = yongHuService.queryYongHuForInt(yhm, zt);
		List<YongHu> yhList=yongHuService.queryYongHuList(yhm, zt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yhList);
		
		return jsonMap;
	}
}
