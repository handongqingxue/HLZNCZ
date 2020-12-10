package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface SiJiService {

	public int newSiJi(SiJi sj);

	public int deleteSiJi(String ids);

	public int editSiJi(SiJi sj);

	public int querySiJiForInt(String xm, String sfz, Integer zyzt,String shzt);

	public List<SiJi> querySiJiList(String xm, String sfz, Integer zyzt, String shzt, int page, int rows, String sort, String order);

	public SiJi selectSiJiById(String id);

	public int shenHeSiJi(String ids, String flag);
}
