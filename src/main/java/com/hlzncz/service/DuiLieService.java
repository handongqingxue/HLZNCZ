package com.hlzncz.service;

import java.util.List;

import com.hlzncz.entity.*;

public interface DuiLieService {


	public int newDuiLie(DuiLie dl);

	public int deleteDuiLie(String ids);

	public int editDuiLie(DuiLie dl);

	public int queryDuiLieForInt(String mc, String dm, Integer zt);

	public List<DuiLie> queryDuiLieList(String mc, String dm, Integer zt, int page, int rows, String sort,
			String order);

	public DuiLie selectDuiLieById(String id);
}
