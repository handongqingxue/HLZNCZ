package com.hlzncz.entity;

import java.io.Serializable;

public class BangDan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getBs() {
		return bs;
	}
	public void setBs(Integer bs) {
		this.bs = bs;
	}
	public Integer getKs() {
		return ks;
	}
	public void setKs(Integer ks) {
		this.ks = ks;
	}
	public Float getJszl() {
		return jszl;
	}
	public void setJszl(Float jszl) {
		this.jszl = jszl;
	}
	public Float getDfgbjz() {
		return dfgbjz;
	}
	public void setDfgbjz(Float dfgbjz) {
		this.dfgbjz = dfgbjz;
	}
	public Float getDfgbpz() {
		return dfgbpz;
	}
	public void setDfgbpz(Float dfgbpz) {
		this.dfgbpz = dfgbpz;
	}
	public Float getDfgbmz() {
		return dfgbmz;
	}
	public void setDfgbmz(Float dfgbmz) {
		this.dfgbmz = dfgbmz;
	}
	public String getDfbdzp() {
		return dfbdzp;
	}
	public void setDfbdzp(String dfbdzp) {
		this.dfbdzp = dfbdzp;
	}
	public String getDfgbsj() {
		return dfgbsj;
	}
	public void setDfgbsj(String dfgbsj) {
		this.dfgbsj = dfgbsj;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getDdbm() {
		return ddbm;
	}
	public void setDdbm(String ddbm) {
		this.ddbm = ddbm;
	}
	private Integer bs;//����
	private Integer ks;//����
	private Float jszl;//��������
	private Float dfgbjz;//�Է���������
	private Float dfgbpz;//�Է�����Ƥ��
	private Float dfgbmz;//�Է�����ë��
	private String dfbdzp;//�Է�����Ƭ
	private String dfgbsj;//�Է�����ʱ��
	private String bz;//��ע
	private String ddbm;//��������

}
