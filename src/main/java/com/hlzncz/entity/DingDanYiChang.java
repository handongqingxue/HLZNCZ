package com.hlzncz.entity;

import java.io.Serializable;

public class DingDanYiChang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * ������
	 */
	public static final int DAI_CHU_LI=1;
	/**
	 * ������
	 */
	public static final int CHU_LI_ZHONG=2;
	/**
	 * �������
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
	private String ddbm;//��������
	private Integer yclx;//�쳣���� 1.���쳣 2.�����쳣 3.�����쳣
	private Integer clzt;//����״̬ 1.������  2.������ 3.�������
	private String ms;//����
	private String clsm;//����˵��

}
