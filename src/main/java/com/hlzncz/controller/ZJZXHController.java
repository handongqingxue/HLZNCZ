package com.hlzncz.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Controller
@RequestMapping("/main/zjzxh")
public class ZJZXHController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private SiJiService siJiService;
	private static final String moduleName="zjzxh";

	@RequestMapping(value="/zxhgl/dzxh/edit")
	public String goZjzxhZxhglDzxhEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		YongHu xdyh=publicService.selectYongHuById(String.valueOf(dd.getXdyhId()));
		request.setAttribute("xdyh", xdyh);

		YongHu sjyh=publicService.selectYongHuById(String.valueOf(cysj.getGlyhId()));
		request.setAttribute("sjyh", sjyh);
		
		return moduleName+"/zxhgl/dzxh/edit";
	}

	@RequestMapping(value="/zxhgl/dzxh/list")
	public String goZjzxhZxhglDzxhList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_ZHUANG_XIE_HUO);
		
		return moduleName+"/zxhgl/dzxh/list";
	}

	@RequestMapping(value="/zxhgl/dzxh/detail")
	public String goZjzxhZxhglDzxhDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		CheLiang cycl=cheLiangService.selectCheLiangById(String.valueOf(dd.getCyclId()));
		request.setAttribute("cycl", cycl);
		
		SiJi cysj=siJiService.selectSiJiById(String.valueOf(dd.getCysjId()));
		request.setAttribute("cysj", cysj);
		
		YongHu xdyh=publicService.selectYongHuById(String.valueOf(dd.getXdyhId()));
		request.setAttribute("xdyh", xdyh);

		YongHu sjyh=publicService.selectYongHuById(String.valueOf(cysj.getGlyhId()));
		request.setAttribute("sjyh", sjyh);
		
		return moduleName+"/zxhgl/dzxh/detail";
	}

	@RequestMapping(value="/zjgl/dzj/edit")
	public String goZjzxhZjglDzjEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		ZhiJianBaoGao zjbg=publicService.selectZhiJianBaoGaoByGlddBm(String.valueOf(dd.getWybm()));
		request.setAttribute("zjbg", zjbg);
		
		return moduleName+"/zjgl/dzj/edit";
	}

	@RequestMapping(value="/zjgl/dzj/list")
	public String goZjzxhZjglDzjList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_JIAN_YAN);
		
		return moduleName+"/zjgl/dzj/list";
	}

	@RequestMapping(value="/zjgl/dzj/detail")
	public String goZjzxhZjglDzjDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		ZhiJianBaoGao zjbg=publicService.selectZhiJianBaoGaoByGlddBm(String.valueOf(dd.getWybm()));
		request.setAttribute("zjbg", zjbg);
		
		return moduleName+"/zjgl/dzj/detail";
	}

	@RequestMapping(value="/zjgl/zjbg/new")
	public String goZjzxhZjglZjbgNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/zjgl/zjbg/new";
	}

	@RequestMapping(value="/zjgl/zjbg/edit")
	public String goZjzxhZjglZjbgEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ZhiJianBaoGao zjbg=publicService.selectZhiJianBaoGaoById(id);
		request.setAttribute("zjbg", zjbg);

		DingDan gldd=dingDanService.selectDingDanByWybm(zjbg.getGlddBm());
		request.setAttribute("gldd", gldd);
		
		return moduleName+"/zjgl/zjbg/edit";
	}

	@RequestMapping(value="/zjgl/zjbg/list")
	public String goZjzxhZjglZjbgList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/zjgl/zjbg/list";
	}

	@RequestMapping(value="/zjgl/zjbg/detail")
	public String goZjzxhZjglZjbgDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ZhiJianBaoGao zjbg=publicService.selectZhiJianBaoGaoById(id);
		request.setAttribute("zjbg", zjbg);

		DingDan gldd=dingDanService.selectDingDanByWybm(zjbg.getGlddBm());
		request.setAttribute("gldd", gldd);
		
		return moduleName+"/zjgl/zjbg/detail";
	}
}
