package com.hlzncz.dao;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.DingDan;

public interface DingDanMapper {

	public DingDan selectDingDanByWybm(@Param("wybm") String wybm);
}
