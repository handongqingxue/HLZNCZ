package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface GuoBangService {
	
	public int newGuoBang(GuoBang gb);

	public int deleteGuoBang(String ids);
	
	public int editGuoBang(GuoBang gb);

	public GuoBang selectGuoBangById(String id);

	public int queryGBGLGBGLZHCXForInt(String cph, String gbbq, String gbsjs, String gbsje);

	public List<DingDan> queryGBGLGBGLZHCXList(String cph, String gbbq, String gbsjs, String gbsje, int page, int rows, String sort,
			String order);
}
