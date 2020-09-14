package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.CaiDan;
import com.hlzncz.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PublicMapper publicDao;

	public List<CaiDan> selectParCaiDan() {
		// TODO Auto-generated method stub
		return publicDao.selectParCaiDan();
	}

}
