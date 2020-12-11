package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface ShouHuoDanWeiMapper {

	public int newShouHuoDanWei(ShouHuoDanWei shdw);

	public int deleteShouHuoDanWei(List<String> idList);

	public int queryShouHuoDanWeiForInt(@Param("dwmc") String dwmc,@Param("ywdl") Boolean ywdl);

	public List<ShouHuoDanWei> queryShouHuoDanWeiList(@Param("dwmc") String dwmc, @Param("ywdl") Boolean ywdl, int i, int rows, String sort, String order);

	public ShouHuoDanWei selectShouHuoDanWeiById(String id);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(@Param("ids") String ids);
}
