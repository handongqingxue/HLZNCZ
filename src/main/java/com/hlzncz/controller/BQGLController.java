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
@RequestMapping("/"+BQGLController.MODULE_NAME)
public class BQGLController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private YunShuShangService yunShuShangService;
	@Autowired
	private WuZiService wuZiService;
	@Autowired
	private FaHuoDanWeiService faHuoDanWeiService;
	@Autowired
	private ShouHuoDanWeiService shouHuoDanWeiService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private SiJiService siJiService;
	@Autowired
	private BangDanService bangDanService;
	public static final String MODULE_NAME="bqgl";

	@RequestMapping(value="/wgjc/ybwj/list")
	public String goBqglWgjcYbwjList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_JIAN_YAN);
		
		return MODULE_NAME+"/wgjc/ybwj/list";
	}

	@RequestMapping(value="/wgjc/ybwj/detail")
	public String goBqglWgjcYbwjDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		BangDan bd=bangDanService.selectBangDanByDdbm(wybm);
		request.setAttribute("bd", bd);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wgjc/ybwj/detail";
	}

	@RequestMapping(value="/wgjc/ebwj/edit")
	public String goBqglWgjcEbwjEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		BangDan bd=bangDanService.selectBangDanByDdbm(wybm);
		request.setAttribute("bd", bd);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wgjc/ebwj/edit";
	}

	@RequestMapping(value="/wgjc/ebwj/list")
	public String goBqglWgjcEbwjList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_ZHUANG_XIE_HUO);
		
		return MODULE_NAME+"/wgjc/ebwj/list";
	}
	
	@RequestMapping(value="/queryBqglWgjcYbwjList")
	@ResponseBody
	public Map<String, Object> queryBqglWgjcYbwjList(String ddh,String ddztId,String cph,String jhysrq,String wlmc,String fhdwmc,String shdwmc,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryBqglWgjcYbwjForInt(ddh,ddztId,cph,jhysrq,wlmc,fhdwmc,shdwmc);
			List<DingDan> ybwjList=dingDanService.queryBqglWgjcYbwjList(ddh, ddztId,cph,jhysrq,wlmc,fhdwmc,shdwmc, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ybwjList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/queryBqglWgjcEbwjList")
	@ResponseBody
	public Map<String, Object> queryBqglWgjcEbwjList(String ddh,String ddztId,String cph,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryBqglWgjcEbwjForInt(ddh,ddztId,cph);
			List<DingDan> ybwjList=dingDanService.queryBqglWgjcEbwjList(ddh, ddztId,cph, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ybwjList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/editErBangWaiJian")
	@ResponseBody
	public Map<String, Object> editErBangWaiJian(BangDan bd,
			@RequestParam(value="dfbdzp_file",required=false) MultipartFile dfbdzp_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[1];
			fileArr[0]=dfbdzp_file;
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
								bd.setDfbdzp(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=bangDanService.editErBangWaiJian(bd);
			count=dingDanService.updateDingDanZT(DingDan.DAI_ER_JIAN_SHANG_BANG,bd.getDdbm());
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑二磅外检成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑二磅外检失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
}
