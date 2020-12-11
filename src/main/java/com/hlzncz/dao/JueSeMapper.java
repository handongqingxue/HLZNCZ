package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface JueSeMapper {

	public List<JueSe> queryJueSeByIds(@Param("ids") String ids);
}
