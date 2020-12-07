package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface FaHuoDanWeiMapper {

	public int newFaHuoDanWei(FaHuoDanWei fhdw);

	public int deleteFaHuoDanWei(List<String> idList);

	public int editFaHuoDanWei(FaHuoDanWei fhdw);

	public int queryFaHuoDanWeiForInt(@Param("dwmc") String dwmc);

	public List<FaHuoDanWei> queryFaHuoDanWeiList(@Param("dwmc") String dwmc, int i, int rows, String sort, String order);

	public FaHuoDanWei selectFaHuoDanWeiById(String id);
}
