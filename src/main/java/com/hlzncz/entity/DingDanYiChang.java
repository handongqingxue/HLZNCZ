package com.hlzncz.entity;

import java.io.Serializable;

public class DingDanYiChang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 待处理
	 */
	public static final int DAI_CHU_LI=1;
	/**
	 * 处理中
	 */
	public static final int CHU_LI_ZHONG=2;
	/**
	 * 处理完成
	 */
	public static final int CHU_LI_WAN_CHENG=3;
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDdbm() {
		return ddbm;
	}
	public void setDdbm(String ddbm) {
		this.ddbm = ddbm;
	}
	public Integer getYclx() {
		return yclx;
	}
	public void setYclx(Integer yclx) {
		this.yclx = yclx;
	}
	public Integer getClzt() {
		return clzt;
	}
	public void setClzt(Integer clzt) {
		this.clzt = clzt;
	}
	public String getMs() {
		return ms;
	}
	public void setMs(String ms) {
		this.ms = ms;
	}
	public String getClsm() {
		return clsm;
	}
	public void setClsm(String clsm) {
		this.clsm = clsm;
	}
	private String ddbm;//订单编码
	private Integer yclx;//异常类型 1.无异常 2.净重异常 3.其他异常
	private Integer clzt;//处理状态 1.待处理  2.处理中 3.处理完成
	private String ms;//描述
	private String clsm;//处理说明

}
