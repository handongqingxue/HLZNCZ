package com.hlzncz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hlzncz.entity.*;

public interface PublicMapper {

	public List<CaiDan> selectParCaiDan();

	public List<CaiDan> selectChildCaiDan(Integer parId);

	public int newWoYaoXiaDan(DingDan dd);

	public int deleteDingDan(List<String> wybmList);

	public int editWoYaoXiaDan(DingDan dd);

	public int queryWoYaoXiaDanForInt(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId);

	public List<DingDan> queryWoYaoXiaDanList(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, int i, int rows, String sort, String order);

	public int tongGuoDingDanShenHe(@Param("ddztId") Integer ddztId, @Param("wybmList") List<String> wybmList);

	public int tuiHuiDingDanShenHe(@Param("ddztId") Integer ddztId, @Param("wybmList") List<String> wybmList);

	public int queryDingDanShenHeForInt(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId);

	public List<DingDan> queryDingDanShenHeList(@Param("ddh") String ddh, @Param("ddztId") Integer ddztId, int i, int rows, String sort, String order);

	public int queryDDGLZHGLForInt(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jcsjs") String jcsjs, 
			@Param("jcsje") String jcsje, @Param("jhysrq") String jhysrq, @Param("yss") String yss);

	public List<DingDan> queryDDGLZHGLList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jcsjs") String jcsjs, 
			@Param("jcsje") String jcsje, @Param("jhysrq") String jhysrq, @Param("yss") String yss, @Param("clzt") String clzt, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public int tiJiaoGuoBang(List<String> wybmList);

	public List<DingDan> queryDDGLZHGLYCCLNotLimitList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph, @Param("jhysrq") String jhysrq, @Param("clzt") String clzt);

	public List<DingDan> queryDDGLZHGLYCCLList(@Param("ddh") String ddh, @Param("ddztId") String ddztId, @Param("cph") String cph,  
			 @Param("jhysrq") String jhysrq, @Param("clzt") String clzt, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public DingDan selectDingDanByWybm(@Param("wybm") String wybm);

	public int newGuoBang(GuoBang gb);

	public int deleteGuoBang(List<String> idList);

	public int queryGBGLGBGLZHCXForInt(@Param("cph") String cph, @Param("gbbq") String gbbq, @Param("gbsjs") String gbsjs, @Param("gbsje") String gbsje);

	public List<DingDan> queryGBGLGBGLZHCXList(@Param("cph") String cph, @Param("gbbq") String gbbq, @Param("gbsjs") String gbsjs, @Param("gbsje") String gbsje, @Param("rowNum") int rowNum, @Param("rows") int rows, String sort, String order);

	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList();

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

	public int shenHeCheLiang(@Param("idList") List<String> idList, @Param("flag") String flag);

	public int editCheLiang(CheLiang cl);

	public int editGuoBang(GuoBang gb);

	public int queryCheLiangForInt(@Param("cph") String cph, @Param("cllx") Integer cllx, @Param("sfzy") Boolean sfzy, @Param("pfjd") Integer pfjd, @Param("shzt") String shzt, @Param("bz") String bz);

	public List<CheLiang> queryCheLiangList(@Param("cph") String cph, @Param("cllx") Integer cllx, @Param("sfzy") Boolean sfzy, @Param("pfjd") Integer pfjd, @Param("shzt") String shzt, @Param("bz") String bz, int i, int rows, String sort, String order);

	public CheLiang selectCheLiangById(String id);

	public int newSiJi(SiJi sj);

	public int newYongHu(YongHu yh);

	public int deleteSiJi(List<String> idList);

	public int deleteYongHu(List<String> idList);

	public int shenHeSiJi(@Param("idList") List<String> idList, @Param("flag") String flag);

	public int editSiJi(SiJi sj);

	public int querySiJiForInt(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt, @Param("shzt") String shzt);

	public List<SiJi> querySiJiList(@Param("xm") String xm, @Param("sfz") String sfz, @Param("zyzt") Integer zyzt, @Param("shzt") String shzt, int i, int rows, String sort, String order);

	public SiJi selectSiJiById(String id);

	public int newFaHuoDanWei(FaHuoDanWei fhdw);

	public int deleteFaHuoDanWei(List<String> idList);

	public int editFaHuoDanWei(FaHuoDanWei fhdw);

	public int queryFaHuoDanWeiForInt(@Param("dwmc") String dwmc);

	public List<FaHuoDanWei> queryFaHuoDanWeiList(@Param("dwmc") String dwmc, int i, int rows, String sort, String order);

	public FaHuoDanWei selectFaHuoDanWeiById(String id);

	public int newShouHuoDanWei(ShouHuoDanWei shdw);

	public int deleteShouHuoDanWei(List<String> idList);

	public int queryShouHuoDanWeiForInt(@Param("dwmc") String dwmc,@Param("ywdl") Boolean ywdl);

	public List<ShouHuoDanWei> queryShouHuoDanWeiList(@Param("dwmc") String dwmc, @Param("ywdl") Boolean ywdl, int i, int rows, String sort, String order);

	public ShouHuoDanWei selectShouHuoDanWeiById(String id);

	public int newYunShuShang(YunShuShang yss);

	public int deleteYuShuShang(List<String> idList);

	public int editYunShuShang(YunShuShang yss);

	public int queryYunShuShangForInt(@Param("mc") String mc);

	public List<YunShuShang> queryYunShuShangList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public YunShuShang selectYunShuShangById(String id);

	public int newCangKu(CangKu ck);

	public int deleteCangKu(List<String> idList);

	public int editCangKu(CangKu ck);

	public int queryCangKuForInt(@Param("mc") String mc);

	public List<CangKu> queryCangKuList(@Param("mc") String mc, int i, int rows, String sort, String order);

	public CangKu selectCangKuById(String id);

	public int newKaPianShenLing(KaPianShenLing kpsl);

	public int deleteKaPianShenLing(List<String> idList);

	public int editKaPianShenLing(KaPianShenLing kpsl);

	public int queryKaPianShenLingForInt(@Param("sfzh") String sfzh);

	public List<KaPianShenLing> queryKaPianShenLingList(@Param("sfzh") String sfzh, int i, int rows, String sort, String order);

	public KaPianShenLing selectKaPianShenLingById(String id);

	public int newKaPianWeiHu(KaPianWeiHu kpwh);

	public int deleteKaPianWeiHu(List<String> idList);

	public int editKaPianWeiHu(KaPianWeiHu kpwh);

	public int queryKaPianWeiHuForInt(@Param("kh") String kh);

	public List<KaPianWeiHu> queryKaPianWeiHuList(@Param("kh") String kh, int i, int rows, String sort, String order);

	public KaPianWeiHu selectKaPianWeiHuById(String id);

	public int newDuiLie(DuiLie dl);

	public int editDuiLie(DuiLie dl);

	public int queryDuiLieForInt(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt);

	public List<DuiLie> queryDuiLieList(@Param("mc") String mc, @Param("dm") String dm, @Param("zt") Integer zt, int i, int rows, String sort, String order);

	public DuiLie selectDuiLieById(@Param("id") String id);

	public int queryYongHuForInt(@Param("yhm") String yhm, @Param("zt") Integer zt);

	public List<YongHu> queryYongHuList(@Param("yhm") String yhm, @Param("zt") Integer zt, int i, int rows, String sort, String order);

	public YongHu selectYongHuById(@Param("id") String id);

	public int queryHaoMaForInt(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId);

	public List<HaoMa> queryHaoMaList(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId, int i, int rows, String sort, String order);

	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList();

	public List<JueSe> queryJueSeByIds(@Param("ids") String ids);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(@Param("ids") String ids);

	public List<DingDanYiChang> selectDingDanYiChangByDdbm(@Param("ddbm") String ddbm);

	public GuoBang selectGuoBangById(@Param("id") String id);

	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(@Param("glddBm") String glddBm);
}
