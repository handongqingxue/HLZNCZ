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

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/"+ZJZXHController.MODULE_NAME)
public class ZJZXHController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private SiJiService siJiService;
	@Autowired
	private YongHuService yongHuService;
	@Autowired
	private ZhiJianBaoGaoService zhiJianBaoGaoService;
	public static final String MODULE_NAME="zjzxh";

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
		
		YongHu xdyh=yongHuService.selectYongHuById(String.valueOf(dd.getXdyhId()));
		request.setAttribute("xdyh", xdyh);

		YongHu sjyh=yongHuService.selectYongHuById(String.valueOf(cysj.getGlyhId()));
		request.setAttribute("sjyh", sjyh);
		
		return MODULE_NAME+"/zxhgl/dzxh/edit";
	}

	@RequestMapping(value="/zxhgl/dzxh/list")
	public String goZjzxhZxhglDzxhList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_ZHUANG_XIE_HUO);
		
		return MODULE_NAME+"/zxhgl/dzxh/list";
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
		
		YongHu xdyh=yongHuService.selectYongHuById(String.valueOf(dd.getXdyhId()));
		request.setAttribute("xdyh", xdyh);

		YongHu sjyh=yongHuService.selectYongHuById(String.valueOf(cysj.getGlyhId()));
		request.setAttribute("sjyh", sjyh);
		
		return MODULE_NAME+"/zxhgl/dzxh/detail";
	}

	@RequestMapping(value="/zjgl/dzj/edit")
	public String goZjzxhZjglDzjEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		ZhiJianBaoGao zjbg=zhiJianBaoGaoService.selectZhiJianBaoGaoByGlddBm(String.valueOf(dd.getWybm()));
		request.setAttribute("zjbg", zjbg);
		
		return MODULE_NAME+"/zjgl/dzj/edit";
	}

	@RequestMapping(value="/zjgl/dzj/list")
	public String goZjzxhZjglDzjList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		request.setAttribute("ddztId", DingDan.DAI_JIAN_YAN);
		
		return MODULE_NAME+"/zjgl/dzj/list";
	}

	@RequestMapping(value="/zjgl/dzj/detail")
	public String goZjzxhZjglDzjDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String wybm = request.getParameter("wybm");
		DingDan dd=dingDanService.selectDingDanByWybm(wybm);
		request.setAttribute("dd", dd);

		ZhiJianBaoGao zjbg=zhiJianBaoGaoService.selectZhiJianBaoGaoByGlddBm(String.valueOf(dd.getWybm()));
		request.setAttribute("zjbg", zjbg);
		
		return MODULE_NAME+"/zjgl/dzj/detail";
	}

	@RequestMapping(value="/zjgl/zjbg/new")
	public String goZjzxhZjglZjbgNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/zjgl/zjbg/new";
	}

	@RequestMapping(value="/zjgl/zjbg/edit")
	public String goZjzxhZjglZjbgEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ZhiJianBaoGao zjbg=zhiJianBaoGaoService.selectZhiJianBaoGaoById(id);
		request.setAttribute("zjbg", zjbg);

		DingDan gldd=dingDanService.selectDingDanByWybm(zjbg.getGlddBm());
		request.setAttribute("gldd", gldd);
		
		return MODULE_NAME+"/zjgl/zjbg/edit";
	}

	@RequestMapping(value="/zjgl/zjbg/list")
	public String goZjzxhZjglZjbgList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return MODULE_NAME+"/zjgl/zjbg/list";
	}

	@RequestMapping(value="/zjgl/zjbg/detail")
	public String goZjzxhZjglZjbgDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		ZhiJianBaoGao zjbg=zhiJianBaoGaoService.selectZhiJianBaoGaoById(id);
		request.setAttribute("zjbg", zjbg);

		DingDan gldd=dingDanService.selectDingDanByWybm(zjbg.getGlddBm());
		request.setAttribute("gldd", gldd);
		
		return MODULE_NAME+"/zjgl/zjbg/detail";
	}
	
	@RequestMapping(value="/queryZJZXHZJGLZJBGList")
	@ResponseBody
	public Map<String, Object> queryZJZXHZJGLZJBGList(String jl,String ddh,String ddztId,String cph,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = zhiJianBaoGaoService.queryZJZXHZJGLZJBGForInt(jl,ddh,ddztId,cph);
			List<DingDan> ycclList=zhiJianBaoGaoService.queryZJZXHZJGLZJBGList(jl, ddh, ddztId, cph, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", ycclList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/newZhiJianBaoGao")
	@ResponseBody
	public Map<String, Object> newZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=zhiJianBaoGaoService.newZhiJianBaoGao(zjbg);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "创建质检报告成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "创建质检报告失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editZhiJianBaoGao")
	@ResponseBody
	public Map<String, Object> editZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=zhiJianBaoGaoService.editZhiJianBaoGao(zjbg);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "修改质检报告成功！");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "修改质检报告失败！");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editDaiZhiJian")
	@ResponseBody
	public Map<String, Object> editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg,
			@RequestParam(value="ewm_file",required=false) MultipartFile ewm_file,
			HttpServletRequest request) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		try {
			MultipartFile[] fileArr=new MultipartFile[4];
			fileArr[0]=ewm_file;
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
								dd.setEwm(dataJO.get("src").toString());
								break;
							}
						}
					}
				}
			}
			
			int count=zhiJianBaoGaoService.editDaiZhiJian(dd,zjbg);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "编辑待质检成功！");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "编辑待质检失败！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
}
