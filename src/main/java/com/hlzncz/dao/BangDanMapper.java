package com.hlzncz.dao;

import com.hlzncz.entity.BangDan;

public interface BangDanMapper {

	BangDan selectBangDanByDdbm(String wybm);

	int editErBangWaiJian(BangDan bd);

	int newErBangWaiJian(BangDan bd);

}
