package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.CheLiang;

public interface CheLiangMapper {

	public int newCheLiang(CheLiang cl);

	public int deleteCheLiang(List<String> idList);

	public int shenHeCheLiang(@Param("idList") List<String> idList, @Param("flag") String flag);

	public int editCheLiang(CheLiang cl);

	public int queryCheLiangForInt(@Param("cph") String cph, @Param("cllx") Integer cllx, @Param("sfzy") Boolean sfzy, @Param("pfjd") Integer pfjd, @Param("shzt") String shzt, @Param("bz") String bz);

	public List<CheLiang> queryCheLiangList(@Param("cph") String cph, @Param("cllx") Integer cllx, @Param("sfzy") Boolean sfzy, @Param("pfjd") Integer pfjd, @Param("shzt") String shzt, @Param("bz") String bz, int i, int rows, String sort, String order);

	public CheLiang selectCheLiangById(String id);
}
