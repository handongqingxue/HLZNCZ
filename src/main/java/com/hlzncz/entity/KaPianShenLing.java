package com.hlzncz.entity;

import java.io.Serializable;

public class KaPianShenLing implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//��Ƭ����id
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
	private String sfzh;//���֤��
	private Boolean slzt;//����״̬ 1.�ɹ� 0.ʧ��
	private String bjsj;//�༭ʱ��

}
