package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.ShouHuoDanWei;

public interface ShouHuoDanWeiService {

	public int newShouHuoDanWei(ShouHuoDanWei shdw);
	
	public int deleteShouHuoDanWei(String ids);

	public int queryShouHuoDanWeiForInt(String dwmc,Boolean ywdl);

	public List<ShouHuoDanWei> queryShouHuoDanWeiList(String dwmc, Boolean ywdl, int page, int rows, String sort, String order);

	public ShouHuoDanWei selectShouHuoDanWeiById(String id);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids);
}
