package com.hlzncz.service;

import com.hlzncz.entity.*;

public interface ZhiJianBaoGaoService {

	public int editDaiZhiJian(DingDan dd, ZhiJianBaoGao zjbg);

	public int newZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public int editZhiJianBaoGao(ZhiJianBaoGao zjbg);

	public ZhiJianBaoGao selectZhiJianBaoGaoByGlddBm(String glddBm);

	public ZhiJianBaoGao selectZhiJianBaoGaoById(String id);

	public int updateZhiJianBaoGaoJLByGlddBms(Integer jl, String glddBms);
}
