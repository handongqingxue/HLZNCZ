package com.hlzncz.entity;

import java.io.Serializable;

public class HaoMa implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;//����id
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
	private String hm;//����
	private String prsj;//����ʱ��
	private Integer pdh;//�ŶӺ�	
	private Integer ztId;//״̬ 1.�Ŷ���2.�����3.�ѹ���4.ȡ��5.�к���6.������
	private Integer fl;//����
	private String ewm;//��ά��
	private String ksjhsj;//��ʼ�к�ʱ��
	private Integer sssjId;//����˾��id
	private Integer ssdlId;//��������id
	private Integer ssddId;//��������id

}
