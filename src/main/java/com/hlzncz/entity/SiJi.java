package com.hlzncz.entity;

import java.io.Serializable;

public class SiJi implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 编辑中
	 */
	public static final Integer BIAN_JI_ZHONG=1;
	/**
	 * 待审核
	 */
	public static final Integer DAI_SHEN_HE=2;
	/**
	 * 审核通过
	 */
	public static final Integer SHEN_HE_TONG_GUO=3;
	private Integer id;//司机id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSjh() {
		return sjh;
	}
	public void setSjh(String sjh) {
		this.sjh = sjh;
	}
	public String getZp() {
		return zp;
	}
	public void setZp(String zp) {
		this.zp = zp;
	}
	public String getSfz() {
		return sfz;
	}
	public void setSfz(String sfz) {
		this.sfz = sfz;
	}
	public String getZgzs() {
		return zgzs;
	}
	public void setZgzs(String zgzs) {
		this.zgzs = zgzs;
	}
	public String getZgzyxqz() {
		return zgzyxqz;
	}
	public void setZgzyxqz(String zgzyxqz) {
		this.zgzyxqz = zgzyxqz;
	}
	public String getJz() {
		return jz;
	}
	public void setJz(String jz) {
		this.jz = jz;
	}
	public String getJzyxqz() {
		return jzyxqz;
	}
	public void setJzyxqz(String jzyxqz) {
		this.jzyxqz = jzyxqz;
	}
	public Integer getShzt() {
		return shzt;
	}
	public void setShzt(Integer shzt) {
		this.shzt = shzt;
	}
	public Boolean getZyzt() {
		return zyzt;
	}
	public void setZyzt(Boolean zyzt) {
		this.zyzt = zyzt;
	}
	public Integer getGlyhId() {
		return glyhId;
	}
	public void setGlyhId(Integer glyhId) {
		this.glyhId = glyhId;
	}
	private String xm;//姓名
	private String sjh;//手机号
	private String zp;//照片
	private String sfz;//身份证	
	private String zgzs;//资格证书
	private String zgzyxqz;//资格证有效期至
	private String jz;//驾证
	private String jzyxqz;//驾证有效期至
	private Integer shzt;//审核状态 1.编辑中2.待审核3.审核通过
	private Boolean zyzt;//在用状态
	private Integer glyhId;

}
