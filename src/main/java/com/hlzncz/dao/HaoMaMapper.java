package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface HaoMaMapper {


	public int queryHaoMaForInt(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId);

	public List<HaoMa> queryHaoMaList(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId, int i, int rows, String sort, String order);

	public int newHaoMaChaXun(HaoMa hm);

	public HaoMa selectHaoMaById(@Param("id") String id);
}
