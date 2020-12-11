package com.hlzncz.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.*;
import com.hlzncz.entity.*;
import com.hlzncz.service.*;

@Service
public class JueSeServiceImpl implements JueSeService {

	@Autowired
	private JueSeMapper jueSeDao;

	@Override
	public List<JueSe> queryJueSeByIds(String ids) {
		// TODO Auto-generated method stub
		return jueSeDao.queryJueSeByIds(ids);
	}
}
