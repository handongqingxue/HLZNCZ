package com.hlzncz.service.serviceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class ZhiJianBaoGaoServiceImpl implements ZhiJianBaoGaoService {

	@Autowired
	private ZhiJianBaoGaoMapper zhiJianBaoGaoDao;
	@Autowired
	private DingDanMapper dingDanDao;

	@Override
	public int editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		int flag=dingDanDao.editDingDan(dd);
		if(zhiJianBaoGaoDao.selectZhiJianBaoGaoByGlddBm(dd.getWybm())==null) {
			flag=zhiJianBaoGaoDao.newZhiJianBaoGao(zjbg);
		}
		else {
			flag=zhiJianBaoGaoDao.editZhiJianBaoGao(zjbg);
		}
		return flag;
	}

	@Override
	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		return zhiJianBaoGaoDao.newZhiJianBaoGao(zjbg);
	}

	@Override
	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		return zhiJianBaoGaoDao.editZhiJianBaoGao(zjbg);
	}

	@Override
	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(String glddBm) {
		// TODO Auto-generated method stub
		return zhiJianBaoGaoDao.selectZhiJianBaoGaoByGlddBm(glddBm);
	}

	@Override
	public ZhiJianBaoGao selectZhiJianBaoGaoById(String id) {
		// TODO Auto-generated method stub
		return zhiJianBaoGaoDao.selectZhiJianBaoGaoById(id);
	}

	@Override
	public int updateZhiJianBaoGaoJLByGlddBms(Integer jl, String glddBms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> newGlddBmList = Arrays.asList(glddBms.split(","));
		List<String> updateGlddBmList=new ArrayList<String>();
		/*
		//这种利用游标遍历的方法暂时不用
		Iterator<String> glddBmIt = glddBmList.iterator();
		while (glddBmIt.hasNext()) {
			String glddBm = glddBmIt.next();
			if(zhiJianBaoGaoDao.selectZhiJianBaoGaoByGlddBm(glddBm)==null) {
				ZhiJianBaoGao zjbg=new ZhiJianBaoGao();
				zjbg.setJl(jl);
				zjbg.setGlddBm(glddBm);
				count+=zhiJianBaoGaoDao.newZhiJianBaoGao(zjbg);
			}
			else {
				//flag=zhiJianBaoGaoDao.editZhiJianBaoGao(zjbg);
				glddBmIt.remove();
			}
		}
		*/
		for (String glddBm : newGlddBmList) {
			if(zhiJianBaoGaoDao.selectZhiJianBaoGaoByGlddBm(glddBm)==null) {
				ZhiJianBaoGao zjbg=new ZhiJianBaoGao();
				zjbg.setJl(jl);
				zjbg.setGlddBm(glddBm);
				count+=zhiJianBaoGaoDao.newZhiJianBaoGao(zjbg);
			}
			else {
				updateGlddBmList.add(glddBm);
			}
		}
		
		count+=zhiJianBaoGaoDao.updateZhiJianBaoGaoJLByGlddBms(jl,updateGlddBmList);
		
		return count;
	}
}
