package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.*;
import com.hlzncz.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PublicMapper publicDao;

	public List<CaiDan> selectParCaiDan() {
		// TODO Auto-generated method stub
		return publicDao.selectParCaiDan();
	}

	public List<CaiDan> selectChildCaiDan(Integer parId) {
		// TODO Auto-generated method stub
		return publicDao.selectChildCaiDan(parId);
	}

	@Override
	public int newWoYaoXiaDan(DingDan dd) {
		// TODO Auto-generated method stub
		String wybm = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
        	wybm += String.valueOf(random.nextInt(10));
        }
        dd.setWybm(wybm);
        dd.setDdh("DD"+wybm);
        dd.setDdztId(DingDan.DAI_SHEN_HE);
		return publicDao.newWoYaoXiaDan(dd);
	}

	@Override
	public int deleteDingDan(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=publicDao.deleteDingDan(wybmList);
		return count;
	}

	@Override
	public int editWoYaoXiaDan(DingDan dd) {
		// TODO Auto-generated method stub
		return publicDao.editWoYaoXiaDan(dd);
	}

	@Override
	public int queryWoYaoXiaDanForInt(String ddh, Integer ddztId) {
		// TODO Auto-generated method stub
		return publicDao.queryWoYaoXiaDanForInt(ddh,ddztId);
	}

	@Override
	public List<DingDan> queryWoYaoXiaDanList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryWoYaoXiaDanList(ddh, ddztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int tongGuoDingDanShenHe(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=publicDao.tongGuoDingDanShenHe(DingDan.YI_XIA_DAN,wybmList);
		return count;
	}

	@Override
	public int tuiHuiDingDanShenHe(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=publicDao.tuiHuiDingDanShenHe(DingDan.BIAN_JI_ZHONG,wybmList);
		return count;
	}

	@Override
	public int queryDingDanShenHeForInt(String ddh, Integer ddztId) {
		// TODO Auto-generated method stub
		return publicDao.queryDingDanShenHeForInt(ddh,ddztId);
	}

	@Override
	public List<DingDan> queryDingDanShenHeList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryDingDanShenHeList(ddh, ddztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int queryDDGLZHGLForInt(String ddh, String ddztId, String cph, String jcsjs, String jcsje, String jhysrq,
			String yss) {
		// TODO Auto-generated method stub
		return publicDao.queryDDGLZHGLForInt(ddh, ddztId, cph, jcsjs, jcsje, jhysrq, yss);
	}

	@Override
	public List<DingDan> queryDDGLZHGLList(String ddh, String ddztId, String cph, String jcsjs, String jcsje,
			String jhysrq, String yss, String clzt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryDDGLZHGLList(ddh, ddztId, cph, jcsjs, jcsje, jhysrq, yss, clzt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int queryDDGLZHGLYCCLForInt(String ddh, String ddztId, String cph, String jhysrq, String clzt) {
		// TODO Auto-generated method stub
		List<DingDan> ycclList=publicDao.queryDDGLZHGLYCCLNotLimitList(ddh, ddztId, cph, jhysrq, clzt);
		return ycclList.size();
	}

	@Override
	public List<DingDan> queryDDGLZHGLYCCLList(String ddh, String ddztId, String cph, 
			String jhysrq, String clzt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryDDGLZHGLYCCLList(ddh, ddztId, cph, jhysrq, clzt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public DingDan selectDingDanByWybm(String wybm) {
		// TODO Auto-generated method stub
		return publicDao.selectDingDanByWybm(wybm);
	}

	@Override
	public List<DingDanZhuangTai> queryDingDanZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return publicDao.queryDingDanZhuangTaiCBBList();
	}

	@Override
	public int newWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.newWuZiLeiXing(wzlx);
	}

	@Override
	public int deleteWuZiLeiXing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteWuZiLeiXing(idList);
		return count;
	}

	@Override
	public int editWuZiLeiXing(WuZiLeiXing wzlx) {
		// TODO Auto-generated method stub
		return publicDao.editWuZiLeiXing(wzlx);
	}

	@Override
	public int queryWuZiLeiXingForInt(String mc) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiLeiXingForInt(mc);
	}

	@Override
	public List<WuZiLeiXing> queryWuZiLeiXingList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiLeiXingList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZiLeiXing selectWuZiLeiXingById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectWuZiLeiXingById(id);
	}

	@Override
	public int newWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return publicDao.newWuZi(wz);
	}

	@Override
	public int deleteWuZi(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteWuZi(idList);
		return count;
	}

	@Override
	public int editWuZi(WuZi wz) {
		// TODO Auto-generated method stub
		return publicDao.editWuZi(wz);
	}

	@Override
	public int queryWuZiForInt(String mc, String wzlxmc) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiForInt(mc,wzlxmc);
	}

	@Override
	public List<WuZi> queryWuZiList(String mc, String wzlxmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryWuZiList(mc, wzlxmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public WuZi selectWuZiById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectWuZiById(id);
	}

	@Override
	public int newCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return publicDao.newCheLiang(cl);
	}

	@Override
	public int deleteCheLiang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteCheLiang(idList);
		return count;
	}

	@Override
	public int shenHeCheLiang(String ids,String flag) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.shenHeCheLiang(idList,flag);
		return count;
	}

	@Override
	public int editCheLiang(CheLiang cl) {
		// TODO Auto-generated method stub
		return publicDao.editCheLiang(cl);
	}

	@Override
	public int queryCheLiangForInt(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz) {
		// TODO Auto-generated method stub
		return publicDao.queryCheLiangForInt(cph,cllx,sfzy,pfjd,shzt,bz);
	}

	@Override
	public List<CheLiang> queryCheLiangList(String cph, Integer cllx, Boolean sfzy, Integer pfjd, String shzt, String bz, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryCheLiangList(cph, cllx, sfzy, pfjd, shzt, bz, (page-1)*rows, rows, sort, order);
	}

	@Override
	public CheLiang selectCheLiangById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectCheLiangById(id);
	}

	@Override
	public int newSiJi(SiJi sj) {
		// TODO Auto-generated method stub
		return publicDao.newSiJi(sj);
	}

	@Override
	public int newYongHu(YongHu yh) {
		// TODO Auto-generated method stub
		return publicDao.newYongHu(yh);
	}

	@Override
	public int deleteSiJi(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteSiJi(idList);
		return count;
	}

	@Override
	public int deleteYongHu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteYongHu(idList);
		return count;
	}

	@Override
	public int shenHeSiJi(String ids, String flag) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.shenHeSiJi(idList,flag);
		return count;
	}

	@Override
	public int editSiJi(SiJi sj) {
		// TODO Auto-generated method stub
		return publicDao.editSiJi(sj);
	}

	@Override
	public int querySiJiForInt(String xm, String sfz, Integer zyzt,String shzt) {
		// TODO Auto-generated method stub
		return publicDao.querySiJiForInt(xm,sfz,zyzt,shzt);
	}

	@Override
	public List<SiJi> querySiJiList(String xm, String sfz, Integer zyzt, String shzt, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.querySiJiList(xm, sfz, zyzt, shzt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public SiJi selectSiJiById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectSiJiById(id);
	}

	@Override
	public int newFaHuoDanWei(FaHuoDanWei fhdw) {
		// TODO Auto-generated method stub
		return publicDao.newFaHuoDanWei(fhdw);
	}

	@Override
	public int deleteFaHuoDanWei(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteFaHuoDanWei(idList);
		return count;
	}

	@Override
	public int editFaHuoDanWei(FaHuoDanWei fhdw) {
		// TODO Auto-generated method stub
		return publicDao.editFaHuoDanWei(fhdw);
	}

	@Override
	public int queryFaHuoDanWeiForInt(String dwmc) {
		// TODO Auto-generated method stub
		return publicDao.queryFaHuoDanWeiForInt(dwmc);
	}

	@Override
	public List<FaHuoDanWei> queryFaHuoDanWeiList(String dwmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryFaHuoDanWeiList(dwmc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public FaHuoDanWei selectFaHuoDanWeiById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectFaHuoDanWeiById(id);
	}

	@Override
	public int newShouHuoDanWei(ShouHuoDanWei shdw) {
		// TODO Auto-generated method stub
		return publicDao.newShouHuoDanWei(shdw);
	}

	@Override
	public int deleteShouHuoDanWei(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteShouHuoDanWei(idList);
		return count;
	}

	@Override
	public int queryShouHuoDanWeiForInt(String dwmc,Boolean ywdl) {
		// TODO Auto-generated method stub
		return publicDao.queryShouHuoDanWeiForInt(dwmc,ywdl);
	}

	@Override
	public List<ShouHuoDanWei> queryShouHuoDanWeiList(String dwmc, Boolean ywdl, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryShouHuoDanWeiList(dwmc, ywdl, (page-1)*rows, rows, sort, order);
	}

	@Override
	public ShouHuoDanWei selectShouHuoDanWeiById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectShouHuoDanWeiById(id);
	}

	@Override
	public int newYunShuShang(YunShuShang yss) {
		// TODO Auto-generated method stub
		return publicDao.newYunShuShang(yss);
	}

	@Override
	public int deleteYuShuShang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteYuShuShang(idList);
		return count;
	}

	@Override
	public int editYunShuShang(YunShuShang yss) {
		// TODO Auto-generated method stub
		return publicDao.editYunShuShang(yss);
	}

	@Override
	public int queryYunShuShangForInt(String mc) {
		// TODO Auto-generated method stub
		return publicDao.queryYunShuShangForInt(mc);
	}

	@Override
	public List<YunShuShang> queryYunShuShangList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryYunShuShangList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public YunShuShang selectYunShuShangById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectYunShuShangById(id);
	}

	@Override
	public int newCangKu(CangKu ck) {
		// TODO Auto-generated method stub
		return publicDao.newCangKu(ck);
	}

	@Override
	public int deleteCangKu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteCangKu(idList);
		return count;
	}

	@Override
	public int editCangKu(CangKu ck) {
		// TODO Auto-generated method stub
		return publicDao.editCangKu(ck);
	}

	@Override
	public int queryCangKuForInt(String mc) {
		// TODO Auto-generated method stub
		return publicDao.queryCangKuForInt(mc);
	}

	@Override
	public List<CangKu> queryCangKuList(String mc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryCangKuList(mc, (page-1)*rows, rows, sort, order);
	}

	@Override
	public CangKu selectCangKuById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectCangKuById(id);
	}

	@Override
	public int newKaPianShenLing(KaPianShenLing kpsl) {
		// TODO Auto-generated method stub
		return publicDao.newKaPianShenLing(kpsl);
	}

	@Override
	public int deleteKaPianShenLing(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteKaPianShenLing(idList);
		return count;
	}

	@Override
	public int editKaPianShenLing(KaPianShenLing kpsl) {
		// TODO Auto-generated method stub
		return publicDao.editKaPianShenLing(kpsl);
	}

	@Override
	public int queryKaPianShenLingForInt(String sfzh) {
		// TODO Auto-generated method stub
		return publicDao.queryKaPianShenLingForInt(sfzh);
	}

	@Override
	public List<KaPianShenLing> queryKaPianShenLingList(String sfzh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryKaPianShenLingList(sfzh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public KaPianShenLing selectKaPianShenLingById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectKaPianShenLingById(id);
	}

	@Override
	public int newKaPianWeiHu(KaPianWeiHu kpwh) {
		// TODO Auto-generated method stub
		return publicDao.newKaPianWeiHu(kpwh);
	}

	@Override
	public int deleteKaPianWeiHu(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count = publicDao.deleteKaPianWeiHu(idList);
		return count;
	}

	@Override
	public int editKaPianWeiHu(KaPianWeiHu kpwh) {
		// TODO Auto-generated method stub
		return publicDao.editKaPianWeiHu(kpwh);
	}

	@Override
	public int queryKaPianWeiHuForInt(String kh) {
		// TODO Auto-generated method stub
		return publicDao.queryKaPianWeiHuForInt(kh);
	}

	@Override
	public List<KaPianWeiHu> queryKaPianWeiHuList(String kh, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryKaPianWeiHuList(kh, (page-1)*rows, rows, sort, order);
	}

	@Override
	public KaPianWeiHu selectKaPianWeiHuById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectKaPianWeiHuById(id);
	}

	@Override
	public int newDuiLie(DuiLie dl) {
		// TODO Auto-generated method stub
		return publicDao.newDuiLie(dl);
	}

	@Override
	public int editDuiLie(DuiLie dl) {
		// TODO Auto-generated method stub
		return publicDao.editDuiLie(dl);
	}

	@Override
	public int queryDuiLieForInt(String mc, String dm, Integer zt) {
		// TODO Auto-generated method stub
		return publicDao.queryDuiLieForInt(mc,dm,zt);
	}

	@Override
	public List<DuiLie> queryDuiLieList(String mc, String dm, Integer zt, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryDuiLieList(mc, dm, zt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public DuiLie selectDuiLieById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectDuiLieById(id);
	}

	@Override
	public int queryYongHuForInt(String yhm, Integer zt) {
		// TODO Auto-generated method stub
		return publicDao.queryYongHuForInt(yhm,zt);
	}

	@Override
	public List<YongHu> queryYongHuList(String yhm, Integer zt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryYongHuList(yhm, zt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int queryHaoMaForInt(String hm, String pdh, Integer ztId) {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaForInt(hm,pdh,ztId);
	}

	@Override
	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaList(hm, pdh, ztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public List<HaoMaZhuangTai> queryHaoMaZhuangTaiCBBList() {
		// TODO Auto-generated method stub
		return publicDao.queryHaoMaZhuangTaiCBBList();
	}

	@Override
	public List<JueSe> queryJueSeByIds(String ids) {
		// TODO Auto-generated method stub
		return publicDao.queryJueSeByIds(ids);
	}

	@Override
	public List<ShouHuoDanWei> queryShouHuoDanWeiByIds(String ids) {
		// TODO Auto-generated method stub
		return publicDao.queryShouHuoDanWeiByIds(ids);
	}

	@Override
	public List<DingDanYiChang> selectDingDanYiChangByDdbm(String wybm) {
		// TODO Auto-generated method stub
		return publicDao.selectDingDanYiChangByDdbm(wybm);
	}

}
