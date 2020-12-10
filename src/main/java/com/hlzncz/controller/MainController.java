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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hlzncz.entity.*;
import com.hlzncz.service.*;
import com.hlzncz.util.FileUploadUtils;
import com.hlzncz.util.JsonUtil;
import com.hlzncz.util.PlanResult;

import net.sf.json.JSONObject;

/*
 * �������̣�
 * 1.�����ɵĶ���״̬���Ǵ���ˣ�����Ա�ڶ����б���ͨ����״̬������µ���
 * 2.�볧ǰˢ���֤��״̬����Ŷ��С�LED��Ļ��ʾ�볧�ţ��Զ��кţ���ɴ��볧��
 * 3.����ʶ������ͷʶ���״̬��ɴ����顣����ϸ���������ߣ�������״̬��������ɡ�
 * 
 * ���������
 * 1.�������δͨ����״̬���Ǳ༭�У���Ҫ������ˡ�ͨ���Ļ���״̬�������µ���
 * 2.�Զ��к�Ҫ��û���ҵ�����������ʱ���ˣ�״̬�Ӵ��볧�ֱ�����µ��ˣ��͵������Ŷ��ˡ�
 */
@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private PublicService publicService;
	@Autowired
	private DingDanService dingDanService;
	@Autowired
	private ZhiJianBaoGaoService zhiJianBaoGaoService;
	@Autowired
	private WuZiService wuZiService;
	@Autowired
	private ShouHuoDanWeiService shouHuoDanWeiService;
	@Autowired
	private CheLiangService cheLiangService;
	@Autowired
	private YongHuService yongHuService;
	@Autowired
	private DuiLieService duiLieService;
	
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	@RequestMapping(value="/goIndex")
	public String goIndex(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "index";
	}

	@RequestMapping(value="/xtgl/yhqx/yhgl/new")
	public String goXtglYhqxYhglNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "xtgl/yhqx/yhgl/new";
	}

	@RequestMapping(value="/xtgl/yhqx/yhgl/edit")
	public String goXtglYhqxYhglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		YongHu yh=yongHuService.selectYongHuById(id);
		request.setAttribute("yh", yh);
		
		return "xtgl/yhqx/yhgl/edit";
	}
	
	@RequestMapping(value="/xtgl/yhqx/yhgl/list")
	public String goXtglYhqxYhglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "xtgl/yhqx/yhgl/list";
	}

	@RequestMapping(value="/jhxt/jhxx/hmcx/new")
	public String goHmcxNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "jhxt/jhxx/hmcx/new";
	}

	@RequestMapping(value="/jhxt/jhxx/hmcx/list")
	public String goHmcxList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "jhxt/jhxx/hmcx/list";
	}
	
	@RequestMapping(value="/jhxt/pzgl/dlgl/new")
	public String goJhxtPzglDlglNew(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "jhxt/pzgl/dlgl/new";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/edit")
	public String goJhxtPzglDlglEdit(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jhxt/pzgl/dlgl/edit";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/list")
	public String goJhxtPzglDlglList(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "jhxt/pzgl/dlgl/list";
	}

	@RequestMapping(value="/jhxt/pzgl/dlgl/detail")
	public String goJhxtPzglDlglDetail(HttpServletRequest request) {
		
		publicService.selectNav(request);
		String id = request.getParameter("id");
		DuiLie dl=duiLieService.selectDuiLieById(id);
		request.setAttribute("dl", dl);

		ShouHuoDanWei shdw=shouHuoDanWeiService.selectShouHuoDanWeiById(String.valueOf(dl.getShdwId()));
		request.setAttribute("shdw", shdw);
		
		return "jhxt/pzgl/dlgl/detail";
	}

	@RequestMapping(value="/newDingDanZongHeGuanLi")
	@ResponseBody
	public Map<String, Object> newDingDanZongHeGuanLi(DingDan dd) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=dingDanService.newDingDanZongHeGuanLi(dd);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "���������ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "��������ʧ�ܣ�");
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
			jsonMap.put("info", "���������ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "��������ʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteWoYaoXiaDan",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWoYaoXiaDan(String wybms) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=dingDanService.deleteDingDan(wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("ɾ����Ҫ�µ�ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("ɾ����Ҫ�µ��ɹ�");
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
			jsonMap.put("info", "�༭�����ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭����ʧ�ܣ�");
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
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=dingDanService.updateDingDanZT(DingDan.YI_XIA_DAN,wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("ͨ���������ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("ͨ��������˳ɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/tuiHuiDingDanShenHe",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tuiHuiDingDanShenHe(String wybms) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=dingDanService.updateDingDanZT(DingDan.BIAN_JI_ZHONG,wybms);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("�˻ض������ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("�˻ض�����˳ɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

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
	 * ��������-�ۺϹ����ѯ
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
			int count = dingDanService.queryDDGLZHGLForInt(ddh,ddztId,cph,jcsjs,jcsje,jhysrq,yss);
			List<DingDan> zhglList=dingDanService.queryDDGLZHGLList(ddh, ddztId,cph,jcsjs,jcsje,jhysrq,yss,clzt, page, rows, sort, order);
			
			jsonMap.put("total", count);
			jsonMap.put("rows", zhglList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jsonMap;
	}

	@RequestMapping(value="/tiJiaoGuoBang",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tiJiaoGuoBang(String wybms) {
		int count=dingDanService.tiJiaoGuoBang(wybms);
		PlanResult plan=new PlanResult();
		
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("�ύ����ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("�ύ�����ɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
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

	@RequestMapping(value="/tongGuoZhiJian",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String tongGuoZhiJian(String wybms) {
		int count=dingDanService.updateDingDanZT(DingDan.DAI_YI_JIAN_SHANG_BANG, wybms);
		zhiJianBaoGaoService.updateZhiJianBaoGaoJLByGlddBms(ZhiJianBaoGao.HE_GE, wybms);
		PlanResult plan=new PlanResult();

		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("�ʼ�ʧ�ܣ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("�ʼ�ɹ���");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
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
						if("�ɹ�".equals(fileJson.get("msg"))) {
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
				jsonMap.put("info", "�༭���ʼ�ɹ���");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "�༭���ʼ�ʧ�ܣ�");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/queryZJZXHZJGLZJBGList")
	@ResponseBody
	public Map<String, Object> queryZJZXHZJGLZJBGList(String jl,String ddh,String ddztId,String cph,
			int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		try {
			int count = publicService.queryZJZXHZJGLZJBGForInt(jl,ddh,ddztId,cph);
			List<DingDan> ycclList=publicService.queryZJZXHZJGLZJBGList(jl, ddh, ddztId, cph, page, rows, sort, order);
			
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
			jsonMap.put("info", "�����ʼ챨��ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�����ʼ챨��ʧ�ܣ�");
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
			jsonMap.put("info", "�޸��ʼ챨��ɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�޸��ʼ챨��ʧ�ܣ�");
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
						if("�ɹ�".equals(fileJson.get("msg"))) {
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
			
			int count=yongHuService.newYongHu(yh);
			if(count>0) {
				jsonMap.put("message", "ok");
				jsonMap.put("info", "�����û���Ϣ�ɹ���");
			}
			else {
				jsonMap.put("message", "no");
				jsonMap.put("info", "�����û���Ϣʧ�ܣ�");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteYongHu",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteYongHu(String ids) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=yongHuService.deleteYongHu(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("ɾ���û���Ϣʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("ɾ���û���Ϣ�ɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
	}

	@RequestMapping(value="/queryYongHuList")
	@ResponseBody
	public Map<String, Object> queryYongHuList(String yhm,Integer zt,int page,int rows,String sort,String order) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count = yongHuService.queryYongHuForInt(yhm, zt);
		List<YongHu> yhList=yongHuService.queryYongHuList(yhm, zt, page, rows, sort, order);
		
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

	@RequestMapping(value="/selectWuZiById")
	@ResponseBody
	public Map<String, Object> selectWuZiById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		WuZi wz=wuZiService.selectWuZiById(id);

		jsonMap.put("wz", wz);
		
		return jsonMap;
	}

	@RequestMapping(value="/selectCheLiangById")
	@ResponseBody
	public Map<String, Object> selectCheLiangById(String id) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		CheLiang cl=cheLiangService.selectCheLiangById(id);

		jsonMap.put("cl", cl);
		
		return jsonMap;
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST,produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String login(Model model,String yhm,String ysmm,HttpServletRequest request) {
		System.out.println("===��¼�ӿ�===");
		//����ֵ��json
		PlanResult plan=new PlanResult();
		HttpSession session=request.getSession();
		//TODO���⸽����ӵ�¼������Ϣ���裬���û����˺��Լ����봢�浽shiro��ܵĹ������õ��з��������ѯ
		try {
			//System.out.println("��֤��һ��");
			UsernamePasswordToken token = new UsernamePasswordToken(yhm,ysmm);
			Subject currentUser = SecurityUtils.getSubject();  
			if (!currentUser.isAuthenticated()){
				//ʹ��shiro����֤  
				token.setRememberMe(true);  
				currentUser.login(token);//��֤��ɫ��Ȩ��  
			}
		}catch (Exception e) {
			e.printStackTrace();
			plan.setStatus(1);
			plan.setMsg("��½ʧ��");
			return JsonUtil.getJsonFromObject(plan);
		}
		YongHu yh=(YongHu)SecurityUtils.getSubject().getPrincipal();
		session.setAttribute("yongHu", yh);
		
		plan.setStatus(0);
		plan.setMsg("��֤ͨ��");
		plan.setUrl("main/goIndex");
		return JsonUtil.getJsonFromObject(plan);
	}
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) {
		System.out.println("�˳��ӿ�");
		Subject currentUser = SecurityUtils.getSubject();       
	    currentUser.logout();    
		return "login";
	}
}
