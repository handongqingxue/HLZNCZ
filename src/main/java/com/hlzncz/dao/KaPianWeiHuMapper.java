package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface KaPianWeiHuMapper {

	public int newKaPianWeiHu(KaPianWeiHu kpwh);

	public int deleteKaPianWeiHu(List<String> idList);

	public int editKaPianWeiHu(KaPianWeiHu kpwh);

	public int queryKaPianWeiHuForInt(@Param("kh") String kh);

	public List<KaPianWeiHu> queryKaPianWeiHuList(@Param("kh") String kh, int i, int rows, String sort, String order);

	public KaPianWeiHu selectKaPianWeiHuById(String id);
}
