package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface DingDanYiChangMapper {

	public List<DingDanYiChang> selectDingDanYiChangByDdbm(@Param("ddbm") String ddbm);
}
