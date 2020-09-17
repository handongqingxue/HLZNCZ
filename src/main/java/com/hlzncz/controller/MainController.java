package com.hlzncz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hlzncz.util.JsonUtil;
import com.hlzncz.util.PlanResult;

import net.sf.json.JSONObject;

import com.hlzncz.util.FileUploadUtils;
import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.CheLiang;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;
import com.hlzncz.entity.YongHu;
import com.hlzncz.service.PublicService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private PublicService publicService;
	
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	@RequestMapping(value="/goIndex")
	public String goIndex(HttpServletRequest request) {
		
		selectNav(request);
		
		return "index";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/list")
	public String goWzlxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzlx/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/new")
	public String goWzlxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzlx/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/detail")
	public String goWzlxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/detail";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/edit")
	public String goWzlxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/edit";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/list")
	public String goWzglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzgl/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/new")
	public String goWzglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzgl/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/detail")
	public String goWzglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/detail";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/edit")
	public String goWzglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/edit";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/list")
	public String goClxxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/clgl/clxx/list";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/new")
	public String goClxxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/clxx/new";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/detail")
	public String goClxxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clxx/detail";
	}
	
	@RequestMapping(value="/jcxx/clgl/clxx/edit")
	public String goClxxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clxx/edit";
	}
	
	/**
	 * 查询物资类型
	 * @param mc
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/queryWuZiLeiXingList")
	@ResponseBody
	public Map<String, Object> queryWuZiLeiXingList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryWuZiLeiXingForInt(mc);
		List<WuZiLeiXing> wzlxList=publicService.queryWuZiLeiXingList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", wzlxList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newWuZiLeiXing")
	@ResponseBody
	public Map<String, Object> newWuZiLeiXing(WuZiLeiXing wzlx) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newWuZiLeiXing(wzlx);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建物资类型成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建物资类型失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/editWuZiLeiXing")
	@ResponseBody
	public Map<String, Object> editWuZiLeiXing(WuZiLeiXing wzlx) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editWuZiLeiXing(wzlx);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑物资类型成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑物资类型失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/deleteWuZiLeiXing",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWuZiLeiXing(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteWuZiLeiXing(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除物资类型失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除物资类型成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/queryWuZiList")
	@ResponseBody
	public Map<String, Object> queryWuZiList(String mc,String wzlxmc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryWuZiForInt(mc,wzlxmc);
		List<WuZi> wzList=publicService.queryWuZiList(mc, wzlxmc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", wzList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newWuZi")
	@ResponseBody
	public Map<String, Object> newWuZi(WuZi wz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newWuZi(wz);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建物资成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建物资失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editWuZi")
	@ResponseBody
	public Map<String, Object> editWuZi(WuZi wz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editWuZi(wz);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑物资成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑物资失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteWuZi",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWuZi(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteWuZi(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除物资失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除物资成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/deleteCheLiang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteCheLiang(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteCheLiang(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除车辆信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除车辆信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/queryCheLiangList")
	@ResponseBody
	public Map<String, Object> queryCheLiangList(String cph,Integer cllx,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryCheLiangForInt(cph,cllx);
		List<CheLiang> clList=publicService.queryCheLiangList(cph, cllx, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", clList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newCheLiang")
	@ResponseBody
	public Map<String, Object> newCheLiang(CheLiang cl,
			@RequestParam(value="zp_file",required=false) MultipartFile zp_file,
			@RequestParam(value="xsz_file",required=false) MultipartFile xsz_file,
			@RequestParam(value="scqd_file",required=false) MultipartFile scqd_file,
			@RequestParam(value="pfjdcxjt_file",required=false) MultipartFile pfjdcxjt_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			MultipartFile[] fileArr=new MultipartFile[4];
			fileArr[0]=zp_file;
			fileArr[1]=xsz_file;
			fileArr[2]=scqd_file;
			fileArr[3]=pfjdcxjt_file;
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
								cl.setZp(dataJO.get("src").toString());
								break;
							case 1:
								cl.setXsz(dataJO.get("src").toString());
								break;
							case 2:
								cl.setScqd(dataJO.get("src").toString());
								break;
							case 3:
								cl.setPfjdcxjt(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.newCheLiang(cl);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建车辆信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建车辆信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/editCheLiang")
	@ResponseBody
	public Map<String, Object> editCheLiang(CheLiang cl,
			@RequestParam(value="zp_file",required=false) MultipartFile zp_file,
			@RequestParam(value="xsz_file",required=false) MultipartFile xsz_file,
			@RequestParam(value="scqd_file",required=false) MultipartFile scqd_file,
			@RequestParam(value="pfjdcxjt_file",required=false) MultipartFile pfjdcxjt_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[4];
			fileArr[0]=zp_file;
			fileArr[1]=xsz_file;
			fileArr[2]=scqd_file;
			fileArr[3]=pfjdcxjt_file;
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
								cl.setZp(dataJO.get("src").toString());
								break;
							case 1:
								cl.setXsz(dataJO.get("src").toString());
								break;
							case 2:
								cl.setScqd(dataJO.get("src").toString());
								break;
							case 3:
								cl.setPfjdcxjt(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.editCheLiang(cl);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑车辆信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑车辆信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST,produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String login(Model model,String yhm,String ysmm,HttpServletRequest request) {
		System.out.println("===登录接口===");
		//返回值的json
		PlanResult plan=new PlanResult();
		HttpSession session=request.getSession();
		//TODO在这附近添加登录储存信息步骤，将用户的账号以及密码储存到shiro框架的管理配置当中方便后续查询
		try {
			//System.out.println("验证码一致");
			UsernamePasswordToken token = new UsernamePasswordToken(yhm,ysmm);
			Subject currentUser = SecurityUtils.getSubject();  
			if (!currentUser.isAuthenticated()){
				//使用shiro来验证  
				token.setRememberMe(true);  
				currentUser.login(token);//验证角色和权限  
			}
		}catch (Exception e) {
			e.printStackTrace();
			plan.setStatus(1);
			plan.setMsg("登陆失败");
			return JsonUtil.getJsonFromObject(plan);
		}
		YongHu yh=(YongHu)SecurityUtils.getSubject().getPrincipal();
		session.setAttribute("yongHu", yh);
		
		plan.setStatus(0);
		plan.setMsg("验证通过");
		plan.setUrl("main/goIndex");
		return JsonUtil.getJsonFromObject(plan);
	}
	
	private void selectNav(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicService.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		String fnid = request.getParameter("fnid");
		Integer parId = null;
		if(StringUtils.isEmpty(fnid)) {
			parId = leftNavList.get(0).getId();
		}
		else {
			parId=Integer.parseInt(fnid);
		}
		List<CaiDan> topNavList = publicService.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicService.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
	}
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) {
		System.out.println("退出接口");
		Subject currentUser = SecurityUtils.getSubject();       
	    currentUser.logout();    
		return "login";
	}
}
