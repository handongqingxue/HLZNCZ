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
import org.springframework.web.bind.annotation.ResponseBody;

import com.hlzncz.util.JsonUtil;
import com.hlzncz.util.PlanResult;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;
import com.hlzncz.entity.YongHu;
import com.hlzncz.service.PublicService;

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

	@RequestMapping(value="/jcxx/wzgl/wzlx/list")
	public String goWzlxList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzlx/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/new")
	public String goWzlxNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzlx/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/detail")
	public String goWzlxDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/detail";
	}

	@RequestMapping(value="/jcxx/wzgl/wzlx/edit")
	public String goWzlxEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZiLeiXing wzlx=publicService.selectWuZiLeiXingById(id);
		request.setAttribute("wzlx", wzlx);
		
		return "jcxx/wzgl/wzlx/edit";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/list")
	public String goWzglList(HttpServletRequest request) {
		
		selectNav(request);
		
		return "jcxx/wzgl/wzgl/list";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/new")
	public String goWzglNew(HttpServletRequest request) {

		selectNav(request);
		
		return "jcxx/wzgl/wzgl/new";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/detail")
	public String goWzglDetail(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/detail";
	}

	@RequestMapping(value="/jcxx/wzgl/wzgl/edit")
	public String goWzglEdit(HttpServletRequest request) {
		
		selectNav(request);
		String id = request.getParameter("id");
		WuZi wz=publicService.selectWuZiById(id);
		request.setAttribute("wz", wz);
		
		return "jcxx/wzgl/wzgl/edit";
	}
	
	/**
	 * ��ѯ��������
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
	
	@RequestMapping(value="/newWuZiLeiXing")
	@ResponseBody
	public Map<String, Object> newWuZiLeiXing(WuZiLeiXing wzlx) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newWuZiLeiXing(wzlx);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�����������ͳɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "������������ʧ�ܣ�");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/editWuZiLeiXing")
	@ResponseBody
	public Map<String, Object> editWuZiLeiXing(WuZiLeiXing wzlx) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editWuZiLeiXing(wzlx);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�༭�������ͳɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭��������ʧ�ܣ�");
		}
		return jsonMap;
	}
	
	@RequestMapping(value="/deleteWuZiLeiXing",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWuZiLeiXing(String ids) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=publicService.deleteWuZiLeiXing(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("ɾ����������ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("ɾ���������ͳɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
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

	@RequestMapping(value="/newWuZi")
	@ResponseBody
	public Map<String, Object> newWuZi(WuZi wz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.newWuZi(wz);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�������ʳɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "��������ʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/editWuZi")
	@ResponseBody
	public Map<String, Object> editWuZi(WuZi wz) {
		
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		
		int count=publicService.editWuZi(wz);
		if(count>0) {
			jsonMap.put("message", "ok");
			jsonMap.put("info", "�༭���ʳɹ���");
		}
		else {
			jsonMap.put("message", "no");
			jsonMap.put("info", "�༭����ʧ�ܣ�");
		}
		return jsonMap;
	}

	@RequestMapping(value="/deleteWuZi",produces="plain/text; charset=UTF-8")
	@ResponseBody
	public String deleteWuZi(String ids) {
		//TODO ��Է���Ķ�̬����ʵʱ��������
		int count=publicService.deleteWuZi(ids);
		PlanResult plan=new PlanResult();
		String json;
		if(count==0) {
			plan.setStatus(0);
			plan.setMsg("ɾ������ʧ��");
			json=JsonUtil.getJsonFromObject(plan);
		}
		else {
			plan.setStatus(1);
			plan.setMsg("ɾ�����ʳɹ�");
			json=JsonUtil.getJsonFromObject(plan);
		}
		return json;
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
	
	@RequestMapping(value="/exit")
	public String exit(HttpSession session) {
		System.out.println("�˳��ӿ�");
		Subject currentUser = SecurityUtils.getSubject();       
	    currentUser.logout();    
		return "login";
	}
}
