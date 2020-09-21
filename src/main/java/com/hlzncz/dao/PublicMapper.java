package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.CangKu;
import com.hlzncz.entity.CheLiang;
import com.hlzncz.entity.DuiLie;
import com.hlzncz.entity.FaHuoDanWei;
import com.hlzncz.entity.ShouHuoDanWei;
import com.hlzncz.entity.SiJi;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;

public interface PublicMapper {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int newWuZiLeiXing(WuZiLeiXing wzlx);

	public int deleteWuZiLeiXing(List<String> idList);

	public int editWuZiLeiXing(WuZiLeiXing wzlx);

	public int queryWuZiLeiXingForInt(@Param("mc") String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public WuZiLeiXing selectWuZiLeiXingById(String id);

	public int newWuZi(WuZi wz);

	public int deleteWuZi(List<String> idList);

	public int editWuZi(WuZi wz);

	public int queryWuZiForInt(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc);

	public List<WuZi> queryWuZiList(@Param("mc") String mc, @Param("wzlxmc") String wzlxmc, int i, int rows, String sort, String order);

	public WuZi selectWuZiById(String id);

	public int newCheLiang(CheLiang cl);

	public int deleteCheLiang(List<String> idList);

	public int editCheLiang(CheLiang cl);

	public int queryCheLiangForInt(@Param("cph") String cph, @Param("cllx") Integer cllx);

	public List<CheLiang> queryCheLiangList(@Param("cph") String cph, @Param("cllx") Integer cllx, int i, int rows, String sort, String order);

	public CheLiang selectCheLiangById(String id);

	public int newSiJi(SiJi sj);

	public int deleteSiJi(List<String> idList);

	public int editSiJi(SiJi sj);

	public int querySiJiForInt(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt);

	public List<SiJi> querySiJiList(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt, int i, int rows, String sort, String order);

	public SiJi selectSiJiById(String id);

	public int newFaHuoDanWei(FaHuoDanWei fhdw);

	public int deleteFaHuoDanWei(List<String> idList);

	public int editFaHuoDanWei(FaHuoDanWei fhdw);

	public int queryFaHuoDanWeiForInt(@Param("dwmc") String dwmc);

	public List<FaHuoDanWei> queryFaHuoDanWeiList(@Param("dwmc") String dwmc, int i, int rows, String sort, String order);

	public FaHuoDanWei selectFaHuoDanWeiById(String id);

	public int newShouHuoDanWei(ShouHuoDanWei shdw);

	public int deleteShouHuoDanWei(List<String> idList);

	public int queryShouHuoDanWeiForInt(@Param("dwmc") String dwmc);

	public List<ShouHuoDanWei> queryShouHuoDanWeiList(@Param("dwmc") String dwmc, int i, int rows, String sort, String order);

	public int newCangKu(CangKu ck);

	public int deleteCangKu(List<String> idList);

	public int editCangKu(CangKu ck);

	public int queryCangKuForInt(@Param("mc") String mc);

	public List<CangKu> queryCangKuList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public CangKu selectCangKuById(String id);

	public int newDuiLie(DuiLie dl);

	public int queryDuiLieForInt(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt);

	public List<DuiLie> queryDuiLieList(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt, int i, int rows, String sort, String order);
}
