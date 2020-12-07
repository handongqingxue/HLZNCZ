package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface YunShuShangMapper {

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(List<String> idList);

	public int editYunShuShang(YunShuShang yss);

	public int queryYunShuShangForInt(@Param("mc") String mc);

	public List<YunShuShang> queryYunShuShangList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);
}
