package com.hlzncz.entity;

import java.io.Serializable;

public class HaoMa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//号码id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getHm() {
		return hm;
	}
	public void setHm(String hm) {
		this.hm = hm;
	}
	public String getPrsj() {
		return prsj;
	}
	public void setPrsj(String prsj) {
		this.prsj = prsj;
	}
	public Integer getPdh() {
		return pdh;
	}
	public void setPdh(Integer pdh) {
		this.pdh = pdh;
	}
	public Integer getZtId() {
		return ztId;
	}
	public void setZtId(Integer ztId) {
		this.ztId = ztId;
	}
	public Integer getFl() {
		return fl;
	}
	public void setFl(Integer fl) {
		this.fl = fl;
	}
	public String getEwm() {
		return ewm;
	}
	public void setEwm(String ewm) {
		this.ewm = ewm;
	}
	public String getKsjhsj() {
		return ksjhsj;
	}
	public void setKsjhsj(String ksjhsj) {
		this.ksjhsj = ksjhsj;
	}
	public Integer getSssjId() {
		return sssjId;
	}
	public void setSssjId(Integer sssjId) {
		this.sssjId = sssjId;
	}
	public Integer getSsdlId() {
		return ssdlId;
	}
	public void setSsdlId(Integer ssdlId) {
		this.ssdlId = ssdlId;
	}
	public Integer getSsddId() {
		return ssddId;
	}
	public void setSsddId(Integer ssddId) {
		this.ssddId = ssddId;
	}
	private String hm;//号码
	private String prsj;//排入时间
	private Integer pdh;//排队号	
	private Integer ztId;//状态 1.排队中2.已完成3.已过号4.取消5.叫号中6.受理中
	private Integer fl;//分类
	private String ewm;//二维码
	private String ksjhsj;//开始叫号时间
	private Integer sssjId;//所属司机id
	private Integer ssdlId;//所属队列id
	private Integer ssddId;//所属订单id

}
