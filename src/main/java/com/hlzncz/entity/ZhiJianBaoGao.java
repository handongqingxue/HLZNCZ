package com.hlzncz.entity;

import java.io.Serializable;

public class ZhiJianBaoGao implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final Integer HE_GE=1;//合格
	public static final Integer BU_HE_GE=2;//不合格
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
	public String getGlddBm() {
		return glddBm;
	}
	public void setGlddBm(String glddBm) {
		this.glddBm = glddBm;
	}
	public String getDdh() {
		return ddh;
	}
	public void setDdh(String ddh) {
		this.ddh = ddh;
	}
	public String getDdztmc() {
		return ddztmc;
	}
	public void setDdztmc(String ddztmc) {
		this.ddztmc = ddztmc;
	}
	private Integer jl;//结论 1.合格 2.不合格
	private String bjsj;//编辑时间
	private String glddBm;//关联订单编码
	private String ddh;//订单号
	private String ddztmc;//订单状态名称

}
