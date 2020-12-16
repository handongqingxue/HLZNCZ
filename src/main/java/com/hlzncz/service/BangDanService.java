package com.hlzncz.service;

import com.hlzncz.entity.BangDan;

public interface BangDanService {

	BangDan selectBangDanByDdbm(String wybm);

	int editErBangWaiJian(BangDan bd);

	int newErBangWaiJian(BangDan bd);

}
