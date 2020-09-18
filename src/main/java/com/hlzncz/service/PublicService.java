package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.CheLiang;
import com.hlzncz.entity.SiJi;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;

public interface PublicService {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int newWuZiLeiXing(WuZiLeiXing wzlx);

	public int deleteWuZiLeiXing(String ids);

	public int editWuZiLeiXing(WuZiLeiXing wzlx);

	public int queryWuZiLeiXingForInt(String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order);

	public WuZiLeiXing selectWuZiLeiXingById(String id);

	public int newWuZi(WuZi wz);

	public int deleteWuZi(String ids);

	public int editWuZi(WuZi wz);

	public int queryWuZiForInt(String mc, String wzlxmc);

	public List<WuZi> queryWuZiList(String mc, String wzlxmc, int page, int rows, String sort, String order);

	public WuZi selectWuZiById(String id);

	public int newCheLiang(CheLiang cl);

	public int deleteCheLiang(String ids);

	public int editCheLiang(CheLiang cl);

	public int queryCheLiangForInt(String cph, Integer cllx);

	public List<CheLiang> queryCheLiangList(String cph, Integer cllx, int page, int rows, String sort, String order);

	public CheLiang selectCheLiangById(String id);

	public int newSiJi(SiJi sj);

	public int querySiJiForInt(String xm, String sfz, Integer zyzt);

	public List<SiJi> querySiJiList(String xm, String sfz, Integer zyzt, int page, int rows, String sort, String order);
}
