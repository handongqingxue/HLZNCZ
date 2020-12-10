package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface GuoBangMapper {

	public int newGuoBang(GuoBang gb);

	public int deleteGuoBang(List<String> idList);

	public int editGuoBang(GuoBang gb);

	public GuoBang selectGuoBangById(@Param("id") String id);

	public int queryGBGLGBGLZHCXForInt(@Param("cph") String cph, @Param("gbbq") String gbbq, @Param("gbsjs") String gbsjs, @Param("gbsje") String gbsje);

	public List<DingDan> queryGBGLGBGLZHCXList(@Param("cph") String cph, @Param("gbbq") String gbbq, @Param("gbsjs") String gbsjs, @Param("gbsje") String gbsje, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
