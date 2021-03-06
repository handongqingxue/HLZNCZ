package com.hlzncz.entity;

import java.io.Serializable;

public class CheLiang implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 待审核
	 */
	public static final Integer DAI_SHEN_HE=1;
	/**
	 * 审核通过
	 */
	public static final Integer SHEN_HE_TONG_GUO=2;
	/**
	 * 编辑中
	 */
	public static final Integer BIAN_JI_ZHONG=3;
	private Integer id;//车辆id
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCph() {
		return cph;
	}
	public void setCph(String cph) {
		this.cph = cph;
	}
	public String getCzxx() {
		return czxx;
	}
	public void setCzxx(String czxx) {
		this.czxx = czxx;
	}
	public Float getPz() {
		return pz;
	}
	public void setPz(Float pz) {
		this.pz = pz;
	}
	public Integer getCllx() {
		return cllx;
	}
	public void setCllx(Integer cllx) {
		this.cllx = cllx;
	}
	public String getPpxh() {
		return ppxh;
	}
	public void setPpxh(String ppxh) {
		this.ppxh = ppxh;
	}
	public String getZp() {
		return zp;
	}
	public void setZp(String zp) {
		this.zp = zp;
	}
	public String getFdjhm() {
		return fdjhm;
	}
	public void setFdjhm(String fdjhm) {
		this.fdjhm = fdjhm;
	}
	public String getClsbdh() {
		return clsbdh;
	}
	public void setClsbdh(String clsbdh) {
		this.clsbdh = clsbdh;
	}
	public String getZcrq() {
		return zcrq;
	}
	public void setZcrq(String zcrq) {
		this.zcrq = zcrq;
	}
	public Integer getPfjd() {
		return pfjd;
	}
	public void setPfjd(Integer pfjd) {
		this.pfjd = pfjd;
	}
	public String getFzrq() {
		return fzrq;
	}
	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}
	public Boolean getSfzy() {
		return sfzy;
	}
	public void setSfzy(Boolean sfzy) {
		this.sfzy = sfzy;
	}
	public Integer getShzt() {
		return shzt;
	}
	public void setShzt(Integer shzt) {
		this.shzt = shzt;
	}
	public Integer getClyslx() {
		return clyslx;
	}
	public void setClyslx(Integer clyslx) {
		this.clyslx = clyslx;
	}
	public String getXsz() {
		return xsz;
	}
	public void setXsz(String xsz) {
		this.xsz = xsz;
	}
	public String getScqd() {
		return scqd;
	}
	public void setScqd(String scqd) {
		this.scqd = scqd;
	}
	public String getPfjdcxjt() {
		return pfjdcxjt;
	}
	public void setPfjdcxjt(String pfjdcxjt) {
		this.pfjdcxjt = pfjdcxjt;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	private String cph;//车牌号
	private String czxx;//车主信息
	private Float pz;//皮重
	private Integer cllx;//车辆类型：1.重型
	private String ppxh;//品牌型号
	private String zp;//照片
	private String fdjhm;//发动机号码
	private String clsbdh;//车辆识别代号
	private String zcrq;//注册日期
	private Integer pfjd;//排放阶段：1.国五燃油 2.国五燃气 3.国六燃油 4.国六燃气 5.电动
	private String fzrq;//发证日期
	private Boolean sfzy;//是否在用
	private Integer shzt;//审核状态：1.待审核 2.审核通过 3.编辑中
	private Integer clyslx;//车辆运输类型：1.普货运输 2.厂内运输 3.危化品运输
	private String xsz;//行驶证
	private String scqd;//随车清单
	private String pfjdcxjt;//排放阶段查询截图
	private String bz;//备注
	
}
