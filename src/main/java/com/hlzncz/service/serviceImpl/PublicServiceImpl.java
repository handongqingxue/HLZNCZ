package com.hlzncz.service.serviceImpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.*;
import com.hlzncz.service.PublicService;

@Service
public class PublicServiceImpl implements PublicService {
	
	@Autowired
	private PublicMapper publicDao;
	
	public void selectNav(HttpServletRequest request) {
		
		List<CaiDan> leftNavList = publicDao.selectParCaiDan();
		request.setAttribute("leftNavList", leftNavList);

		String fnid = request.getParameter("fnid");
		Integer parId = null;
		if(StringUtils.isEmpty(fnid)) {
			parId = leftNavList.get(0).getId();
		}
		else {
			parId=Integer.parseInt(fnid);
		}
		List<CaiDan> topNavList = publicDao.selectChildCaiDan(parId);
		for (CaiDan caiDan : topNavList) {
			List<CaiDan> childList = publicDao.selectChildCaiDan(caiDan.getId());
			caiDan.setChildList(childList);
		}
		request.setAttribute("topNavList", topNavList);
	}

	@Override
	public int newDingDanZongHeGuanLi(DingDan dd) {
		// TODO Auto-generated method stub
		String wybm = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
        	wybm += String.valueOf(random.nextInt(10));
        }
        dd.setWybm(wybm);
        dd.setDdh("DD"+wybm);
		return publicDao.newWoYaoXiaDan(dd);
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
	public int editDingDan(DingDan dd) {
		// TODO Auto-generated method stub
		return publicDao.editDingDan(dd);
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
	public int updateZhiJianBaoGaoJLByGlddBms(Integer jl, String glddBms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> newGlddBmList = Arrays.asList(glddBms.split(","));
		List<String> updateGlddBmList=new ArrayList<String>();
		/*
		//这种利用游标遍历的方法暂时不用
		Iterator<String> glddBmIt = glddBmList.iterator();
		while (glddBmIt.hasNext()) {
			String glddBm = glddBmIt.next();
			if(publicDao.selectZhiJianBaoGaoByGlddBm(glddBm)==null) {
				ZhiJianBaoGao zjbg=new ZhiJianBaoGao();
				zjbg.setJl(jl);
				zjbg.setGlddBm(glddBm);
				count+=publicDao.newZhiJianBaoGao(zjbg);
			}
			else {
				//flag=publicDao.editZhiJianBaoGao(zjbg);
				glddBmIt.remove();
			}
		}
		*/
		for (String glddBm : newGlddBmList) {
			if(publicDao.selectZhiJianBaoGaoByGlddBm(glddBm)==null) {
				ZhiJianBaoGao zjbg=new ZhiJianBaoGao();
				zjbg.setJl(jl);
				zjbg.setGlddBm(glddBm);
				count+=publicDao.newZhiJianBaoGao(zjbg);
			}
			else {
				updateGlddBmList.add(glddBm);
			}
		}
		
		count+=publicDao.updateZhiJianBaoGaoJLByGlddBms(jl,updateGlddBmList);
		
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
	public int tiJiaoGuoBang(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=publicDao.tiJiaoGuoBang(wybmList);
		return count;
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
	public int updateDingDanZT(Integer ddztId, String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=publicDao.updateDingDanZT(ddztId,wybmList);
		return count;
	}

	@Override
	public int editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		int flag=publicDao.editDingDan(dd);
		if(publicDao.selectZhiJianBaoGaoByGlddBm(dd.getWybm())==null) {
			flag=publicDao.newZhiJianBaoGao(zjbg);
		}
		else {
			flag=publicDao.editZhiJianBaoGao(zjbg);
		}
		return flag;
	}

	@Override
	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		return publicDao.newZhiJianBaoGao(zjbg);
	}

	@Override
	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg) {
		// TODO Auto-generated method stub
		return publicDao.editZhiJianBaoGao(zjbg);
	}

	@Override
	public int queryZJZXHZJGLZJBGForInt(String jl, String ddh, String ddztId, String cph) {
		// TODO Auto-generated method stub
		return publicDao.queryZJZXHZJGLZJBGForInt(jl, ddh, ddztId, cph);
	}

	@Override
	public List<DingDan> queryZJZXHZJGLZJBGList(String jl, String ddh, String ddztId, String cph, int page, int rows,
			String sort, String order) {
		// TODO Auto-generated method stub
		return publicDao.queryZJZXHZJGLZJBGList(jl, ddh, ddztId, cph, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int newGuoBang(GuoBang gb) {
		// TODO Auto-generated method stub
		return publicDao.newGuoBang(gb);
	}

	@Override
	public int deleteGuoBang(String ids) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> idList = Arrays.asList(ids.split(","));
		count=publicDao.deleteGuoBang(idList);
		return count;
	}

	@Override
	public int queryGBGLGBGLZHCXForInt(String cph, String gbbq, String gbsjs, String gbsje) {
		// TODO Auto-generated method stub
		return publicDao.queryGBGLGBGLZHCXForInt(cph,gbbq,gbsjs,gbsje);
	}

	@Override
	public List<DingDan> queryGBGLGBGLZHCXList(String cph, String gbbq, String gbsjs, String gbsje, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return publicDao.queryGBGLGBGLZHCXList(cph, gbbq, gbsjs, gbsje, (page-1)*rows, rows, sort, order);
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
	public int editGuoBang(GuoBang gb) {
		// TODO Auto-generated method stub
		return publicDao.editGuoBang(gb);
	}

	@Override
	public int newYongHu(YongHu yh) {
		// TODO Auto-generated method stub
		return publicDao.newYongHu(yh);
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
	public YongHu selectYongHuById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectYongHuById(id);
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

	@Override
	public GuoBang selectGuoBangById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectGuoBangById(id);
	}

	@Override
	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(String glddBm) {
		// TODO Auto-generated method stub
		return publicDao.selectZhiJianBaoGaoByGlddBm(glddBm);
	}

	@Override
	public ZhiJianBaoGao selectZhiJianBaoGaoById(String id) {
		// TODO Auto-generated method stub
		return publicDao.selectZhiJianBaoGaoById(id);
	}
}
