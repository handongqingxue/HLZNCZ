package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.DingDan;

public interface DingDanService {

	public int newDingDanZongHeGuanLi(DingDan dd);

	public int newWoYaoXiaDan(DingDan dd);

	public int deleteDingDan(String wybms);

	public int editDingDan(DingDan dd);

	public int queryWoYaoXiaDanForInt(String ddh, Integer ddztId);

	public List<DingDan> queryWoYaoXiaDanList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order);

	public int queryDingDanShenHeForInt(String ddh, Integer ddztId);

	public List<DingDan> queryDingDanShenHeList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order);

	public int queryDDGLZHGLForInt(String ddh, String ddztId, String cph, String jcsjs, String jcsje, String jhysrq,
			String yss);

	public List<DingDan> queryDDGLZHGLList(String ddh, String ddztId, String cph, String jcsjs, String jcsje,
			String jhysrq, String yss, String clzt, int page, int rows, String sort, String order);

	public int tiJiaoGuoBang(String wybms);

	public int queryDDGLZHGLYCCLForInt(String ddh, String ddztId, String cph, String jhysrq, String clzt);

	public List<DingDan> queryDDGLZHGLYCCLList(String ddh, String ddztId, String cph, 
			String jhysrq, String clzt, int page, int rows, String sort, String order);

	public DingDan selectDingDanByWybm(String wybm);

	public int updateDingDanZT(Integer ddztId, String wybms);

	public int queryBqglWgjcYbwjForInt(String ddh, String ddztId, String cph, String jhysrq, String wlmc, String fhdwmc,
			String shdwmc);

	public List<DingDan> queryBqglWgjcYbwjList(String ddh, String ddztId, String cph, String jhysrq, String wlmc, String fhdwmc,
			String shdwmc, int page, int rows, String sort, String order);

	public int queryBqglWgjcEbwjForInt(String ddh, String ddztId, String cph);

	public List<DingDan> queryBqglWgjcEbwjList(String ddh, String ddztId, String cph, int page, int rows, String sort,
			String order);
}
