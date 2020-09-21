package com.hlzncz.entity;

import java.io.Serializable;

public class KaPianShenLing implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//卡片申领id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	public Boolean getSlzt() {
		return slzt;
	}
	public void setSlzt(Boolean slzt) {
		this.slzt = slzt;
	}
	public String getBjsj() {
		return bjsj;
	}
	public void setBjsj(String bjsj) {
		this.bjsj = bjsj;
	}
	private String sfzh;//身份证号
	private Boolean slzt;//申领状态 1.成功 0.失败
	private String bjsj;//编辑时间

}
