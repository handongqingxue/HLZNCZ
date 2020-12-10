package com.hlzncz.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hlzncz.entity.*;

public interface PublicService {

	public void selectNav(HttpServletRequest request);

	public int queryZJZXHZJGLZJBGForInt(String jl, String ddh, String ddztId, String cph);

	public List<DingDan> queryZJZXHZJGLZJBGList(String jl, String ddh, String ddztId, String cph, int page, int rows,
			String sort, String order);

	public int newGuoBang(GuoBang gb);

	public int deleteGuoBang(String ids);

	public int queryGBGLGBGLZHCXForInt(String cph, String gbbq, String gbsjs, String gbsje);

	public List<DingDan> queryGBGLGBGLZHCXList(String cph, String gbbq, String gbsjs, String gbsje, int page, int rows, String sort,
			String order);

	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList();

	public int newWuZiLeiXing(WuZiLeiXing wzlx);

	public int deleteWuZiLeiXing(String ids);

	public int editWuZiLeiXing(WuZiLeiXing wzlx);

	public int queryWuZiLeiXingForInt(String mc);

	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order);

	public WuZiLeiXing selectWuZiLeiXingById(String id);

	public int editGuoBang(GuoBang gb);

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

	public int editDuiLie(DuiLie dl);

	public int queryDuiLieForInt(String mc, String dm, Integer zt);

	public List<DuiLie> queryDuiLieList(String mc, String dm, Integer zt, int page, int rows, String sort,
			String order);

	public DuiLie selectDuiLieById(String id);

	public int queryHaoMaForInt(String hm, String pdh, Integer ztId);

	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order);

	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList();

	public List<JueSe> queryJueSeByIds(String ids);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids);

	public GuoBang selectGuoBangById(String id);
}
