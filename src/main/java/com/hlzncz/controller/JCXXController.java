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
@RequestMapping("/"+JCXXController.MODULE_NAME)
public class JCXXController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private WuZiLeiXingService wuZiLeiXingService;
	@Autowired
	private WuZiService wuZiService;
	@Autowired
	private YunShuShangService yunShuShangService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private SiJiService siJiService;
	@Autowired
	private YongHuService yongHuService;
	@Autowired
	private FaHuoDanWeiService faHuoDanWeiService;
	@Autowired
	private ShouHuoDanWeiService shouHuoDanWeiService;
	@Autowired
	private DuiLieService duiLieService;
	@Autowired
	private CangKuService cangKuService;
	@Autowired
	private KaPianShenLingService kaPianShenLingService;
	@Autowired
	private KaPianWeiHuService kaPianWeiHuService;
	public static final String MODULE_NAME="jcxx";

	@RequestMapping(value="/wzgl/wzlx/new")
	public String goWzlxNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/wzgl/wzlx/new";
	}

	@RequestMapping(value="/wzgl/wzlx/edit")
	public String goWzlxEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=wuZiLeiXingService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return MODULE_NAME+"/wzgl/wzlx/edit";
	}

	@RequestMapping(value="/wzgl/wzlx/list")
	public String goWzlxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/wzgl/wzlx/list";
	}

	@RequestMapping(value="/wzgl/wzlx/detail")
	public String goWzlxDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=wuZiLeiXingService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return MODULE_NAME+"/wzgl/wzlx/detail";
	}

	@RequestMapping(value="/wzgl/wzgl/new")
	public String goWzglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/wzgl/wzgl/new";
	}

	@RequestMapping(value="/wzgl/wzgl/edit")
	public String goWzglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=wuZiService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return MODULE_NAME+"/wzgl/wzgl/edit";
	}

	@RequestMapping(value="/wzgl/wzgl/list")
	public String goWzglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/wzgl/wzgl/list";
	}

	@RequestMapping(value="/wzgl/wzgl/detail")
	public String goWzglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=wuZiService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return MODULE_NAME+"/wzgl/wzgl/detail";
	}

	@RequestMapping(value="/clgl/xzcl/new")
	public String goJcxxClglXzclNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/clgl/xzcl/new";
	}

	@RequestMapping(value="/clgl/xzcl/edit")
	public String goJcxxClglXzclEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/xzcl/edit";
	}

	@RequestMapping(value="/clgl/xzcl/list")
	public String goJcxxClglXzclList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("shzt", CheLiang.BIAN_JI_ZHONG);
		
		return MODULE_NAME+"/clgl/xzcl/list";
	}

	@RequestMapping(value="/clgl/xzcl/detail")
	public String goJcxxClglXzclDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/xzcl/detail";
	}

	@RequestMapping(value="/clgl/clsh/new")
	public String goJcxxClglClshNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/clgl/clsh/new";
	}

	@RequestMapping(value="/clgl/clsh/edit")
	public String goJcxxClglClshEdit(HttpServletRequest request) {

		publicService.selectNav(request);
		
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/clsh/edit";
	}

	@RequestMapping(value="/clgl/clsh/list")
	public String goJcxxClglClshList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("shzt", CheLiang.DAI_SHEN_HE);
		
		return MODULE_NAME+"/clgl/clsh/list";
	}

	@RequestMapping(value="/clgl/clsh/detail")
	public String goJcxxClglClshDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/clsh/detail";
	}

	@RequestMapping(value="/clgl/clcx/new")
	public String goJcxxClglClcxNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/clgl/clcx/new";
	}

	@RequestMapping(value="/clgl/clcx/list")
	public String goJcxxClglClcxList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("shzt", CheLiang.DAI_SHEN_HE+","+CheLiang.SHEN_HE_TONG_GUO);
		
		return MODULE_NAME+"/clgl/clcx/list";
	}

	@RequestMapping(value="/clgl/zhgl/new")
	public String goJcxxClglZhglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/clgl/zhgl/new";
	}
	
	@RequestMapping(value="/clgl/zhgl/edit")
	public String goJcxxClglZhglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/zhgl/edit";
	}

	@RequestMapping(value="/clgl/zhgl/list")
	public String goJcxxClglZhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/clgl/zhgl/list";
	}

	@RequestMapping(value="/clgl/zhgl/detail")
	public String goJcxxClglZhglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=cheLiangService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return MODULE_NAME+"/clgl/zhgl/detail";
	}

	@RequestMapping(value="/sjgl/tjsj/new")
	public String goJcxxSjglTjsjNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/sjgl/tjsj/new";
	}

	@RequestMapping(value="/sjgl/tjsj/edit")
	public String goJcxxSjglTjsjEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return MODULE_NAME+"/sjgl/tjsj/edit";
	}

	@RequestMapping(value="/sjgl/tjsj/list")
	public String goJcxxSjglTjsjList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("shzt", SiJi.BIAN_JI_ZHONG);
		
		return MODULE_NAME+"/sjgl/tjsj/list";
	}

	@RequestMapping(value="/sjgl/tjsj/detail")
	public String goJcxxSjglTjsjDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return MODULE_NAME+"/sjgl/tjsj/detail";
	}

	@RequestMapping(value="/sjgl/sjsh/edit")
	public String goJcxxSjglSjshEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return MODULE_NAME+"/sjgl/sjsh/edit";
	}

	@RequestMapping(value="/sjgl/sjsh/list")
	public String goJcxxSjglSjshList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("shzt", SiJi.DAI_SHEN_HE);
		
		return MODULE_NAME+"/sjgl/sjsh/list";
	}

	@RequestMapping(value="/sjgl/sjsh/detail")
	public String goJcxxSjglSjshDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return MODULE_NAME+"/sjgl/sjsh/detail";
	}

	@RequestMapping(value="/sjgl/xxcx/list")
	public String goJcxxSjglXxcxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/sjgl/xxcx/list";
	}

	@RequestMapping(value="/sjgl/zhgl/new")
	public String goJcxxSjglZhglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/sjgl/zhgl/new";
	}

	@RequestMapping(value="/sjgl/zhgl/edit")
	public String goJcxxSjglZhglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		YongHu glyh=yongHuService.selectYongHuById(String.valueOf(sj.getGlyhId()));
		request.setAttribute("glyh", glyh);
		
		return MODULE_NAME+"/sjgl/zhgl/edit";
	}

	@RequestMapping(value="/sjgl/zhgl/list")
	public String goJcxxSjglZhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/sjgl/zhgl/list";
	}

	@RequestMapping(value="/sjgl/zhgl/detail")
	public String goJcxxSjglZhglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=siJiService.selectSiJiById(id);
		request.setAttribute("sj", sj);

		YongHu glyh=yongHuService.selectYongHuById(String.valueOf(sj.getGlyhId()));
		request.setAttribute("glyh", glyh);
		
		return MODULE_NAME+"/sjgl/zhgl/detail";
	}

	@RequestMapping(value="/dwgl/fhdw/new")
	public String goFhdwNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/fhdw/new";
	}

	@RequestMapping(value="/dwgl/fhdw/edit")
	public String goFhdwEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(id);
		request.setAttribute("fhdw", fhdw);
		
		return MODULE_NAME+"/dwgl/fhdw/edit";
	}

	@RequestMapping(value="/dwgl/fhdw/list")
	public String goFhdwList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/fhdw/list";
	}

	@RequestMapping(value="/dwgl/fhdw/detail")
	public String goFhdwDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(id);
		request.setAttribute("fhdw", fhdw);
		
		return MODULE_NAME+"/dwgl/fhdw/detail";
	}

	@RequestMapping(value="/dwgl/dlshdw/edit")
	public String goJcxxDwglDlshdwEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=duiLieService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return MODULE_NAME+"/dwgl/dlshdw/edit";
	}

	@RequestMapping(value="/dwgl/dlshdw/list")
	public String goJcxxDwglDlshdwList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ywdl", ShouHuoDanWei.YOU_DUI_LIE);
		
		return MODULE_NAME+"/dwgl/dlshdw/list";
	}

	@RequestMapping(value="/dwgl/dlshdw/detail")
	public String goJcxxDwglDlshdwDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=duiLieService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return MODULE_NAME+"/dwgl/dlshdw/detail";
	}

	@RequestMapping(value="/dwgl/wdlshdw/edit")
	public String goJcxxDwglWdlshdwEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/dwgl/wdlshdw/edit";
	}

	@RequestMapping(value="/dwgl/wdlshdw/list")
	public String goJcxxDwglWdlshdwList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ywdl", ShouHuoDanWei.WU_DUI_LIE);
		
		return MODULE_NAME+"/dwgl/wdlshdw/list";
	}

	@RequestMapping(value="/dwgl/wdlshdw/detail")
	public String goJcxxDwglWdlshdwDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/dwgl/wdlshdw/detail";
	}

	@RequestMapping(value="/dwgl/qbshdw/new")
	public String goJcxxDwglQbshdwNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/qbshdw/new";
	}

	@RequestMapping(value="/dwgl/qbshdw/edit")
	public String goJcxxDwglQbshdwEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=duiLieService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return MODULE_NAME+"/dwgl/qbshdw/edit";
	}

	@RequestMapping(value="/dwgl/qbshdw/list")
	public String goJcxxDwglQbshdwList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/qbshdw/list";
	}

	@RequestMapping(value="/dwgl/qbshdw/detail")
	public String goJcxxDwglQbshdwDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=duiLieService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return MODULE_NAME+"/dwgl/qbshdw/detail";
	}

	@RequestMapping(value="/dwgl/yss/new")
	public String goYssNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/yss/new";
	}

	@RequestMapping(value="/dwgl/yss/edit")
	public String goYssEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=yunShuShangService.selectYunShuShangById(id);
		request.setAttribute("yss", yss);
		
		return MODULE_NAME+"/dwgl/yss/edit";
	}

	@RequestMapping(value="/dwgl/yss/list")
	public String goYssList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/dwgl/yss/list";
	}

	@RequestMapping(value="/dwgl/yss/detail")
	public String goYssDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		YunShuShang yss=yunShuShangService.selectYunShuShangById(id);
		request.setAttribute("yss", yss);
		
		return MODULE_NAME+"/dwgl/yss/detail";
	}

	@RequestMapping(value="/ckgl/ckgl/new")
	public String goCkglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/ckgl/ckgl/new";
	}

	@RequestMapping(value="/ckgl/ckgl/edit")
	public String goCkglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CangKu ck=cangKuService.selectCangKuById(id);
		request.setAttribute("ck", ck);
		
		return MODULE_NAME+"/ckgl/ckgl/edit";
	}
	
	@RequestMapping(value="/ckgl/ckgl/list")
	public String goCkglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/ckgl/ckgl/list";
	}

	@RequestMapping(value="/ckgl/ckgl/detail")
	public String goCkglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		CangKu ck=cangKuService.selectCangKuById(id);
		request.setAttribute("ck", ck);
		
		return MODULE_NAME+"/ckgl/ckgl/detail";
	}

	@RequestMapping(value="/kpgl/kpsl/new")
	public String goKpslNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/kpgl/kpsl/new";
	}

	@RequestMapping(value="/kpgl/kpsl/edit")
	public String goKpslEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		KaPianShenLing kpsl=kaPianShenLingService.selectKaPianShenLingById(id);
		request.setAttribute("kpsl", kpsl);
		
		return MODULE_NAME+"/kpgl/kpsl/edit";
	}

	@RequestMapping(value="/kpgl/kpsl/list")
	public String goKpslList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/kpgl/kpsl/list";
	}

	@RequestMapping(value="/kpgl/kpsl/detail")
	public String goKpslDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		KaPianShenLing kpsl=kaPianShenLingService.selectKaPianShenLingById(id);
		request.setAttribute("kpsl", kpsl);
		
		return MODULE_NAME+"/kpgl/kpsl/detail";
	}
	
	@RequestMapping(value="/kpgl/kpwh/new")
	public String goKpwhNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/kpgl/kpwh/new";
	}

	@RequestMapping(value="/kpgl/kpwh/edit")
	public String goKpwhEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		KaPianWeiHu kpwh=kaPianWeiHuService.selectKaPianWeiHuById(id);
		request.setAttribute("kpwh", kpwh);
		
		return MODULE_NAME+"/kpgl/kpwh/edit";
	}

	@RequestMapping(value="/kpgl/kpwh/list")
	public String goKpwhList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/kpgl/kpwh/list";
	}

	@RequestMapping(value="/kpgl/kpwh/detail")
	public String goKpwhDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		KaPianWeiHu kpwh=kaPianWeiHuService.selectKaPianWeiHuById(id);
		request.setAttribute("kpwh", kpwh);
		
		return MODULE_NAME+"/kpgl/kpwh/detail";
	}
	
	@RequestMapping(value="/jhpz/dlgl/new")
	public String goJcxxJhpzDlglNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/jhpz/dlgl/new";
	}

	@RequestMapping(value="/jhpz/dlgl/edit")
	public String goJcxxJhpzDlglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/jhpz/dlgl/edit";
	}
	
	@RequestMapping(value="/jhpz/dlgl/list")
	public String goJcxxJhpzDlglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/jhpz/dlgl/list";
	}

	@RequestMapping(value="/jhpz/dlgl/detail")
	public String goJcxxJhpzDlglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return MODULE_NAME+"/jhpz/dlgl/detail";
	}
	
	@RequestMapping(value="/newWuZiLeiXing")
	@ResponseBody
	public Map<String, Object> newWuZiLeiXing(WuZiLeiXing wzlx) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=wuZiLeiXingService.newWuZiLeiXing(wzlx);
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
		int count=wuZiLeiXingService.deleteWuZiLeiXing(ids);
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
		
		int count=wuZiLeiXingService.editWuZiLeiXing(wzlx);
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
		
		int count = wuZiLeiXingService.queryWuZiLeiXingForInt(mc);
		List<WuZiLeiXing> wzlxList=wuZiLeiXingService.queryWuZiLeiXingList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", wzlxList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newWuZi")
	@ResponseBody
	public Map<String, Object> newWuZi(WuZi wz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=wuZiService.newWuZi(wz);
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
		int count=wuZiService.deleteWuZi(ids);
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
		
		int count=wuZiService.editWuZi(wz);
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
		
		int count = wuZiService.queryWuZiForInt(mc,wzlxmc);
		List<WuZi> wzList=wuZiService.queryWuZiList(mc, wzlxmc, page, rows, sort, order);
		
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
			
			int count=cheLiangService.newCheLiang(cl);
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
		int count=cheLiangService.deleteCheLiang(ids);
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
			
			int count=cheLiangService.editCheLiang(cl);
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
	public Map<String, Object> queryCheLiangList(String cph,Integer cllx,Boolean sfzy,Integer pfjd,String shzt,String bz,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = cheLiangService.queryCheLiangForInt(cph,cllx,sfzy,pfjd,shzt,bz);
		List<CheLiang> clList=cheLiangService.queryCheLiangList(cph, cllx, sfzy, pfjd, shzt, bz, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", clList);
		
		return jsonMap;
	}

	@RequestMapping(value="/shenHeCheLiang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String shenHeCheLiang(String ids, String flag) {
		//TODO 针对分类的动态进行实时调整更新
		int count=cheLiangService.shenHeCheLiang(ids,flag);
		PlanResult plan=new PlanResult();
		String tsStr=null;
		if("sh".equals(flag))
			tsStr="审核";
		else if("th".equals(flag))
			tsStr="退回";
		
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg(tsStr+"车辆信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg(tsStr+"车辆信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
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
			
			int count=siJiService.newSiJi(sj);
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
		int count=siJiService.deleteSiJi(ids);
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
			
			int count=siJiService.editSiJi(sj);
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
	public Map<String, Object> querySiJiList(String xm,String sfz,Integer zyzt,String shzt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = siJiService.querySiJiForInt(xm,sfz,zyzt,shzt);
		List<SiJi> sjList=siJiService.querySiJiList(xm,sfz,zyzt, shzt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", sjList);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectSiJiById")
	@ResponseBody
	public Map<String, Object> selectSiJiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		SiJi sj=siJiService.selectSiJiById(id);

		jsonMap.put("sj", sj);
		
		return jsonMap;
	}

	@RequestMapping(value="/shenHeSiJi",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String shenHeSiJi(String ids, String flag) {
		//TODO 针对分类的动态进行实时调整更新
		int count=siJiService.shenHeSiJi(ids,flag);
		PlanResult plan=new PlanResult();
		String tsStr=null;
		if("sh".equals(flag))
			tsStr="审核";
		else if("th".equals(flag))
			tsStr="退回";
		
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg(tsStr+"司机信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg(tsStr+"司机信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/newFaHuoDanWei")
	@ResponseBody
	public Map<String, Object> newFaHuoDanWei(FaHuoDanWei fhdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=faHuoDanWeiService.newFaHuoDanWei(fhdw);
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
		int count=faHuoDanWeiService.deleteFaHuoDanWei(ids);
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
		
		int count=faHuoDanWeiService.editFaHuoDanWei(fhdw);
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
		
		int count = faHuoDanWeiService.queryFaHuoDanWeiForInt(dwmc);
		List<FaHuoDanWei> fhdwList=faHuoDanWeiService.queryFaHuoDanWeiList(dwmc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", fhdwList);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectFaHuoDanWeiById")
	@ResponseBody
	public Map<String, Object> selectFaHuoDanWeiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(id);

		jsonMap.put("fhdw", fhdw);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newShouHuoDanWei")
	@ResponseBody
	public Map<String, Object> newShouHuoDanWei(ShouHuoDanWei shdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=shouHuoDanWeiService.newShouHuoDanWei(shdw);
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
		int count=shouHuoDanWeiService.deleteShouHuoDanWei(ids);
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
	
	@RequestMapping(value="/editShouHuoDanWei")
	@ResponseBody
	public Map<String, Object> editShouHuoDanWei(ShouHuoDanWei shdw) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=shouHuoDanWeiService.editShouHuoDanWei(shdw);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "修改收货单位成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "修改收货单位失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryShouHuoDanWeiList")
	@ResponseBody
	public Map<String, Object> queryShouHuoDanWeiList(String dwmc,Boolean ywdl,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = shouHuoDanWeiService.queryShouHuoDanWeiForInt(dwmc,ywdl);
		List<ShouHuoDanWei> shdwList=shouHuoDanWeiService.queryShouHuoDanWeiList(dwmc, ywdl, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", shdwList);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectShouHuoDanWeiById")
	@ResponseBody
	public Map<String, Object> selectShouHuoDanWeiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(id);

		jsonMap.put("shdw", shdw);
		
		return jsonMap;
	}

	@RequestMapping(value="/newYunShuShang")
	@ResponseBody
	public Map<String, Object> newYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=yunShuShangService.newYunShuShang(yss);
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

	@RequestMapping(value="/deleteYuShuShang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteYuShuShang(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=yunShuShangService.deleteYuShuShang(ids);
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

	@RequestMapping(value="/editYunShuShang")
	@ResponseBody
	public Map<String, Object> editYunShuShang(YunShuShang yss) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=yunShuShangService.editYunShuShang(yss);
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

	@RequestMapping(value="/queryYunShuShangList")
	@ResponseBody
	public Map<String, Object> queryYunShuShangList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = yunShuShangService.queryYunShuShangForInt(mc);
		List<YunShuShang> yssList=yunShuShangService.queryYunShuShangList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yssList);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectYunShuShangById")
	@ResponseBody
	public Map<String, Object> selectYunShuShangById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(id);

		jsonMap.put("yss", yss);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newCangKu")
	@ResponseBody
	public Map<String, Object> newCangKu(CangKu ck) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=cangKuService.newCangKu(ck);
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
		int count=cangKuService.deleteCangKu(ids);
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

	@RequestMapping(value="/editCangKu")
	@ResponseBody
	public Map<String, Object> editCangKu(CangKu ck) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=cangKuService.editCangKu(ck);
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

	@RequestMapping(value="/queryCangKuList")
	@ResponseBody
	public Map<String, Object> queryCangKuList(String mc,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = cangKuService.queryCangKuForInt(mc);
		List<CangKu> ckList=cangKuService.queryCangKuList(mc, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", ckList);
		
		return jsonMap;
	}

	@RequestMapping(value="/newKaPianShenLing")
	@ResponseBody
	public Map<String, Object> newKaPianShenLing(KaPianShenLing kpsl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=kaPianShenLingService.newKaPianShenLing(kpsl);
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
		int count=kaPianShenLingService.deleteKaPianShenLing(ids);
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
		
		int count=kaPianShenLingService.editKaPianShenLing(kpsl);
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
		
		int count = kaPianShenLingService.queryKaPianShenLingForInt(sfzh);
		List<KaPianShenLing> kpslList=kaPianShenLingService.queryKaPianShenLingList(sfzh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", kpslList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newKaPianWeiHu")
	@ResponseBody
	public Map<String, Object> newKaPianWeiHu(KaPianWeiHu kpwh) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=kaPianWeiHuService.newKaPianWeiHu(kpwh);
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
	
	@RequestMapping(value="/deleteKaPianWeiHu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteKaPianWeiHu(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=kaPianWeiHuService.deleteKaPianWeiHu(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除卡片维护失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除卡片维护成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/editKaPianWeiHu")
	@ResponseBody
	public Map<String, Object> editKaPianWeiHu(KaPianWeiHu kpwh) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=kaPianWeiHuService.editKaPianWeiHu(kpwh);
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
	
	@RequestMapping(value="/queryKaPianWeiHuList")
	@ResponseBody
	public Map<String, Object> queryKaPianWeiHuList(String kh,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = kaPianWeiHuService.queryKaPianWeiHuForInt(kh);
		List<KaPianWeiHu> kpwhList=kaPianWeiHuService.queryKaPianWeiHuList(kh, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", kpwhList);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/newDuiLie")
	@ResponseBody
	public Map<String, Object> newDuiLie(DuiLie dl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=duiLieService.newDuiLie(dl);
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

	@RequestMapping(value="/deleteDuiLie",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteDuiLie(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=duiLieService.deleteDuiLie(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除队列失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除队列成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/editDuiLie")
	@ResponseBody
	public Map<String, Object> editDuiLie(DuiLie dl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=duiLieService.editDuiLie(dl);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑队列成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑队列失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/queryDuiLieList")
	@ResponseBody
	public Map<String, Object> queryDuiLieList(String mc,String dm,Integer zt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = duiLieService.queryDuiLieForInt(mc, dm, zt);
		List<DuiLie> dlList=duiLieService.queryDuiLieList(mc, dm, zt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", dlList);
		
		return jsonMap;
	}
}
