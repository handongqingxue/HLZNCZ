package com.hlzncz.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hlzncz.entity.*;

public interface PublicService {

	public void selectNav(HttpServletRequest request);

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

	public int updateDingDanZT(Integer ddztId, String wybms);

	public int editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg);

	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public int queryZJZXHZJGLZJBGForInt(String jl, String ddh, String ddztId, String cph);

	public List<DingDan> queryZJZXHZJGLZJBGList(String jl, String ddh, String ddztId, String cph, int page, int rows,
			String sort, String order);

	public ZhiJianBaoGao selectZhiJianBaoGaoById(String id);

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

	public int newYongHu(YongHu yh);

	public int deleteYongHu(String ids);

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

	public int queryYongHuForInt(String yhm, Integer zt);

	public List<YongHu> queryYongHuList(String yhm, Integer zt, int page, int rows, String sort, String order);

	public YongHu selectYongHuById(String id);

	public int queryHaoMaForInt(String hm, String pdh, Integer ztId);

	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order);

	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList();

	public List<JueSe> queryJueSeByIds(String ids);

	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids);

	public List<DingDanYiChang> selectDingDanYiChangByDdbm(String wybm);

	public GuoBang selectGuoBangById(String id);

	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(String glddBm);

	public int updateZhiJianBaoGaoJLByGlddBms(Integer jl, String glddBms);
}
