package com.hlzncz.entity;

import java.io.Serializable;

public class JueSe implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//角色id
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
	public Integer getZt() {
		return zt;
	}
	public void setZt(Integer zt) {
		this.zt = zt;
	}
	public String getMs() {
		return ms;
	}
	public void setMs(String ms) {
		this.ms = ms;
	}
	public String getZjqxId() {
		return zjqxId;
	}
	public void setZjqxId(String zjqxId) {
		this.zjqxId = zjqxId;
	}
	private String mc;//名称
	private Integer zt;//状态
	private String ms;//描述
	private String zjqxId;//直接权限id

}
