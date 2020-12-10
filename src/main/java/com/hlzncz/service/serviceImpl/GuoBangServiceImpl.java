package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class GuoBangServiceImpl implements GuoBangService {

	@Autowired
	private GuoBangMapper guoBangDao;

	@Override
	public int newGuoBang(GuoBang gb) {
		// TODO Auto-generated method stub
		return guoBangDao.newGuoBang(gb);
	}

	@Override
	public int deleteGuoBang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=guoBangDao.deleteGuoBang(idList);
		return count;
	}

	@Override
	public int editGuoBang(GuoBang gb) {
		// TODO Auto-generated method stub
		return guoBangDao.editGuoBang(gb);
	}

	@Override
	public GuoBang selectGuoBangById(String id) {
		// TODO Auto-generated method stub
		return guoBangDao.selectGuoBangById(id);
	}

	@Override
	public int queryGBGLGBGLZHCXForInt(String cph, String gbbq, String gbsjs, String gbsje) {
		// TODO Auto-generated method stub
		return guoBangDao.queryGBGLGBGLZHCXForInt(cph,gbbq,gbsjs,gbsje);
	}

	@Override
	public List<DingDan> queryGBGLGBGLZHCXList(String cph, String gbbq, String gbsjs, String gbsje, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return guoBangDao.queryGBGLGBGLZHCXList(cph, gbbq, gbsjs, gbsje, (page-1)*rows, rows, sort, order);
	}
}
