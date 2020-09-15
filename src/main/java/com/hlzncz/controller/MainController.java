package com.hlzncz.controller;

import java.util.List;

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
import com.hlzncz.entity.YongHu;
import com.hlzncz.service.PublicService;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private PublicService publicService;
	
	@RequestMapping(value="/toLogin")
	public String toLogin() {
		
		return "login";
	}
	
	@RequestMapping(value="/toIndex")
	public String toIndex(HttpServletRequest request) {
		
		selectNav(request);
		
		return "index";
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
		plan.setUrl("/main/toIndex");
		return JsonUtil.getJsonFromObject(plan);
	}
	
	private void selectNav(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicService.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		String id = request.getParameter("id");
		Integer parId = null;
		if(StringUtils.isEmpty(id)) {
			parId = leftNavList.get(0).getId();
		}
		else {
			parId=Integer.parseInt(id);
		}
		List<CaiDan> topNavList = publicService.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicService.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
	}
}
