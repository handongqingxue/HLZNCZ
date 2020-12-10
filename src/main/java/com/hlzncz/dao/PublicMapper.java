package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface PublicMapper {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int queryZJZXHZJGLZJBGForInt(@Param("jl") String jl, @Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph);

	public List<DingDan> queryZJZXHZJGLZJBGList(@Param("jl") String jl, @Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, 
			@Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList();

	public int editGuoBang(GuoBang gb);

	public int queryHaoMaForInt(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId);

	public List<HaoMa> queryHaoMaList(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId, int i, int rows, String sort, String order);

	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList();

	public List<JueSe> queryJueSeByIds(@Param("ids") String ids);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(@Param("ids") String ids);
}
