package com.hlzncz.service.serviceImpl;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hlzncz.dao.DingDanMapper;
import com.hlzncz.dao.PublicMapper;
import com.hlzncz.entity.DingDan;
import com.hlzncz.service.DingDanService;

@Service
public class DingDanServiceImpl implements DingDanService {


	@Autowired
	private DingDanMapper dingDanDao;

	@Override
	public int newDingDanZongHeGuanLi(DingDan dd) {
		// TODO Auto-generated method stub
		String wybm = DingDan.createWybm();
        dd.setWybm(wybm);
        dd.setDdh("DD"+wybm);
		return dingDanDao.newWoYaoXiaDan(dd);
	}

	@Override
	public int newWoYaoXiaDan(DingDan dd) {
		// TODO Auto-generated method stub
		String wybm = DingDan.createWybm();
        dd.setWybm(wybm);
        dd.setDdh("DD"+wybm);
        dd.setDdztId(DingDan.DAI_SHEN_HE);
		return dingDanDao.newWoYaoXiaDan(dd);
	}

	@Override
	public int deleteDingDan(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=dingDanDao.deleteDingDan(wybmList);
		return count;
	}

	@Override
	public int editDingDan(DingDan dd) {
		// TODO Auto-generated method stub
		return dingDanDao.editDingDan(dd);
	}

	@Override
	public int queryWoYaoXiaDanForInt(String ddh, Integer ddztId) {
		// TODO Auto-generated method stub
		return dingDanDao.queryWoYaoXiaDanForInt(ddh,ddztId);
	}

	@Override
	public List<DingDan> queryWoYaoXiaDanList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryWoYaoXiaDanList(ddh, ddztId, (page-1)*rows, rows, sort, order);
	}
	
	@Override
	public int queryDingDanShenHeForInt(String ddh, Integer ddztId) {
		// TODO Auto-generated method stub
		return dingDanDao.queryDingDanShenHeForInt(ddh,ddztId);
	}

	@Override
	public List<DingDan> queryDingDanShenHeList(String ddh, Integer ddztId, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryDingDanShenHeList(ddh, ddztId, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int queryDDGLZHGLForInt(String ddh, String ddztId, String cph, String jcsjs, String jcsje, String jhysrq,
			String yss,String wzmc,String fhdwmc,String shdwmc,String sjxm,String sjsfz) {
		// TODO Auto-generated method stub
		return dingDanDao.queryDDGLZHGLForInt(ddh, ddztId, cph, jcsjs, jcsje, jhysrq, yss,wzmc,fhdwmc,shdwmc,sjxm,sjsfz);
	}

	@Override
	public List<DingDan> queryDDGLZHGLList(String ddh, String ddztId, String cph, String jcsjs, String jcsje,
			String jhysrq, String yss,String wzmc,String fhdwmc,String shdwmc,String sjxm,String sjsfz, String clzt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryDDGLZHGLList(ddh, ddztId, cph, jcsjs, jcsje, jhysrq, yss, wzmc, fhdwmc, shdwmc, sjxm, sjsfz, clzt, (page-1)*rows, rows, sort, order);
	}

	@Override
	public int tiJiaoGuoBang(String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=dingDanDao.tiJiaoGuoBang(wybmList);
		return count;
	}

	@Override
	public int queryDDGLZHGLYCCLForInt(String ddh, String ddztId, String cph, String jhysrq, String clzt) {
		// TODO Auto-generated method stub
		List<DingDan> ycclList=dingDanDao.queryDDGLZHGLYCCLNotLimitList(ddh, ddztId, cph, jhysrq, clzt);
		return ycclList.size();
	}

	@Override
	public List<DingDan> queryDDGLZHGLYCCLList(String ddh, String ddztId, String cph, 
			String jhysrq, String clzt, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryDDGLZHGLYCCLList(ddh, ddztId, cph, jhysrq, clzt, (page-1)*rows, rows, sort, order);
	}
	
	@Override
	public DingDan selectDingDanByWybm(String wybm) {
		// TODO Auto-generated method stub
		return dingDanDao.selectDingDanByWybm(wybm);
	}

	@Override
	public int updateDingDanZT(Integer ddztId, String wybms) {
		// TODO Auto-generated method stub
		int count=0;
		List<String> wybmList = Arrays.asList(wybms.split(","));
		count=dingDanDao.updateDingDanZT(ddztId,wybmList);
		return count;
	}

	@Override
	public int queryBqglWgjcYbwjForInt(String ddh, String ddztId, String cph, String jhysrq, String wlmc, String fhdwmc,
			String shdwmc) {
		// TODO Auto-generated method stub
		return dingDanDao.queryBqglWgjcYbwjForInt(ddh, ddztId, cph, jhysrq, wlmc, fhdwmc, shdwmc);
	}

	@Override
	public List<DingDan> queryBqglWgjcYbwjList(String ddh, String ddztId, String cph, String jhysrq, String wlmc, String fhdwmc,
			String shdwmc, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryBqglWgjcYbwjList(ddh, ddztId, cph, jhysrq, wlmc, fhdwmc,shdwmc,(page-1)*rows, rows, sort, order);
	}

	@Override
	public int queryBqglWgjcEbwjForInt(String ddh, String ddztId, String cph) {
		// TODO Auto-generated method stub
		return dingDanDao.queryBqglWgjcEbwjForInt(ddh, ddztId, cph);
	}

	@Override
	public List<DingDan> queryBqglWgjcEbwjList(String ddh, String ddztId, String cph, int page, int rows, String sort,
			String order) {
		// TODO Auto-generated method stub
		return dingDanDao.queryBqglWgjcEbwjList(ddh, ddztId, cph,(page-1)*rows, rows, sort, order);
	}

}
