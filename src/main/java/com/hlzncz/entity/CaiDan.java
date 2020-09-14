package com.hlzncz.entity;

import java.io.Serializable;

public class CaiDan implements Serializable {

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
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getLj() {
		return lj;
	}
	public void setLj(String lj) {
		this.lj = lj;
	}
	public Integer getJb() {
		return jb;
	}
	public void setJb(Integer jb) {
		this.jb = jb;
	}
	public Integer getPx() {
		return px;
	}
	public void setPx(Integer px) {
		this.px = px;
	}
	public Integer getSjId() {
		return sjId;
	}
	public void setSjId(Integer sjId) {
		this.sjId = sjId;
	}
	private String mc;
	private String lj;
	private Integer jb;
	private Integer px;
	private Integer sjId;

}
