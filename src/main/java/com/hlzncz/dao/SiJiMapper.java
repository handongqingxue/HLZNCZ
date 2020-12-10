package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface SiJiMapper {

	public int newSiJi(SiJi sj);

	public int deleteSiJi(List<String> idList);

	public int editSiJi(SiJi sj);

	public int querySiJiForInt(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt, @Param("shzt") String shzt);

	public List<SiJi> querySiJiList(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt, @Param("shzt") String shzt, int i, int rows, String sort, String order);

	public SiJi selectSiJiById(String id);

	public int shenHeSiJi(@Param("idList") List<String> idList, @Param("flag") String flag);
}
