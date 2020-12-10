package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface CheLiangService {

	public int newCheLiang(CheLiang cl);

	public int deleteCheLiang(String ids);

	public int shenHeCheLiang(String ids,String flag);

	public int editCheLiang(CheLiang cl);

	public int queryCheLiangForInt(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz);

	public List<CheLiang> queryCheLiangList(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz, int page, int rows, String sort, String order);

	public CheLiang selectCheLiangById(String id);
}
