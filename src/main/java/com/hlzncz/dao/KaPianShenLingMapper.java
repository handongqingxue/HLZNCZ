package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface KaPianShenLingMapper {

	public int newKaPianShenLing(KaPianShenLing kpsl);

	public int deleteKaPianShenLing(List<String> idList);

	public int editKaPianShenLing(KaPianShenLing kpsl);

	public int queryKaPianShenLingForInt(@Param("sfzh") String sfzh);

	public List<KaPianShenLing> queryKaPianShenLingList(@Param("sfzh") String sfzh, int i, int rows, String sort, String order);

	public KaPianShenLing selectKaPianShenLingById(String id);
}
