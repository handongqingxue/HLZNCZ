package com.hlzncz.entity;

import java.io.Serializable;

public class GuoBang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final Integer RU_CHANG_BIAO_QIAN=1;//�볧��ǩ
	public static final Integer PI_ZHONG_BIAO_QIAN=3;//Ƥ�ر�ǩ
	public static final Integer ZAI_ZHONG_BIAO_QIAN=4;//���ر�ǩ
	private Integer id;//����
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGbclId() {
		return gbclId;
	}
	public void setGbclId(Integer gbclId) {
		this.gbclId = gbclId;
	}
	public String getCph() {
		return cph;
	}
	public void setCph(String cph) {
		this.cph = cph;
	}
	public Float getGbzl() {
		return gbzl;
	}
	public void setGbzl(Float gbzl) {
		this.gbzl = gbzl;
	}
	public String getGbbq() {
		return gbbq;
	}
	public void setGbbq(String gbbq) {
		this.gbbq = gbbq;
	}
	public Integer getGbzt() {
		return gbzt;
	}
	public void setGbzt(Integer gbzt) {
		this.gbzt = gbzt;
	}
	public String getGbsj() {
		return gbsj;
	}
	public void setGbsj(String gbsj) {
		this.gbsj = gbsj;
	}
	public String getZp1() {
		return zp1;
	}
	public void setZp1(String zp1) {
		this.zp1 = zp1;
	}
	public String getZp2() {
		return zp2;
	}
	public void setZp2(String zp2) {
		this.zp2 = zp2;
	}
	public String getZp3() {
		return zp3;
	}
	public void setZp3(String zp3) {
		this.zp3 = zp3;
	}
	public String getPzddbm() {
		return pzddbm;
	}
	public void setPzddbm(String pzddbm) {
		this.pzddbm = pzddbm;
	}
	public String getMzddbm() {
		return mzddbm;
	}
	public void setMzddbm(String mzddbm) {
		this.mzddbm = mzddbm;
	}
	private Integer gbclId;//��������id
	private String cph;//���ƺ�
	private Float gbzl;//��������
	private String gbbq;//������ǩ 1.�볧 2.���� 3.Ƥ�� 4.����
	private Integer gbzt;//����״̬ 1.���� 2.�쳣
	private String gbsj;//����ʱ��
	private String zp1;//��Ƭ1
	private String zp2;//��Ƭ2
	private String zp3;//��Ƭ3
	private String pzddbm;//Ƥ�ض�������
	private String mzddbm;//ë�ض�������

}
