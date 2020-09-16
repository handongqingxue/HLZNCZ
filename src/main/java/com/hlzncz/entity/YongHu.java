package com.hlzncz.entity;

import java.io.Serializable;

public class YongHu implements Serializable {

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
	public String getYhm() {
		return yhm;
	}
	public void setYhm(String yhm) {
		this.yhm = yhm;
	}
	public String getNc() {
		return nc;
	}
	public void setNc(String nc) {
		this.nc = nc;
	}
	public String getTx() {
		return tx;
	}
	public void setTx(String tx) {
		this.tx = tx;
	}
	public String getSm() {
		return sm;
	}
	public void setSm(String sm) {
		this.sm = sm;
	}
	public Integer getZt() {
		return zt;
	}
	public void setZt(Integer zt) {
		this.zt = zt;
	}
	public String getYsmm() {
		return ysmm;
	}
	public void setYsmm(String ysmm) {
		this.ysmm = ysmm;
	}
	public String getJs() {
		return js;
	}
	public void setJs(String js) {
		this.js = js;
	}
	public String getZjjsId() {
		return zjjsId;
	}
	public void setZjjsId(String zjjsId) {
		this.zjjsId = zjjsId;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	//https://blog.csdn.net/qq_43416276/article/details/102981480
	public YongHu() {
		super();
	}
	
	public YongHu(String yhm,String ysmm) {
		this.yhm=yhm;
		this.ysmm=ysmm;
	}
	private String yhm;
	private String nc;
	private String tx;
	private String sm;
	private Integer zt;//1.新增2.正常使用3.废弃4.有误
	private String ysmm;
	private String js;
	private String zjjsId;
	private String role;

}
