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
	private CheLiangService cheLiangService;
	@Autowired
	private HaoMaZhuangTaiService haoMaZhuangTaiService;
	@Autowired
	private ShouHuoDanWeiService shouHuoDanWeiService;
	@Autowired
	private JueSeService jueSeService;
	@Autowired
	private DingDanZhuangTaiService dingDanZhuangTaiService;
	
	/**
	 * ��ת����¼ҳ
	 * @return
	 */
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	/**
	 * ��ת����ҳ
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/goIndex")
	public String goIndex(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "index";
	}

	/**
	 * ��ѯ����״̬��������Ϣ
	 * @return
	 */
	@RequestMapping(value="/queryDingDanZhuangTaiCBBList")
	@ResponseBody
	public Map<String, Object> queryDingDanZhuangTaiCBBList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<DingDanZhuangTai> ddztList=dingDanZhuangTaiService.queryDingDanZhuangTaiCBBList();
		
		jsonMap.put("rows", ddztList);
		
		return jsonMap;
	}

	/**
	 * ��ѯ����״̬��������Ϣ
	 * @return
	 */
	@RequestMapping(value="/queryHaoMaZhuangTaiCBBList")
	@ResponseBody
	public Map<String, Object> queryHaoMaZhuangTaiCBBList() {

		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<HaoMaZhuangTai> hmztList=haoMaZhuangTaiService.queryHaoMaZhuangTaiCBBList();
		
		jsonMap.put("rows", hmztList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryJueSeByIds")
	@ResponseBody
	public Map<String, Object> queryJueSeByIds(String ids) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<JueSe> jsList=jueSeService.queryJueSeByIds(ids);

		jsonMap.put("total", jsList.size());
		jsonMap.put("rows", jsList);
		
		return jsonMap;
	}

	@RequestMapping(value="/queryShouHuoDanWeiByIds")
	@ResponseBody
	public Map<String, Object> queryShouHuoDanWeiByIds(String ids) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		List<ShouHuoDanWei> shdwList=shouHuoDanWeiService.queryShouHuoDanWeiByIds(ids);

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
	
	/**
	 * ��¼
	 * @param model
	 * @param yhm
	 * @param ysmm
	 * @param request
	 * @return
	 */
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
