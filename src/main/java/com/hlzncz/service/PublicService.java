package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.CaiDan;
import com.hlzncz.entity.CangKu;
import com.hlzncz.entity.CheLiang;
import com.hlzncz.entity.DingDan;
import com.hlzncz.entity.DuiLie;
import com.hlzncz.entity.FaHuoDanWei;
import com.hlzncz.entity.KaPianShenLing;
import com.hlzncz.entity.KaPianWeiHu;
import com.hlzncz.entity.ShouHuoDanWei;
import com.hlzncz.entity.SiJi;
import com.hlzncz.entity.WuZi;
import com.hlzncz.entity.WuZiLeiXing;
import com.hlzncz.entity.YunShuShang;

public interface PublicService {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int queryWoYaoXiaDanForInt(String ddh, Integer ddztId);

	public int newWoYaoXiaDan(DingDan dd);

	public int editWoYaoXiaDan(DingDan dd);

	public List<DingDan> queryWoYaoXiaDanList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order);

	public DingDan selectDingDanByWybm(String wybm);

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

	public int deleteSiJi(String ids);

	public int editSiJi(SiJi sj);

	public int querySiJiForInt(String xm, String sfz, Integer zyzt);

	public List<SiJi> querySiJiList(String xm, String sfz, Integer zyzt, int page, int rows, String sort, String order);

	public SiJi selectSiJiById(String id);

	public int newFaHuoDanWei(FaHuoDanWei fhdw);

	public int deleteFaHuoDanWei(String ids);

	public int editFaHuoDanWei(FaHuoDanWei fhdw);

	public int queryFaHuoDanWeiForInt(String dwmc);

	public List<FaHuoDanWei> queryFaHuoDanWeiList(String dwmc, int page, int rows, String sort, String order);

	public FaHuoDanWei selectFaHuoDanWeiById(String id);

	public int newShouHuoDanWei(ShouHuoDanWei shdw);
	
	public int deleteShouHuoDanWei(String ids);

	public int queryShouHuoDanWeiForInt(String dwmc);

	public List<ShouHuoDanWei> queryShouHuoDanWeiList(String dwmc, int page, int rows, String sort, String order);

	public ShouHuoDanWei selectShouHuoDanWeiById(String id);

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(String ids);

	public int editYunShuShang(YunShuShang yss);

	public int queryYunShuShangForInt(String mc);

	public List<YunShuShang> queryYunShuShangList(String mc, int page, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);

	public int newCangKu(CangKu ck);

	public int deleteCangKu(String ids);

	public int editCangKu(CangKu ck);

	public int queryCangKuForInt(String mc);

	public List<CangKu> queryCangKuList(String mc, int page, int rows, String sort, String order);

	public CangKu selectCangKuById(String id);

	public int newKaPianShenLing(KaPianShenLing kpsl);

	public int deleteKaPianShenLing(String ids);

	public int editKaPianShenLing(KaPianShenLing kpsl);

	public int queryKaPianShenLingForInt(String sfzh);

	public List<KaPianShenLing> queryKaPianShenLingList(String sfzh, int page, int rows, String sort, String order);

	public KaPianShenLing selectKaPianShenLingById(String id);

	public int newKaPianWeiHu(KaPianWeiHu kpwh);

	public int deleteKaPianWeiHu(String ids);

	public int editKaPianWeiHu(KaPianWeiHu kpwh);

	public int queryKaPianWeiHuForInt(String kh);

	public List<KaPianWeiHu> queryKaPianWeiHuList(String kh, int page, int rows, String sort, String order);

	public KaPianWeiHu selectKaPianWeiHuById(String id);

	public int newDuiLie(DuiLie dl);

	public int queryDuiLieForInt(String mc, String dm, Integer zt);

	public List<DuiLie> queryDuiLieList(String mc, String dm, Integer zt, int page, int rows, String sort,
			String order);
}
