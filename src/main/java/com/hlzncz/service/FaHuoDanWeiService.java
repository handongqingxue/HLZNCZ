package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.FaHuoDanWei;

public interface FaHuoDanWeiService {

	public int newFaHuoDanWei(FaHuoDanWei fhdw);

	public int deleteFaHuoDanWei(String ids);

	public int editFaHuoDanWei(FaHuoDanWei fhdw);

	public int queryFaHuoDanWeiForInt(String dwmc);

	public List<FaHuoDanWei> queryFaHuoDanWeiList(String dwmc, int page, int rows, String sort, String order);

	public FaHuoDanWei selectFaHuoDanWeiById(String id);
}
