package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface PublicMapper {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int editGuoBang(GuoBang gb);
}
