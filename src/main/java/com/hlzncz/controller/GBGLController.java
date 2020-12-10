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
@RequestMapping("/main/gbgl")
public class GBGLController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private GuoBangService guoBangService;
	private static final String moduleName="gbgl";

	@RequestMapping(value="/gbgl/blgb/list")
	public String goGbglGbglBlgbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		request.setAttribute("gbbq", GuoBang.ZAI_ZHONG_BIAO_QIAN);
		
		return moduleName+"/gbgl/blgb/list";
	}

	@RequestMapping(value="/gbgl/zhcx/new")
	public String goGbglGbglZhcxNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/zhcx/new";
	}

	@RequestMapping(value="/gbgl/zhcx/edit")
	public String goGbglGbglZhcxEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/zhcx/edit";
	}

	@RequestMapping(value="/gbgl/zhcx/list")
	public String goGbglGbglZhcxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/zhcx/list";
	}

	@RequestMapping(value="/gbgl/zhcx/detail")
	public String goGbglGbglZhcxDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/zhcx/detail";
	}

	@RequestMapping(value="/gbgl/zzgb/new")
	public String goGbglGbglZzgbNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/zzgb/new";
	}

	@RequestMapping(value="/gbgl/zzgb/edit")
	public String goGbglGbglZzgbEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/zzgb/edit";
	}

	@RequestMapping(value="/gbgl/zzgb/list")
	public String goGbglGbglZzgbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		request.setAttribute("gbbq", GuoBang.ZAI_ZHONG_BIAO_QIAN);
		
		return moduleName+"/gbgl/zzgb/list";
	}

	@RequestMapping(value="/gbgl/zzgb/detail")
	public String goGbglGbglZzgbDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/zzgb/detail";
	}

	@RequestMapping(value="/gbgl/pzgb/new")
	public String goGbglGbglPzgbNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/pzgb/new";
	}

	@RequestMapping(value="/gbgl/pzgb/edit")
	public String goGbglGbglPzgbEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/pzgb/edit";
	}

	@RequestMapping(value="/gbgl/pzgb/list")
	public String goGbglGbglPzgbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		request.setAttribute("gbbq", GuoBang.PI_ZHONG_BIAO_QIAN);
		
		return moduleName+"/gbgl/pzgb/list";
	}

	@RequestMapping(value="/gbgl/pzgb/detail")
	public String goGbglGbglPzgbDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/pzgb/detail";
	}

	@RequestMapping(value="/gbgl/rcgb/new")
	public String goGbglGbglRcgbNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/rcgb/new";
	}

	@RequestMapping(value="/gbgl/rcgb/edit")
	public String goGbglGbglRcgbEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/rcgb/edit";
	}

	@RequestMapping(value="/gbgl/rcgb/list")
	public String goGbglGbglRcgbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		request.setAttribute("gbbq", GuoBang.RU_CHANG_BIAO_QIAN);
		
		return moduleName+"/gbgl/rcgb/list";
	}

	@RequestMapping(value="/gbgl/rcgb/detail")
	public String goGbglGbglRcgbDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/rcgb/detail";
	}

	@RequestMapping(value="/gbgl/ccgb/new")
	public String goGbglGbglCcgbNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return moduleName+"/gbgl/ccgb/new";
	}

	@RequestMapping(value="/gbgl/ccgb/edit")
	public String goGbglGbglCcgbEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);

		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/ccgb/edit";
	}

	@RequestMapping(value="/gbgl/ccgb/list")
	public String goGbglGbglCcgbList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		request.setAttribute("gbbq", GuoBang.CHU_CHANG_BIAO_QIAN);
		
		return moduleName+"/gbgl/ccgb/list";
	}

	@RequestMapping(value="/gbgl/ccgb/detail")
	public String goGbglGbglCcgbDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		GuoBang gb=guoBangService.selectGuoBangById(id);
		request.setAttribute("gb", gb);

		CheLiang gbcl = cheLiangService.selectCheLiangById(String.valueOf(gb.getGbclId()));
		request.setAttribute("gbcl", gbcl);
		
		DingDan pzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("pzdd", pzdd);

		DingDan mzdd=dingDanService.selectDingDanByWybm(gb.getPzddbm());
		request.setAttribute("mzdd", mzdd);
		
		return moduleName+"/gbgl/ccgb/detail";
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
			
			int count=guoBangService.newGuoBang(gb);
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
			
			int count=guoBangService.editGuoBang(gb);
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
		int count=guoBangService.deleteGuoBang(ids);
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
			int count = guoBangService.queryGBGLGBGLZHCXForInt(cph,gbbq,gbsjs,gbsje);
			List<DingDan> zhglList=guoBangService.queryGBGLGBGLZHCXList(cph, gbbq, gbsjs, gbsje, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}
}
