package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface CangKuMapper {

	public int newCangKu(CangKu ck);

	public int deleteCangKu(List<String> idList);

	public int editCangKu(CangKu ck);

	public int queryCangKuForInt(@Param("mc") String mc);

	public List<CangKu> queryCangKuList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public CangKu selectCangKuById(String id);
}
