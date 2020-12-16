package com.hlzncz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;
import com.hlzncz.util.FileUploadUtils;
import com.hlzncz.util.JsonUtil;
import com.hlzncz.util.PlanResult;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/"+DDGLController.MODULE_NAME)
public class DDGLController {

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
	private DingDanYiChangService dingDanYiChangService;
	@Autowired
	private BangDanService bangDanService;
	public static final String MODULE_NAME="ddgl";

	@RequestMapping(value="/wddd/wyxd/new")
	public String goDdglWdddWyxdNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/wddd/wyxd/new";
	}

	@RequestMapping(value="/wddd/wyxd/edit")
	public String goDdglWdddWyxdEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wyxd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("wyxd", wyxd);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(wyxd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(wyxd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(wyxd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(wyxd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(wyxd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(wyxd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wddd/wyxd/edit";
	}

	@RequestMapping(value="/wddd/wyxd/list")
	public String goDdglWdddWyxdList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/wddd/wyxd/list";
	}

	@RequestMapping(value="/wddd/wyxd/detail")
	public String goDdglWdddWyxdDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wyxd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("wyxd", wyxd);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(wyxd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(wyxd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(wyxd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(wyxd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(wyxd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(wyxd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wddd/wyxd/detail";
	}

	@RequestMapping(value="/wddd/dsh/list")
	public String goDdglWdddDshList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("ddztId", DingDan.DAI_SHEN_HE);
		
		return MODULE_NAME+"/wddd/dsh/list";
	}

	@RequestMapping(value="/wddd/dsh/detail")
	public String goDdglWdddDshDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan dsh=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dsh", dsh);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(dsh.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(dsh.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(dsh.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dsh.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dsh.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dsh.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wddd/dsh/detail";
	}

	@RequestMapping(value="/wddd/wddd/list")
	public String goDdglWdddWdddList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		return MODULE_NAME+"/wddd/wddd/list";
	}

	@RequestMapping(value="/wddd/wddd/detail")
	public String goDdglWdddWdddDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wddd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("wddd", wddd);
		
		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(wddd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(wddd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(wddd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(wddd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(wddd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(wddd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/wddd/wddd/detail";
	}

	@RequestMapping(value="/zhgl/ddsh/edit")
	public String goDdglZhglDdshEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

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
		
		return MODULE_NAME+"/zhgl/ddsh/edit";
	}

	@RequestMapping(value="/zhgl/ddsh/new")
	public String goDdglZhglDdshNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/zhgl/ddsh/new";
	}

	@RequestMapping(value="/zhgl/ddsh/list")
	public String goDdglZhglDdshList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("zxztId", DingDan.DAI_SHEN_HE);
		
		return MODULE_NAME+"/zhgl/ddsh/list";
	}

	@RequestMapping(value="/zhgl/ddsh/detail")
	public String goDdglZhglDdshDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

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
		
		return MODULE_NAME+"/zhgl/ddsh/detail";
	}

	@RequestMapping(value="/zhgl/zjpd/edit")
	public String goDdglZhglZjpdEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan zjpd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("zjpd", zjpd);

		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(zjpd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(zjpd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(zjpd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(zjpd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(zjpd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(zjpd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/zhgl/zjpd/edit";
	}

	@RequestMapping(value="/zhgl/zjpd/list")
	public String goDdglZhglZjpdList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.YI_XIA_DAN);
		
		return MODULE_NAME+"/zhgl/zjpd/list";
	}

	@RequestMapping(value="/zhgl/zjpd/detail")
	public String goDdglZhglZjpdDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan zjpd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("zjpd", zjpd);

		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(zjpd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=wuZiService.selectWuZiById(String.valueOf(zjpd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(zjpd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(zjpd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(zjpd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(zjpd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/zhgl/zjpd/detail";
	}

	@RequestMapping(value="/zhgl/zhgl/new")
	public String goDdglZhglZhglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/zhgl/zhgl/new";
	}

	@RequestMapping(value="/zhgl/zhgl/edit")
	public String goDdglZhglZhglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

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
		
		return MODULE_NAME+"/zhgl/zhgl/edit";
	}

	@RequestMapping(value="/zhgl/zhgl/list")
	public String goDdglZhglZhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/zhgl/zhgl/list";
	}

	@RequestMapping(value="/zhgl/zhgl/detail")
	public String goDdglZhglZhglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

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
		
		return MODULE_NAME+"/zhgl/zhgl/detail";
	}

	@RequestMapping(value="/zhgl/yccl/edit")
	public String goDdglZhglYcclEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=dingDanYiChangService.selectDingDanYiChangByDdbm(wybm);
		JSONArray ycxxJA = JSONArray.fromObject(ycxxList);
		request.setAttribute("ycxxJAStr", ycxxJA.toString());
		
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
		
		return MODULE_NAME+"/zhgl/yccl/edit";
	}

	@RequestMapping(value="/zhgl/yccl/list")
	public String goDdglZhglYcclList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("clzt", DingDanYiChang.DAI_CHU_LI);
		
		return MODULE_NAME+"/zhgl/yccl/list";
	}

	@RequestMapping(value="/zhgl/yccl/detail")
	public String goDdglZhglYcclDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=dingDanYiChangService.selectDingDanYiChangByDdbm(wybm);
		JSONArray ycxxJA = JSONArray.fromObject(ycxxList);
		request.setAttribute("ycxxJAStr", ycxxJA.toString());
		
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
		
		return "ddgl/zhgl/yccl/detail";
	}

	@RequestMapping(value="/ddtb/ddtb/new")
	public String goDdglDdtbDdtbNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return MODULE_NAME+"/ddtb/ddtb/new";
	}

	@RequestMapping(value="/ddtb/ddtb/edit")
	public String goDdglDdtbDdtbEdit(HttpServletRequest request) {

		publicService.selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi yswl=wuZiService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("yswl", yswl);

		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);

		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/ddtb/ddtb/edit";
	}

	@RequestMapping(value="/ddtb/ddtb/list")
	public String goDdglDdtbDdtbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("zxztId", DingDan.YI_WAN_CHENG+","+DingDan.DAI_JIAN_YAN+","+DingDan.DAI_LI_CHANG);
		
		return MODULE_NAME+"/ddtb/ddtb/list";
	}

	@RequestMapping(value="/ddtb/ddtb/detail")
	public String goDdglDdtbDdtbDetail(HttpServletRequest request) {

		publicService.selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=yunShuShangService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi yswl=wuZiService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("yswl", yswl);

		FaHuoDanWei fhdw=faHuoDanWeiService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);

		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return MODULE_NAME+"/ddtb/ddtb/detail";
	}

	@RequestMapping(value="/newDingDanZongHeGuanLi")
	@ResponseBody
	public Map<String, Object> newDingDanZongHeGuanLi(DingDan dd,BangDan bd,
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
			
			int count=dingDanService.newDingDanZongHeGuanLi(dd);
			bd.setDdbm(dd.getWybm());
			count=bangDanService.newErBangWaiJian(bd);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建订单成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建订单失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/newWoYaoXiaDan")
	@ResponseBody
	public Map<String, Object> newWoYaoXiaDan(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=dingDanService.newWoYaoXiaDan(dd);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建订单成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建订单失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteWoYaoXiaDan",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWoYaoXiaDan(String wybms) {
		//TODO 针对分类的动态进行实时调整更新
		int count=dingDanService.deleteDingDan(wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除我要下单失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除我要下单成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/editDingDan")
	@ResponseBody
	public Map<String, Object> editDingDan(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=dingDanService.editDingDan(dd);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "编辑订单成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "编辑订单失败！");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryWoYaoXiaDanList")
	@ResponseBody
	public Map<String, Object> queryWoYaoXiaDanList(String ddh,Integer ddztId,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = dingDanService.queryWoYaoXiaDanForInt(ddh,ddztId);
		List<DingDan> wyxdList=dingDanService.queryWoYaoXiaDanList(ddh, ddztId, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", wyxdList);
		
		return jsonMap;
	}

	@RequestMapping(value="/tongGuoDingDanShenHe",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tongGuoDingDanShenHe(String wybms) {
		//TODO 针对分类的动态进行实时调整更新
		int count=dingDanService.updateDingDanZT(DingDan.YI_XIA_DAN,wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("通过订单审核失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("通过订单审核成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/tuiHuiDingDanShenHe",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tuiHuiDingDanShenHe(String wybms) {
		//TODO 针对分类的动态进行实时调整更新
		int count=dingDanService.updateDingDanZT(DingDan.BIAN_JI_ZHONG,wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("退回订单审核失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("退回订单审核成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	/**
	 * 综合管理-订单管理-订单审核查询（这个方法暂时不用了，调用订单综合查询的接口）
	 * @param ddh
	 * @param ddztId
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/queryDingDanShenHeList")
	@ResponseBody
	public Map<String, Object> queryDingDanShenHeList(String ddh,Integer ddztId,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = dingDanService.queryDingDanShenHeForInt(ddh,ddztId);
		List<DingDan> ddshList=dingDanService.queryDingDanShenHeList(ddh, ddztId, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", ddshList);
		
		return jsonMap;
	}

	/**
	 * 订单管理-综合管理查询
	 * @param ddh
	 * @param ddztId
	 * @param cph
	 * @param jcsjs
	 * @param jcsje
	 * @param jhysrq
	 * @param yss
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/queryDDGLZHGLList")
	@ResponseBody
	public Map<String, Object> queryDDGLZHGLList(String ddh,String ddztId,String cph,String jcsjs,String jcsje,String jhysrq,String yss,
			String wzmc,String fhdwmc,String shdwmc,String sjxm,String sjsfz,String clzt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryDDGLZHGLForInt(ddh,ddztId,cph,jcsjs,jcsje,jhysrq,yss,wzmc,fhdwmc,shdwmc,sjxm,sjsfz);
			List<DingDan> zhglList=dingDanService.queryDDGLZHGLList(ddh, ddztId,cph,jcsjs,jcsje,jhysrq,yss,wzmc,fhdwmc,shdwmc,sjxm,sjsfz,clzt, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
	
	@RequestMapping(value="/queryDDGLZHGLYCCLList")
	@ResponseBody
	public Map<String, Object> queryDDGLZHGLYCCLList(String ddh,String ddztId,String cph,String jhysrq,String clzt,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = dingDanService.queryDDGLZHGLYCCLForInt(ddh,ddztId,cph,jhysrq,clzt);
			List<DingDan> ycclList=dingDanService.queryDDGLZHGLYCCLList(ddh, ddztId,cph,jhysrq,clzt, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ycclList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
}
