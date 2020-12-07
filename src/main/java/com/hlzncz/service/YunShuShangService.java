package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.YunShuShang;

public interface YunShuShangService {

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(String ids);

	public int editYunShuShang(YunShuShang yss);

	public int queryYunShuShangForInt(String mc);

	public List<YunShuShang> queryYunShuShangList(String mc, int page, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);
}