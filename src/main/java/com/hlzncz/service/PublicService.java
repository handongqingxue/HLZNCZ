package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;

public interface PublicService {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int queryWuZiLeiXingForInt(String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order);

	public WuZiLeiXing selectWuZiLeiXingById(String id);

	public int newWuZiLeiXing(WuZiLeiXing wzlx);

	public int editWuZiLeiXing(WuZiLeiXing wzlx);

	public int deleteWuZiLeiXing(String ids);

	public int queryWuZiForInt(String mc, String wzlxmc);

	public List<WuZi> queryWuZiList(String mc, String wzlxmc, int page, int rows, String sort, String order);

	public WuZi selectWuZiById(String id);

	public int newWuZi(WuZi wz);

	public int editWuZi(WuZi wz);
}
