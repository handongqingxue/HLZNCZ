package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface YongHuMapper {

	public int newYongHu(YongHu yh);

	public int deleteYongHu(List<String> idList);

	public int editYongHu(YongHu yh);

	public int queryYongHuForInt(@Param("yhm") String yhm, @Param("zt") Integer zt);

	public List<YongHu> queryYongHuList(@Param("yhm") String yhm, @Param("zt") Integer zt, int i, int rows, String sort, String order);

	public YongHu selectYongHuById(@Param("id") String id);
	
	//通过用户信息查询用户
	public YongHu getYongHu(YongHu yh);
}
