package com.hlzncz.entity;

import java.io.Serializable;

public class ZhiJianBaoGao implements Serializable {

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
	public Integer getJl() {
		return jl;
	}
	public void setJl(Integer jl) {
		this.jl = jl;
	}
	public String getBjsj() {
		return bjsj;
	}
	public void setBjsj(String bjsj) {
		this.bjsj = bjsj;
	}
	public Integer getGlddId() {
		return glddId;
	}
	public void setGlddId(Integer glddId) {
		this.glddId = glddId;
	}
	private Integer jl;//结论 1.合格 2.不合格
	private String bjsj;//编辑时间
	private Integer glddId;//关联订单id

}
