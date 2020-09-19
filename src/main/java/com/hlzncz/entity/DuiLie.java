package com.hlzncz.entity;

import java.io.Serializable;

public class DuiLie implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//队列id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getDm() {
		return dm;
	}
	public void setDm(String dm) {
		this.dm = dm;
	}
	public Integer getJhxs() {
		return jhxs;
	}
	public void setJhxs(Integer jhxs) {
		this.jhxs = jhxs;
	}
	public Float getJhyz() {
		return jhyz;
	}
	public void setJhyz(Float jhyz) {
		this.jhyz = jhyz;
	}
	public Integer getZt() {
		return zt;
	}
	public void setZt(Integer zt) {
		this.zt = zt;
	}
	public Integer getShdwId() {
		return shdwId;
	}
	public void setShdwId(Integer shdwId) {
		this.shdwId = shdwId;
	}
	private String mc;//名称
	private String dm;//代码
	private Integer jhxs;//叫号形式
	private Float jhyz;//叫号阈值
	private Integer zt;//状态
	private Integer shdwId;//收货单位id

}
