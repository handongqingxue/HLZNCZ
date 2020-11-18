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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.hlzncz.util.FileUploadUtils;
import com.hlzncz.entity.*;
import com.hlzncz.service.PublicService;

/*
 * 订单流程：
 * 1.新生成的订单状态都是待审核，管理员在订单列表点击通过，状态变成已下单；
 * 2.入厂前刷身份证，状态变成排队中。LED屏幕显示入厂号，自动叫号，变成待入厂；
 * 3.车牌识别摄像头识别后，状态变成待检验。检验合格继续往下走，出厂后状态就是已完成。
 * 
 * 特殊情况：
 * 1.订单审核未通过，状态就是编辑中，需要重新审核。通过的话，状态才是已下单；
 * 2.自动叫号要是没有找到车辆，超过时间了，状态从待入厂又变回已下单了，就得重新排队了。
 */
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

	@RequestMapping(value="/ddgl/wddd/wyxd/new")
	public String goDdglWdddWyxdNew(HttpServletRequest request) {

		selectNav(request);
		
		return "ddgl/wddd/wyxd/new";
	}

	@RequestMapping(value="/ddgl/wddd/wyxd/edit")
	public String goDdglWdddWyxdEdit(HttpServletRequest request) {
		
		selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wyxd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("wyxd", wyxd);
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(wyxd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(wyxd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(wyxd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(wyxd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(wyxd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(wyxd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/wddd/wyxd/edit";
	}

	@RequestMapping(value="/ddgl/wddd/wyxd/list")
	public String goDdglWdddWyxdList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "ddgl/wddd/wyxd/list";
	}

	@RequestMapping(value="/ddgl/wddd/wyxd/detail")
	public String goDdglWdddWyxdDetail(HttpServletRequest request) {
		
		selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wyxd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("wyxd", wyxd);
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(wyxd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(wyxd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(wyxd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(wyxd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(wyxd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(wyxd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/wddd/wyxd/detail";
	}

	@RequestMapping(value="/ddgl/wddd/dsh/list")
	public String goDdglWdddDshList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("ddztId", DingDan.DAI_SHEN_HE);
		
		return "ddgl/wddd/dsh/list";
	}

	@RequestMapping(value="/ddgl/wddd/dsh/detail")
	public String goDdglWdddDshDetail(HttpServletRequest request) {
		
		selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan dsh=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dsh", dsh);
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dsh.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dsh.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dsh.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dsh.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dsh.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dsh.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/wddd/dsh/detail";
	}

	@RequestMapping(value="/ddgl/wddd/wddd/list")
	public String goDdglWdddWdddList(HttpServletRequest request) {
		
		selectNav(request);

		return "ddgl/wddd/wddd/list";
	}

	@RequestMapping(value="/ddgl/wddd/wddd/detail")
	public String goDdglWdddWdddDetail(HttpServletRequest request) {
		
		selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan wddd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("wddd", wddd);
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(wddd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(wddd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(wddd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(wddd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(wddd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(wddd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/wddd/wddd/detail";
	}

	@RequestMapping(value="/ddgl/zhgl/ddsh/edit")
	public String goDdglZhglDdshEdit(HttpServletRequest request) {
		
		selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/ddsh/edit";
	}

	@RequestMapping(value="/ddgl/zhgl/ddsh/new")
	public String goDdglZhglDdshNew(HttpServletRequest request) {

		selectNav(request);
		
		return "ddgl/zhgl/ddsh/new";
	}

	@RequestMapping(value="/ddgl/zhgl/ddsh/list")
	public String goDdglZhglDdshList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("zxztId", DingDan.DAI_SHEN_HE);
		
		return "ddgl/zhgl/ddsh/list";
	}

	@RequestMapping(value="/ddgl/zhgl/ddsh/detail")
	public String goDdglZhglDdshDetail(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/ddsh/detail";
	}

	@RequestMapping(value="/ddgl/zhgl/zjpd/edit")
	public String goDdglZhglZjpdEdit(HttpServletRequest request) {
		
		selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan zjpd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("zjpd", zjpd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(zjpd.getYssId()));
		request.setAttribute("yss", yss);
		
		WuZi wlxx=publicService.selectWuZiById(String.valueOf(zjpd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(zjpd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(zjpd.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(zjpd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(zjpd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/zjpd/edit";
	}

	@RequestMapping(value="/ddgl/zhgl/zjpd/list")
	public String goDdglZhglZjpdList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("ddztId", DingDan.YI_XIA_DAN);
		
		return "ddgl/zhgl/zjpd/list";
	}

	@RequestMapping(value="/ddgl/zhgl/zjpd/detail")
	public String goDdglZhglZjpdDetail(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan zjpd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("zjpd", zjpd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(zjpd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(zjpd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(zjpd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(zjpd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(zjpd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(zjpd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/zjpd/detail";
	}

	@RequestMapping(value="/ddgl/zhgl/zhgl/new")
	public String goDdglZhglZhglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "ddgl/zhgl/zhgl/new";
	}

	@RequestMapping(value="/ddgl/zhgl/zhgl/edit")
	public String goDdglZhglZhglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/zhgl/edit";
	}

	@RequestMapping(value="/ddgl/zhgl/zhgl/list")
	public String goDdglZhglZhglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "ddgl/zhgl/zhgl/list";
	}

	@RequestMapping(value="/ddgl/zhgl/zhgl/detail")
	public String goDdglZhglZhglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/zhgl/detail";
	}

	@RequestMapping(value="/ddgl/zhgl/yccl/edit")
	public String goDdglZhglYcclEdit(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=publicService.selectDingDanYiChangByDdbm(wybm);
		JSONArray ycxxJA = JSONArray.fromObject(ycxxList);
		request.setAttribute("ycxxJAStr", ycxxJA.toString());
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/yccl/edit";
	}

	@RequestMapping(value="/ddgl/zhgl/yccl/list")
	public String goDdglZhglYcclList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("clzt", DingDanYiChang.DAI_CHU_LI);
		
		return "ddgl/zhgl/yccl/list";
	}

	@RequestMapping(value="/ddgl/zhgl/yccl/detail")
	public String goDdglZhglYcclDetail(HttpServletRequest request) {
		
		selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=publicService.selectDingDanYiChangByDdbm(wybm);
		JSONArray ycxxJA = JSONArray.fromObject(ycxxList);
		request.setAttribute("ycxxJAStr", ycxxJA.toString());
		
		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi wlxx=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("wlxx", wlxx);
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/zhgl/yccl/detail";
	}

	@RequestMapping(value="/ddgl/ddtb/ddtb/new")
	public String goDdglDdtbDdtbNew(HttpServletRequest request) {

		selectNav(request);
		
		return "ddgl/ddtb/ddtb/new";
	}

	@RequestMapping(value="/ddgl/ddtb/ddtb/edit")
	public String goDdglDdtbDdtbEdit(HttpServletRequest request) {

		selectNav(request);
		
		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi yswl=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("yswl", yswl);

		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);

		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/ddtb/ddtb/edit";
	}

	@RequestMapping(value="/ddgl/ddtb/ddtb/list")
	public String goDdglDdtbDdtbList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("zxztId", DingDan.YI_WAN_CHENG+","+DingDan.DAI_JIAN_YAN+","+DingDan.DAI_LI_CHANG);
		
		return "ddgl/ddtb/ddtb/list";
	}

	@RequestMapping(value="/ddgl/ddtb/ddtb/detail")
	public String goDdglDdtbDdtbDetail(HttpServletRequest request) {

		selectNav(request);

		String wybm = request.getParameter("wybm");
		DingDan dd=publicService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		YunShuShang yss=publicService.selectYunShuShangById(String.valueOf(dd.getYssId()));
		request.setAttribute("yss", yss);

		WuZi yswl=publicService.selectWuZiById(String.valueOf(dd.getWlxxId()));
		request.setAttribute("yswl", yswl);

		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(String.valueOf(dd.getFhdwId()));
		request.setAttribute("fhdw", fhdw);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dd.getShdwId()));
		request.setAttribute("shdw", shdw);

		CheLiang cycl=publicService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);

		SiJi cysj=publicService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		return "ddgl/ddtb/ddtb/detail";
	}

	@RequestMapping(value="/gbgl/gbgl/zhcx/new")
	public String goGbglGbglZhcxNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "gbgl/gbgl/zhcx/new";
	}

	@RequestMapping(value="/gbgl/gbgl/zhcx/edit")
	public String goGbglGbglZhcxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/zhcx/edit";
	}

	@RequestMapping(value="/gbgl/gbgl/zhcx/list")
	public String goGbglGbglZhcxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "gbgl/gbgl/zhcx/list";
	}

	@RequestMapping(value="/gbgl/gbgl/zhcx/detail")
	public String goGbglGbglZhcxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/zhcx/detail";
	}

	@RequestMapping(value="/gbgl/gbgl/zzgb/new")
	public String goGbglGbglZzgbNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "gbgl/gbgl/zzgb/new";
	}

	@RequestMapping(value="/gbgl/gbgl/zzgb/edit")
	public String goGbglGbglZzgbEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/zzgb/edit";
	}

	@RequestMapping(value="/gbgl/gbgl/zzgb/list")
	public String goGbglGbglZzgbList(HttpServletRequest request) {
		
		selectNav(request);
		request.setAttribute("gbbq", GuoBang.ZAI_ZHONG_BIAO_QIAN);
		
		return "gbgl/gbgl/zzgb/list";
	}

	@RequestMapping(value="/gbgl/gbgl/zzgb/detail")
	public String goGbglGbglZzgbDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/zzgb/detail";
	}

	@RequestMapping(value="/gbgl/gbgl/pzgb/new")
	public String goGbglGbglPzgbNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "gbgl/gbgl/pzgb/new";
	}

	@RequestMapping(value="/gbgl/gbgl/pzgb/edit")
	public String goGbglGbglPzgbEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/pzgb/edit";
	}

	@RequestMapping(value="/gbgl/gbgl/pzgb/list")
	public String goGbglGbglPzgbList(HttpServletRequest request) {
		
		selectNav(request);
		request.setAttribute("gbbq", GuoBang.PI_ZHONG_BIAO_QIAN);
		
		return "gbgl/gbgl/pzgb/list";
	}

	@RequestMapping(value="/gbgl/gbgl/pzgb/detail")
	public String goGbglGbglPzgbDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=publicService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = publicService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=publicService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return "gbgl/gbgl/pzgb/detail";
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

	@RequestMapping(value="/jcxx/clgl/xzcl/new")
	public String goJcxxClglXzclNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/xzcl/new";
	}

	@RequestMapping(value="/jcxx/clgl/xzcl/edit")
	public String goJcxxClglXzclEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/xzcl/edit";
	}

	@RequestMapping(value="/jcxx/clgl/xzcl/list")
	public String goJcxxClglXzclList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("shzt", CheLiang.BIAN_JI_ZHONG);
		
		return "jcxx/clgl/xzcl/list";
	}

	@RequestMapping(value="/jcxx/clgl/xzcl/detail")
	public String goJcxxClglXzclDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/xzcl/detail";
	}

	@RequestMapping(value="/jcxx/clgl/clsh/new")
	public String goJcxxClglClshNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/clsh/new";
	}

	@RequestMapping(value="/jcxx/clgl/clsh/edit")
	public String goJcxxClglClshEdit(HttpServletRequest request) {

		selectNav(request);
		
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clsh/edit";
	}

	@RequestMapping(value="/jcxx/clgl/clsh/list")
	public String goJcxxClglClshList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("shzt", CheLiang.DAI_SHEN_HE);
		
		return "jcxx/clgl/clsh/list";
	}

	@RequestMapping(value="/jcxx/clgl/clsh/detail")
	public String goJcxxClglClshDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/clsh/detail";
	}

	@RequestMapping(value="/jcxx/clgl/clcx/new")
	public String goJcxxClglClcxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/clcx/new";
	}

	@RequestMapping(value="/jcxx/clgl/clcx/list")
	public String goJcxxClglClcxList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("shzt", CheLiang.DAI_SHEN_HE+","+CheLiang.SHEN_HE_TONG_GUO);
		
		return "jcxx/clgl/clcx/list";
	}

	@RequestMapping(value="/jcxx/clgl/zhgl/new")
	public String goJcxxClglZhglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/clgl/zhgl/new";
	}
	
	@RequestMapping(value="/jcxx/clgl/zhgl/edit")
	public String goJcxxClglZhglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/zhgl/edit";
	}

	@RequestMapping(value="/jcxx/clgl/zhgl/list")
	public String goJcxxClglZhglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/clgl/zhgl/list";
	}

	@RequestMapping(value="/jcxx/clgl/zhgl/detail")
	public String goJcxxClglZhglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		CheLiang cl=publicService.selectCheLiangById(id);
		request.setAttribute("cl", cl);
		
		return "jcxx/clgl/zhgl/detail";
	}

	@RequestMapping(value="/jcxx/sjgl/tjsj/new")
	public String goJcxxSjglTjsjNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/sjgl/tjsj/new";
	}

	@RequestMapping(value="/jcxx/sjgl/tjsj/edit")
	public String goJcxxSjglTjsjEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/tjsj/edit";
	}

	@RequestMapping(value="/jcxx/sjgl/tjsj/list")
	public String goJcxxSjglTjsjList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("shzt", SiJi.BIAN_JI_ZHONG);
		
		return "jcxx/sjgl/tjsj/list";
	}

	@RequestMapping(value="/jcxx/sjgl/tjsj/detail")
	public String goJcxxSjglTjsjDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/tjsj/detail";
	}

	@RequestMapping(value="/jcxx/sjgl/xxsh/edit")
	public String goJcxxSjglXxshEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/xxsh/edit";
	}

	@RequestMapping(value="/jcxx/sjgl/xxsh/list")
	public String goJcxxSjglXxshList(HttpServletRequest request) {
		
		selectNav(request);

		request.setAttribute("shzt", SiJi.DAI_SHEN_HE);
		
		return "jcxx/sjgl/xxsh/list";
	}

	@RequestMapping(value="/jcxx/sjgl/xxsh/detail")
	public String goJcxxSjglXxshDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/xxsh/detail";
	}

	@RequestMapping(value="/jcxx/sjgl/zhgl/new")
	public String goJcxxSjglZhglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/sjgl/zhgl/new";
	}

	@RequestMapping(value="/jcxx/sjgl/zhgl/edit")
	public String goJcxxSjglZhglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/zhgl/edit";
	}

	@RequestMapping(value="/jcxx/sjgl/zhgl/list")
	public String goJcxxSjglZhglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/sjgl/zhgl/list";
	}

	@RequestMapping(value="/jcxx/sjgl/zhgl/detail")
	public String goJcxxSjglZhglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		SiJi sj=publicService.selectSiJiById(id);
		request.setAttribute("sj", sj);
		
		return "jcxx/sjgl/zhgl/detail";
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

	@RequestMapping(value="/jcxx/dwgl/dlshdw/edit")
	public String goJcxxDwglDlshdwEdit(HttpServletRequest request) {
		
		selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=publicService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return "jcxx/dwgl/dlshdw/edit";
	}

	@RequestMapping(value="/jcxx/dwgl/dlshdw/list")
	public String goJcxxDwglDlshdwList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("ywdl", ShouHuoDanWei.YOU_DUI_LIE);
		
		return "jcxx/dwgl/dlshdw/list";
	}

	@RequestMapping(value="/jcxx/dwgl/dlshdw/detail")
	public String goJcxxDwglDlshdwDetail(HttpServletRequest request) {
		
		selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=publicService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return "jcxx/dwgl/dlshdw/detail";
	}

	@RequestMapping(value="/jcxx/dwgl/wdlshdw/edit")
	public String goJcxxDwglWdlshdwEdit(HttpServletRequest request) {
		
		selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);
		
		return "jcxx/dwgl/wdlshdw/edit";
	}

	@RequestMapping(value="/jcxx/dwgl/wdlshdw/list")
	public String goJcxxDwglWdlshdwList(HttpServletRequest request) {
		
		selectNav(request);
		
		request.setAttribute("ywdl", ShouHuoDanWei.WU_DUI_LIE);
		
		return "jcxx/dwgl/wdlshdw/list";
	}

	@RequestMapping(value="/jcxx/dwgl/wdlshdw/detail")
	public String goJcxxDwglWdlshdwDetail(HttpServletRequest request) {
		
		selectNav(request);
		
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);
		
		return "jcxx/dwgl/wdlshdw/detail";
	}

	@RequestMapping(value="/jcxx/dwgl/qbshdw/new")
	public String goJcxxDwglQbshdwNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/qbshdw/new";
	}

	@RequestMapping(value="/jcxx/dwgl/qbshdw/edit")
	public String goJcxxDwglQbshdwEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=publicService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return "jcxx/dwgl/qbshdw/edit";
	}

	@RequestMapping(value="/jcxx/dwgl/qbshdw/list")
	public String goJcxxDwglQbshdwList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/dwgl/qbshdw/list";
	}

	@RequestMapping(value="/jcxx/dwgl/qbshdw/detail")
	public String goJcxxDwglQbshdwDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);
		request.setAttribute("shdw", shdw);

		DuiLie ssdl=publicService.selectDuiLieById(String.valueOf(shdw.getDlId()));
		request.setAttribute("ssdl", ssdl);
		
		return "jcxx/dwgl/qbshdw/detail";
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

	@RequestMapping(value="/jcxx/kpgl/kpwh/detail")
	public String goKpwhDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		KaPianWeiHu kpwh=publicService.selectKaPianWeiHuById(id);
		request.setAttribute("kpwh", kpwh);
		
		return "jcxx/kpgl/kpwh/detail";
	}
	
	@RequestMapping(value="/jcxx/jhpz/dlgl/new")
	public String goJcxxJhpzDlglNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/jhpz/dlgl/new";
	}

	@RequestMapping(value="/jcxx/jhpz/dlgl/edit")
	public String goJcxxJhpzDlglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=publicService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jcxx/jhpz/dlgl/edit";
	}
	
	@RequestMapping(value="/jcxx/jhpz/dlgl/list")
	public String goJcxxJhpzDlglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/jhpz/dlgl/list";
	}

	@RequestMapping(value="/jcxx/jhpz/dlgl/detail")
	public String goJcxxJhpzDlglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=publicService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jcxx/jhpz/dlgl/detail";
	}

	@RequestMapping(value="/xtgl/yhqx/yhgl/new")
	public String goXtglYhqxYhglNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "xtgl/yhqx/yhgl/new";
	}
	
	@RequestMapping(value="/xtgl/yhqx/yhgl/list")
	public String goXtglYhqxYhglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "xtgl/yhqx/yhgl/list";
	}

	@RequestMapping(value="/jhxt/jhxx/hmcx/new")
	public String goHmcxNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jhxt/jhxx/hmcx/new";
	}

	@RequestMapping(value="/jhxt/jhxx/hmcx/list")
	public String goHmcxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jhxt/jhxx/hmcx/list";
	}
	
	@RequestMapping(value="/jhxt/pzgl/dlgl/new")
	public String goJhxtPzglDlglNew(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jhxt/pzgl/dlgl/new";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/edit")
	public String goJhxtPzglDlglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=publicService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jhxt/pzgl/dlgl/edit";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/list")
	public String goJhxtPzglDlglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jhxt/pzgl/dlgl/list";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/detail")
	public String goJhxtPzglDlglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=publicService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jhxt/pzgl/dlgl/detail";
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

	@RequestMapping(value="/newDingDanZongHeGuanLi")
	@ResponseBody
	public Map<String, Object> newDingDanZongHeGuanLi(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newDingDanZongHeGuanLi(dd);
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

	@RequestMapping(value="/newWoYaoXiaDan")
	@ResponseBody
	public Map<String, Object> newWoYaoXiaDan(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newWoYaoXiaDan(dd);
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
		int count=publicService.deleteDingDan(wybms);
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

	@RequestMapping(value="/editWoYaoXiaDan")
	@ResponseBody
	public Map<String, Object> editWoYaoXiaDan(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editWoYaoXiaDan(dd);
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
		
		int count = publicService.queryWoYaoXiaDanForInt(ddh,ddztId);
		List<DingDan> wyxdList=publicService.queryWoYaoXiaDanList(ddh, ddztId, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", wyxdList);
		
		return jsonMap;
	}

	@RequestMapping(value="/tongGuoDingDanShenHe",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tongGuoDingDanShenHe(String wybms) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.tongGuoDingDanShenHe(wybms);
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
		int count=publicService.tuiHuiDingDanShenHe(wybms);
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

	@RequestMapping(value="/queryDingDanShenHeList")
	@ResponseBody
	public Map<String, Object> queryDingDanShenHeList(String ddh,Integer ddztId,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryDingDanShenHeForInt(ddh,ddztId);
		List<DingDan> ddshList=publicService.queryDingDanShenHeList(ddh, ddztId, page, rows, sort, order);
		
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
	public Map<String, Object> queryDDGLZHGLList(String ddh,String ddztId,String cph,String jcsjs,String jcsje,String jhysrq,String yss,String clzt,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = publicService.queryDDGLZHGLForInt(ddh,ddztId,cph,jcsjs,jcsje,jhysrq,yss);
			List<DingDan> zhglList=publicService.queryDDGLZHGLList(ddh, ddztId,cph,jcsjs,jcsje,jhysrq,yss,clzt, page, rows, sort, order);
			
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
			int count = publicService.queryDDGLZHGLYCCLForInt(ddh,ddztId,cph,jhysrq,clzt);
			List<DingDan> ycclList=publicService.queryDDGLZHGLYCCLList(ddh, ddztId,cph,jhysrq,clzt, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ycclList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	/**
	 * 添加过磅信息
	 * @param gb
	 * @param zp1_file
	 * @param zp2_file
	 * @param zp3_file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/newGuoBang")
	@ResponseBody
	public Map<String, Object> newGuoBang(GuoBang gb,
			@RequestParam(value="zp1_file",required=false) MultipartFile zp1_file,
			@RequestParam(value="zp2_file",required=false) MultipartFile zp2_file,
			@RequestParam(value="zp3_file",required=false) MultipartFile zp3_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			MultipartFile[] fileArr=new MultipartFile[4];
			fileArr[0]=zp1_file;
			fileArr[1]=zp2_file;
			fileArr[2]=zp3_file;
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
								gb.setZp1(dataJO.get("src").toString());
								break;
							case 1:
								gb.setZp2(dataJO.get("src").toString());
								break;
							case 2:
								gb.setZp3(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.newGuoBang(gb);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "创建过磅信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "创建过磅信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/editGuoBang")
	@ResponseBody
	public Map<String, Object> editGuoBang(GuoBang gb,
			@RequestParam(value="zp1_file",required=false) MultipartFile zp1_file,
			@RequestParam(value="zp2_file",required=false) MultipartFile zp2_file,
			@RequestParam(value="zp3_file",required=false) MultipartFile zp3_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[4];
			fileArr[0]=zp1_file;
			fileArr[1]=zp2_file;
			fileArr[2]=zp3_file;
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
								gb.setZp1(dataJO.get("src").toString());
								break;
							case 1:
								gb.setZp2(dataJO.get("src").toString());
								break;
							case 2:
								gb.setZp3(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=publicService.editGuoBang(gb);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑过磅信息成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑过磅信息失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	/**
	 * 删除过磅信息
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteGuoBang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteGuoBang(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteGuoBang(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("删除过磅信息失败");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("删除过磅信息成功");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}
	
	/**
	 * 过磅管理-过磅管理-综合查询
	 * @param cph
	 * @param gbsjs
	 * @param gbsje
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/queryGBGLGBGLZHCXList")
	@ResponseBody
	public Map<String, Object> queryGBGLGBGLZHCXList(String cph,String gbbq,String gbsjs,String gbsje,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = publicService.queryGBGLGBGLZHCXForInt(cph,gbbq,gbsjs,gbsje);
			List<DingDan> zhglList=publicService.queryGBGLGBGLZHCXList(cph, gbbq, gbsjs, gbsje, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/queryDingDanZhuangTaiCBBList")
	@ResponseBody
	public Map<String, Object> queryDingDanZhuangTaiCBBList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<DingDanZhuangTai> ddztList=publicService.queryDingDanZhuangTaiCBBList();
		
		jsonMap.put("rows", ddztList);
		
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

	@RequestMapping(value="/shenHeCheLiang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String shenHeCheLiang(String ids, String flag) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.shenHeCheLiang(ids,flag);
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
	public Map<String, Object> queryCheLiangList(String cph,Integer cllx,Boolean sfzy,Integer pfjd,String shzt,String bz,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryCheLiangForInt(cph,cllx,sfzy,pfjd,shzt,bz);
		List<CheLiang> clList=publicService.queryCheLiangList(cph, cllx, sfzy, pfjd, shzt, bz, page, rows, sort, order);
		
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
			
			int count=publicService.newYongHu(yh);
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

	@RequestMapping(value="/deleteYongHu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteYongHu(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteYongHu(ids);
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

	@RequestMapping(value="/shenHeSiJi",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String shenHeSiJi(String ids, String flag) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.shenHeSiJi(ids,flag);
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
	public Map<String, Object> querySiJiList(String xm,String sfz,Integer zyzt,String shzt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.querySiJiForInt(xm,sfz,zyzt,shzt);
		List<SiJi> sjList=publicService.querySiJiList(xm,sfz,zyzt, shzt, page, rows, sort, order);
		
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
	public Map<String, Object> queryShouHuoDanWeiList(String dwmc,Boolean ywdl,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryShouHuoDanWeiForInt(dwmc,ywdl);
		List<ShouHuoDanWei> shdwList=publicService.queryShouHuoDanWeiList(dwmc, ywdl, page, rows, sort, order);
		
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

	@RequestMapping(value="/editDuiLie")
	@ResponseBody
	public Map<String, Object> editDuiLie(DuiLie dl) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editDuiLie(dl);
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
	
	@RequestMapping(value="/deleteKaPianWeiHu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteKaPianWeiHu(String ids) {
		//TODO 针对分类的动态进行实时调整更新
		int count=publicService.deleteKaPianWeiHu(ids);
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

	@RequestMapping(value="/queryYongHuList")
	@ResponseBody
	public Map<String, Object> queryYongHuList(String yhm,Integer zt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryYongHuForInt(yhm, zt);
		List<YongHu> yhList=publicService.queryYongHuList(yhm, zt, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", yhList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryHaoMaList")
	@ResponseBody
	public Map<String, Object> queryHaoMaList(String hm,String pdh,Integer ztId,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = publicService.queryHaoMaForInt(hm, pdh, ztId);
		List<HaoMa> hmList=publicService.queryHaoMaList(hm, pdh, ztId, page, rows, sort, order);
		
		jsonMap.put("total", count);
		jsonMap.put("rows", hmList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryHaoMaZhuangTaiCBBList")
	@ResponseBody
	public Map<String, Object> queryHaoMaZhuangTaiCBBList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<HaoMaZhuangTai> hmztList=publicService.queryHaoMaZhuangTaiCBBList();
		
		jsonMap.put("rows", hmztList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryJueSeByIds")
	@ResponseBody
	public Map<String, Object> queryJueSeByIds(String ids) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<JueSe> jsList=publicService.queryJueSeByIds(ids);

		jsonMap.put("total", jsList.size());
		jsonMap.put("rows", jsList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryShouHuoDanWeiByIds")
	@ResponseBody
	public Map<String, Object> queryShouHuoDanWeiByIds(String ids) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<ShouHuoDanWei> shdwList=publicService.queryShouHuoDanWeiByIds(ids);

		jsonMap.put("total", shdwList.size());
		jsonMap.put("rows", shdwList);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectYunShuShangById")
	@ResponseBody
	public Map<String, Object> selectYunShuShangById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		YunShuShang yss=publicService.selectYunShuShangById(id);

		jsonMap.put("yss", yss);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectWuZiById")
	@ResponseBody
	public Map<String, Object> selectWuZiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		WuZi wz=publicService.selectWuZiById(id);

		jsonMap.put("wz", wz);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectFaHuoDanWeiById")
	@ResponseBody
	public Map<String, Object> selectFaHuoDanWeiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		FaHuoDanWei fhdw=publicService.selectFaHuoDanWeiById(id);

		jsonMap.put("fhdw", fhdw);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectShouHuoDanWeiById")
	@ResponseBody
	public Map<String, Object> selectShouHuoDanWeiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		ShouHuoDanWei shdw=publicService.selectShouHuoDanWeiById(id);

		jsonMap.put("shdw", shdw);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectCheLiangById")
	@ResponseBody
	public Map<String, Object> selectCheLiangById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		CheLiang cl=publicService.selectCheLiangById(id);

		jsonMap.put("cl", cl);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectSiJiById")
	@ResponseBody
	public Map<String, Object> selectSiJiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		SiJi sj=publicService.selectSiJiById(id);

		jsonMap.put("sj", sj);
		
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
