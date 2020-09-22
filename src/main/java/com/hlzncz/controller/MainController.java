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
import com.hlzncz.entity.*;
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

	@RequestMapping(value="/jcxx/wzgl/wzlx/new")
	public String goWzlxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzlx/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/edit")
	public String goWzlxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/edit";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/list")
	public String goWzlxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzlx/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/detail")
	public String goWzlxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/detail";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/new")
	public String goWzglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzgl/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/edit")
	public String goWzglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/edit";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/list")
	public String goWzglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzgl/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/detail")
	public String goWzglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/detail";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/new")
	public String goClxxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/clxx/new";
	}
	
	@RequestMapping(value="/jcxx/clgl/clxx/edit")
	public String goClxxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clxx/edit";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/list")
	public String goClxxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/clgl/clxx/list";
	}

	@RequestMapping(value="/jcxx/clgl/clxx/detail")
	public String goClxxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clxx/detail";
	}

	@RequestMapping(value="/jcxx/sjgl/sjxx/new")
	public String goSjxxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/sjgl/sjxx/new";
	}

	@RequestMapping(value="/jcxx/sjgl/sjxx/edit")
	public String goSjxxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/sjxx/edit";
	}

	@RequestMapping(value="/jcxx/sjgl/sjxx/list")
	public String goSjxxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/sjgl/sjxx/list";
	}

	@RequestMapping(value="/jcxx/sjgl/sjxx/detail")
	public String goSjxxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/sjxx/detail";
	}

	@RequestMapping(value="/jcxx/dwgl/fhdw/new")
	public String goFhdwNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/dwgl/fhdw/new";
	}

	@RequestMapping(value="/jcxx/dwgl/fhdw/edit")
	public String goFhdwEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(id);
		request.setAttribute("fhdw", fhdw);
		
		return "jcxx/dwgl/fhdw/edit";
	}

	@RequestMapping(value="/jcxx/dwgl/fhdw/list")
	public String goFhdwList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/fhdw/list";
	}

	@RequestMapping(value="/jcxx/dwgl/fhdw/detail")
	public String goFhdwDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(id);
		request.setAttribute("fhdw", fhdw);
		
		return "jcxx/dwgl/fhdw/detail";
	}

	@RequestMapping(value="/jcxx/dwgl/shdw/new")
	public String goShdwNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/shdw/new";
	}

	@RequestMapping(value="/jcxx/dwgl/shdw/list")
	public String goShdwList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/shdw/list";
	}

	@RequestMapping(value="/jcxx/dwgl/yss/new")
	public String goYssNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/yss/new";
	}

	@RequestMapping(value="/jcxx/dwgl/yss/edit")
	public String goYssEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=publicService.selectYunShuShangById(id);
		request.setAttribute("yss", yss);
		
		return "jcxx/dwgl/yss/edit";
	}

	@RequestMapping(value="/jcxx/dwgl/yss/list")
	public String goYssList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/yss/list";
	}

	@RequestMapping(value="/jcxx/dwgl/yss/detail")
	public String goYssDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=publicService.selectYunShuShangById(id);
		request.setAttribute("yss", yss);
		
		return "jcxx/dwgl/yss/detail";
	}

	@RequestMapping(value="/jcxx/ckgl/ckgl/new")
	public String goCkglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/ckgl/ckgl/new";
	}

	@RequestMapping(value="/jcxx/ckgl/ckgl/edit")
	public String goCkglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CangKu ck=publicService.selectCangKuById(id);
		request.setAttribute("ck", ck);
		
		return "jcxx/ckgl/ckgl/edit";
	}
	
	@RequestMapping(value="/jcxx/ckgl/ckgl/list")
	public String goCkglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/ckgl/ckgl/list";
	}

	@RequestMapping(value="/jcxx/ckgl/ckgl/detail")
	public String goCkglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CangKu ck=publicService.selectCangKuById(id);
		request.setAttribute("ck", ck);
		
		return "jcxx/ckgl/ckgl/detail";
	}

	@RequestMapping(value="/jcxx/kpgl/kpsl/new")
	public String goKpslNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/kpgl/kpsl/new";
	}

	@RequestMapping(value="/jcxx/kpgl/kpsl/edit")
	public String goKpslEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		KaPianShenLing kpsl=publicService.selectKaPianShenLingById(id);
		request.setAttribute("kpsl", kpsl);
		
		return "jcxx/kpgl/kpsl/edit";
	}

	@RequestMapping(value="/jcxx/kpgl/kpsl/list")
	public String goKpslList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/kpgl/kpsl/list";
	}

	@RequestMapping(value="/jcxx/kpgl/kpsl/detail")
	public String goKpslDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		KaPianShenLing kpsl=publicService.selectKaPianShenLingById(id);
		request.setAttribute("kpsl", kpsl);
		
		return "jcxx/kpgl/kpsl/detail";
	}
	
	@RequestMapping(value="/jcxx/kpgl/kpwh/new")
	public String goKpwhNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/kpgl/kpwh/new";
	}

	@RequestMapping(value="/jcxx/kpgl/kpwh/edit")
	public String goKpwhEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		KaPianWeiHu kpwh=publicService.selectKaPianWeiHuById(id);
		request.setAttribute("kpwh", kpwh);
		
		return "jcxx/kpgl/kpwh/edit";
	}

	@RequestMapping(value="/jcxx/kpgl/kpwh/list")
	public String goKpwhList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/kpgl/kpwh/list";
	}
	
	@RequestMapping(value="/jcxx/jhpz/dlgl/new")
	public String goDlglNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/jhpz/dlgl/new";
	}
	
	@RequestMapping(value="/jcxx/jhpz/dlgl/list")
	public String goDlglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/jhpz/dlgl/list";
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
	
	@RequestMapping(value="/newSiJi")
	@ResponseBody
	public Map<String, Object> newSiJi(SiJi sj,
			@RequestParam(value="zp_file",required=false) MultipartFile zp_file,
			@RequestParam(value="jz_file",required=false) MultipartFile jz_file,
			@RequestParam(value="zgzs_file",required=false) MultipartFile zgzs_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			MultipartFile[] fileArr=new MultipartFile[3];
			fileArr[0]=zp_file;
			fileArr[1]=jz_file;
			fileArr[2]=zgzs_file;
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
								sj.setZp(dataJO.get("src").toString());
								break;
							case 1:
								sj.setJz(dataJO.get("src").toString());
								break;
							case 2:
								sj.setZgzs(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.newSiJi(sj);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建司机信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建司机信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/deleteSiJi",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteSiJi(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteSiJi(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除司机信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除司机信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/editSiJi")
	@ResponseBody
	public Map<String, Object> editSiJi(SiJi sj,
			@RequestParam(value="zp_file",required=false) MultipartFile zp_file,
			@RequestParam(value="jz_file",required=false) MultipartFile jz_file,
			@RequestParam(value="zgzs_file",required=false) MultipartFile zgzs_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[3];
			fileArr[0]=zp_file;
			fileArr[1]=jz_file;
			fileArr[2]=zgzs_file;
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
								sj.setZp(dataJO.get("src").toString());
								break;
							case 1:
								sj.setJz(dataJO.get("src").toString());
								break;
							case 2:
								sj.setZgzs(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.editSiJi(sj);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑司机信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑司机信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/querySiJiList")
	@ResponseBody
	public Map<String, Object> querySiJiList(String xm,String sfz,Integer zyzt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.querySiJiForInt(xm,sfz,zyzt);
		List<SiJi> sjList=publicService.querySiJiList(xm,sfz,zyzt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", sjList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newFaHuoDanWei")
	@ResponseBody
	public Map<String, Object> newFaHuoDanWei(FaHuoDanWei fhdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newFaHuoDanWei(fhdw);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建发货单位成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建发货单位失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/deleteFaHuoDanWei",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteFaHuoDanWei(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteFaHuoDanWei(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除发货单位失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除发货单位成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	@RequestMapping(value="/editFaHuoDanWei")
	@ResponseBody
	public Map<String, Object> editFaHuoDanWei(FaHuoDanWei fhdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editFaHuoDanWei(fhdw);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑发货单位成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑发货单位失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryFaHuoDanWeiList")
	@ResponseBody
	public Map<String, Object> queryFaHuoDanWeiList(String dwmc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryFaHuoDanWeiForInt(dwmc);
		List<FaHuoDanWei> fhdwList=publicService.queryFaHuoDanWeiList(dwmc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", fhdwList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newShouHuoDanWei")
	@ResponseBody
	public Map<String, Object> newShouHuoDanWei(ShouHuoDanWei shdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newShouHuoDanWei(shdw);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建收货单位成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建收货单位失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteShouHuoDanWei",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteShouHuoDanWei(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteShouHuoDanWei(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除收货单位失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除收货单位成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/queryShouHuoDanWeiList")
	@ResponseBody
	public Map<String, Object> queryShouHuoDanWeiList(String dwmc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryShouHuoDanWeiForInt(dwmc);
		List<ShouHuoDanWei> shdwList=publicService.queryShouHuoDanWeiList(dwmc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", shdwList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newYunShuShang")
	@ResponseBody
	public Map<String, Object> newYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newYunShuShang(yss);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建运输商成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建运输商失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryYunShuShangList")
	@ResponseBody
	public Map<String, Object> queryYunShuShangList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryYunShuShangForInt(mc);
		List<YunShuShang> yssList=publicService.queryYunShuShangList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yssList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newCangKu")
	@ResponseBody
	public Map<String, Object> newCangKu(CangKu ck) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newCangKu(ck);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建仓库成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建仓库失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteCangKu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteCangKu(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteCangKu(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除仓库失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除仓库成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/deleteYuShuShang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteYuShuShang(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteYuShuShang(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除运输商失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除运输商成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/editCangKu")
	@ResponseBody
	public Map<String, Object> editCangKu(CangKu ck) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editCangKu(ck);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑仓库成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑仓库失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editKaPianWeiHu")
	@ResponseBody
	public Map<String, Object> editKaPianWeiHu(KaPianWeiHu kpwh) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editKaPianWeiHu(kpwh);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑卡片维护成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑卡片维护失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editYunShuShang")
	@ResponseBody
	public Map<String, Object> editYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editYunShuShang(yss);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑运输商成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑运输商失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryCangKuList")
	@ResponseBody
	public Map<String, Object> queryCangKuList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryCangKuForInt(mc);
		List<CangKu> ckList=publicService.queryCangKuList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", ckList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newKaPianShenLing")
	@ResponseBody
	public Map<String, Object> newKaPianShenLing(KaPianShenLing kpsl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newKaPianShenLing(kpsl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建卡片申领成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建卡片申领失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteKaPianShenLing",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteKaPianShenLing(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteKaPianShenLing(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除卡片申领失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除卡片申领成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/editKaPianShenLing")
	@ResponseBody
	public Map<String, Object> editKaPianShenLing(KaPianShenLing kpsl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editKaPianShenLing(kpsl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑卡片申领信息成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑卡片申领信息失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryKaPianShenLingList")
	@ResponseBody
	public Map<String, Object> queryKaPianShenLingList(String sfzh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryKaPianShenLingForInt(sfzh);
		List<KaPianShenLing> kpslList=publicService.queryKaPianShenLingList(sfzh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", kpslList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newKaPianWeiHu")
	@ResponseBody
	public Map<String, Object> newKaPianWeiHu(KaPianWeiHu kpwh) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newKaPianWeiHu(kpwh);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建卡片维护成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建卡片维护失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryKaPianWeiHuList")
	@ResponseBody
	public Map<String, Object> queryKaPianWeiHuList(String kh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryKaPianWeiHuForInt(kh);
		List<KaPianWeiHu> kpwhList=publicService.queryKaPianWeiHuList(kh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", kpwhList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newDuiLie")
	@ResponseBody
	public Map<String, Object> newDuiLie(DuiLie dl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newDuiLie(dl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建队列成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建队列失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryDuiLieList")
	@ResponseBody
	public Map<String, Object> queryDuiLieList(String mc,String dm,Integer zt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryDuiLieForInt(mc, dm, zt);
		List<DuiLie> dlList=publicService.queryDuiLieList(mc, dm, zt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", dlList);
		
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
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) {
		System.out.println("退出接口");
		Subject currentUser = SecurityUtils.getSubject();       
	    currentUser.logout();    
		return "login";
	}
}
