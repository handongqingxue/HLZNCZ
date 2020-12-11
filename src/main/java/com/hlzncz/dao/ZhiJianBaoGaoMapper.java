package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface ZhiJianBaoGaoMapper {

	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(@Param("glddBm") String glddBm);

	public ZhiJianBaoGao selectZhiJianBaoGaoById(@Param("id") String id);

	public int updateZhiJianBaoGaoJLByGlddBms(@Param("jl") Integer jl, @Param("glddBmList") List<String> glddBmList);

	public int queryZJZXHZJGLZJBGForInt(@Param("jl") String jl, @Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph);

	public List<DingDan> queryZJZXHZJGLZJBGList(@Param("jl") String jl, @Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, 
			@Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);
}
