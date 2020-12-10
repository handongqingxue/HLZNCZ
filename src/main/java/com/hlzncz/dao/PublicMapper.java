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

	public int editGuoBang(GuoBang gb);

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

	public int queryHaoMaForInt(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId);

	public List<HaoMa> queryHaoMaList(@Param("hm") String hm, @Param("pdh") String pdh, @Param("ztId") Integer ztId, int i, int rows, String sort, String order);

	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList();

	public List<JueSe> queryJueSeByIds(@Param("ids") String ids);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(@Param("ids") String ids);

	public GuoBang selectGuoBangById(@Param("id") String id);
}
