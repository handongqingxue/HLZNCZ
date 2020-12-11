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
}
