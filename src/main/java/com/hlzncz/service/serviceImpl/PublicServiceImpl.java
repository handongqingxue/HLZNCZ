package com.hlzncz.service.serviceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.*;
import com.hlzncz.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PublicMapper publicDao;
	
	public void selectNav(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicDao.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		String fnid = request.getParameter("fnid");
		Integer parId = null;
		if(StringUtils.isEmpty(fnid)) {
			parId = leftNavList.get(0).getId();
		}
		else {
			parId=Integer.parseInt(fnid);
		}
		List<CaiDan> topNavList = publicDao.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicDao.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
	}

	@Override
	public int queryZJZXHZJGLZJBGForInt(String jl, String ddh, String ddztId, String cph) {
		// TODO Auto-generated method stub
		return publicDao.queryZJZXHZJGLZJBGForInt(jl, ddh, ddztId, cph);
	}

	@Override
	public List<DingDan> queryZJZXHZJGLZJBGList(String jl, String ddh, String ddztId, String cph, int page, int rows,
			String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryZJZXHZJGLZJBGList(jl, ddh, ddztId, cph, (page-1)*rows, rows, sort, order);
	}

	@Override
	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return publicDao.queryDingDanZhuangTaiCBBList();
	}

	@Override
	public int queryHaoMaForInt(String hm, String pdh, Integer ztId) {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaForInt(hm,pdh,ztId);
	}

	@Override
	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaList(hm, pdh, ztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaZhuangTaiCBBList();
	}

	@Override
	public List<JueSe> queryJueSeByIds(String ids) {
		// TODO Auto-generated method stub
		return publicDao.queryJueSeByIds(ids);
	}

	@Override
	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids) {
		// TODO Auto-generated method stub
		return publicDao.queryShouHuoDanWeiByIds(ids);
	}
}
