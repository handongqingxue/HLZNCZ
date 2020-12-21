package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface YongHuService {

	public int newYongHu(YongHu yh);

	public int deleteYongHu(String ids);

	public int editYongHu(YongHu yh);

	public int queryYongHuForInt(String yhm, Integer zt);

	public List<YongHu> queryYongHuList(String yhm, Integer zt, int page, int rows, String sort, String order);

	public YongHu selectYongHuById(String id);

	public YongHu selectSiJiYongHuById(String id);
}
