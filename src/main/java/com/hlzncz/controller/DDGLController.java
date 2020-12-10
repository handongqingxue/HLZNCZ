package com.hlzncz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/main/ddgl")
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
	private static final String moduleName="ddgl";

	@RequestMapping(value="/wddd/wyxd/new")
	public String goDdglWdddWyxdNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return moduleName+"/wddd/wyxd/new";
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
		
		return moduleName+"/wddd/wyxd/edit";
	}

	@RequestMapping(value="/wddd/wyxd/list")
	public String goDdglWdddWyxdList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/wddd/wyxd/list";
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
		
		return moduleName+"/wddd/wyxd/detail";
	}

	@RequestMapping(value="/wddd/dsh/list")
	public String goDdglWdddDshList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		request.setAttribute("ddztId", DingDan.DAI_SHEN_HE);
		
		return moduleName+"/wddd/dsh/list";
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
		
		return moduleName+"/wddd/dsh/detail";
	}

	@RequestMapping(value="/wddd/wddd/list")
	public String goDdglWdddWdddList(HttpServletRequest request) {
		
		publicService.selectNav(request);

		return moduleName+"/wddd/wddd/list";
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
		
		return moduleName+"/wddd/wddd/detail";
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
		
		return moduleName+"/zhgl/ddsh/edit";
	}

	@RequestMapping(value="/zhgl/ddsh/new")
	public String goDdglZhglDdshNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return moduleName+"/zhgl/ddsh/new";
	}

	@RequestMapping(value="/zhgl/ddsh/list")
	public String goDdglZhglDdshList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("zxztId", DingDan.DAI_SHEN_HE);
		
		return moduleName+"/zhgl/ddsh/list";
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
		
		return moduleName+"/zhgl/ddsh/detail";
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
		
		return moduleName+"/zhgl/zjpd/edit";
	}

	@RequestMapping(value="/zhgl/zjpd/list")
	public String goDdglZhglZjpdList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.YI_XIA_DAN);
		
		return moduleName+"/zhgl/zjpd/list";
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
		
		return moduleName+"/zhgl/zjpd/detail";
	}

	@RequestMapping(value="/zhgl/zhgl/new")
	public String goDdglZhglZhglNew(HttpServletRequest request) {

		publicService.selectNav(request);
		
		return moduleName+"/zhgl/zhgl/new";
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
		
		return moduleName+"/zhgl/zhgl/edit";
	}

	@RequestMapping(value="/zhgl/zhgl/list")
	public String goDdglZhglZhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/zhgl/zhgl/list";
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
		
		return moduleName+"/zhgl/zhgl/detail";
	}

	@RequestMapping(value="/zhgl/yccl/edit")
	public String goDdglZhglYcclEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=publicService.selectDingDanYiChangByDdbm(wybm);
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
		
		return moduleName+"/zhgl/yccl/edit";
	}

	@RequestMapping(value="/zhgl/yccl/list")
	public String goDdglZhglYcclList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("clzt", DingDanYiChang.DAI_CHU_LI);
		
		return moduleName+"/zhgl/yccl/list";
	}

	@RequestMapping(value="/zhgl/yccl/detail")
	public String goDdglZhglYcclDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		List<DingDanYiChang> ycxxList=publicService.selectDingDanYiChangByDdbm(wybm);
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
		
		return moduleName+"/ddtb/ddtb/new";
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
		
		return moduleName+"/ddtb/ddtb/edit";
	}

	@RequestMapping(value="/ddtb/ddtb/list")
	public String goDdglDdtbDdtbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("zxztId", DingDan.YI_WAN_CHENG+","+DingDan.DAI_JIAN_YAN+","+DingDan.DAI_LI_CHANG);
		
		return moduleName+"/ddtb/ddtb/list";
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
		
		return moduleName+"/ddtb/ddtb/detail";
	}
}
