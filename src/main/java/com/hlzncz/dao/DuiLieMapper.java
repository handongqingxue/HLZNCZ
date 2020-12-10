package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface DuiLieMapper {

	public int newDuiLie(DuiLie dl);

	public int editDuiLie(DuiLie dl);

	public int queryDuiLieForInt(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt);

	public List<DuiLie> queryDuiLieList(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt, int i, int rows, String sort, String order);

	public DuiLie selectDuiLieById(@Param("id") String id);
}
