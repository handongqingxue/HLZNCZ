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
	 * 跳转到登录页
	 * @return
	 */
	@RequestMapping(value="/goLogin")
	public String goLogin() {
		
		return "login";
	}
	
	/**
	 * 跳转到首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/goIndex")
	public String goIndex(HttpServletRequest request) {
		
		publicService.selectNav(request);
		
		return "index";
	}

	/**
	 * 查询订单状态下拉框信息
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
	 * 查询号码状态下拉框信息
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
	 * 登录
	 * @param model
	 * @param yhm
	 * @param ysmm
	 * @param request
	 * @return
	 */
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
