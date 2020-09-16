package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.WuZiLeiXing;

public interface PublicMapper {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int queryWuZiLeiXingForInt(@Param("mc") String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public WuZiLeiXing selectWuZiLeiXingById(String id);

	public int newWuZiLeiXing(WuZiLeiXing wzlx);

	public int editWuZiLeiXing(WuZiLeiXing wzlx);

	public int deleteWuZiLeiXing(List<String> idList);
}
