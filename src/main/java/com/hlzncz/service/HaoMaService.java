package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface HaoMaService {


	public int queryHaoMaForInt(String hm, String pdh, Integer ztId);

	public List<HaoMa> queryHaoMaList(String hm, String pdh, Integer ztId, int page, int rows, String sort,
			String order);

	public int newHaoMaChaXun(HaoMa hm);

	public HaoMa selectHaoMaById(String id);
}
