package com.hlzncz.entity;

import java.io.Serializable;

public class GuoBang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final Integer RU_CHANG_BIAO_QIAN=1;//入厂标签
	public static final Integer PI_ZHONG_BIAO_QIAN=3;//皮重标签
	public static final Integer ZAI_ZHONG_BIAO_QIAN=4;//载重标签
	private Integer id;//主键
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
	private Integer gbclId;//过磅车辆id
	private String cph;//车牌号
	private Float gbzl;//过磅重量
	private String gbbq;//过磅标签 1.入厂 2.出厂 3.皮重 4.载重
	private Integer gbzt;//过磅状态 1.正常 2.异常
	private String gbsj;//过磅时间
	private String zp1;//照片1
	private String zp2;//照片2
	private String zp3;//照片3
	private String pzddbm;//皮重订单编码
	private String mzddbm;//毛重订单编码

}
