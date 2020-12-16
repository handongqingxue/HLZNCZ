package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.DingDan;

public interface DingDanMapper {

	public int newWoYaoXiaDan(DingDan dd);

	public int deleteDingDan(List<String> wybmList);

	public int editDingDan(DingDan dd);

	public int queryWoYaoXiaDanForInt(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId);

	public List<DingDan> queryWoYaoXiaDanList(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, int i, int rows, String sort, String order);

	public int queryDingDanShenHeForInt(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId);

	public List<DingDan> queryDingDanShenHeList(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, int i, int rows, String sort, String order);

	public int queryDDGLZHGLForInt(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jcsjs") String jcsjs, @Param("jcsje") String jcsje, @Param("jhysrq") String jhysrq, @Param("yss") String yss,
			@Param("wzmc") String wzmc,@Param("fhdwmc") String fhdwmc,@Param("shdwmc") String shdwmc,@Param("sjxm") String sjxm,@Param("sjsfz") String sjsfz);

	public List<DingDan> queryDDGLZHGLList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jcsjs") String jcsjs, @Param("jcsje") String jcsje, @Param("jhysrq") String jhysrq, @Param("yss") String yss,
			@Param("wzmc") String wzmc,@Param("fhdwmc") String fhdwmc,@Param("shdwmc") String shdwmc,@Param("sjxm") String sjxm,@Param("sjsfz") String sjsfz, @Param("clzt") String clzt, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public DingDan selectDingDanByWybm(@Param("wybm") String wybm);

	public int tiJiaoGuoBang(List<String> wybmList);

	public List<DingDan> queryDDGLZHGLYCCLNotLimitList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jhysrq") String jhysrq, @Param("clzt") String clzt);

	public List<DingDan> queryDDGLZHGLYCCLList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph,  
			 @Param("jhysrq") String jhysrq, @Param("clzt") String clzt, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public int updateDingDanZT(@Param("ddztId") Integer ddztId, @Param("wybmList") List<String> wybmList);

	public int queryBqglWgjcYbwjForInt(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jhysrq") String jhysrq, @Param("wlmc") String wzmc, @Param("fhdwmc") String fhdwmc,
			@Param("shdwmc") String shdwmc);

	public List<DingDan> queryBqglWgjcYbwjList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jhysrq") String jhysrq, @Param("wlmc") String wlmc, @Param("fhdwmc") String fhdwmc,
			@Param("shdwmc") String shdwmc, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public int queryBqglWgjcEbwjForInt(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph);

	public List<DingDan> queryBqglWgjcEbwjList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort,
			String order);
}
