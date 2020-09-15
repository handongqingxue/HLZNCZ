package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.WuZiLeiXing;

public interface PublicService {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int queryWuZiLeiXingForInt(String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order);
}
