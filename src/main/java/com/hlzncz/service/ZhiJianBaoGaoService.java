package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface ZhiJianBaoGaoService {

	public int editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg);

	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(String glddBm);

	public ZhiJianBaoGao selectZhiJianBaoGaoById(String id);

	public int updateZhiJianBaoGaoJLByGlddBms(Integer jl, String glddBms);

	public int queryZJZXHZJGLZJBGForInt(String jl, String ddh, String ddztId, String cph);

	public List<DingDan> queryZJZXHZJGLZJBGList(String jl, String ddh, String ddztId, String cph, int page, int rows,
			String sort, String order);
}
