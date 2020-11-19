package com.hlzncz.entity;

import java.io.Serializable;
import java.util.Random;

public class DingDan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 编辑中状态
	 */
	public static final Integer BIAN_JI_ZHONG=1;
	/**
	 * 已下单状态
	 */
	public static final Integer YI_XIA_DAN=2;
	/**
	 * 已完成
	 */
	public static final Integer YI_WAN_CHENG=3;
	/**
	 * 待审核状态
	 */
	public static final Integer DAI_SHEN_HE=4;
	/**
	 * 排队中
	 */
	public static final Integer PAI_DUI_ZHONG=5;
	/**
	 * 待检验
	 */
	public static final Integer DAI_JIAN_YAN=6;
	/**
	 * 待离厂
	 */
	public static final Integer DAI_LI_CHANG=12;
	/**
	 * 待装卸货
	 */
	public static final Integer DAI_ZHUANG_XIE_HUO=17;
	private String wybm;//唯一编码
	public String getWybm() {
		return wybm;
	}

	public void setWybm(String wybm) {
		this.wybm = wybm;
	}

	public String getDdh() {
		return ddh;
	}

	public void setDdh(String ddh) {
		this.ddh = ddh;
	}

	public Integer getLxlx() {
		return lxlx;
	}

	public void setLxlx(Integer lxlx) {
		this.lxlx = lxlx;
	}

	public Float getYzxzl() {
		return yzxzl;
	}

	public void setYzxzl(Float yzxzl) {
		this.yzxzl = yzxzl;
	}

	public Float getSjzl() {
		return sjzl;
	}

	public void setSjzl(Float sjzl) {
		this.sjzl = sjzl;
	}

	public Float getZlceb() {
		return zlceb;
	}

	public void setZlceb(Float zlceb) {
		this.zlceb = zlceb;
	}

	public Integer getDdztId() {
		return ddztId;
	}

	public void setDdztId(Integer ddztId) {
		this.ddztId = ddztId;
	}
	
	public String getDdztmc() {
		return ddztmc;
	}

	public void setDdztmc(String ddztmc) {
		this.ddztmc = ddztmc;
	}
	
	public String getBjsj() {
		return bjsj;
	}

	public void setBjsj(String bjsj) {
		this.bjsj = bjsj;
	}

	public String getJhysrq() {
		return jhysrq;
	}

	public void setJhysrq(String jhysrq) {
		this.jhysrq = jhysrq;
	}

	public String getCksj() {
		return cksj;
	}

	public void setCksj(String cksj) {
		this.cksj = cksj;
	}

	public String getEwm() {
		return ewm;
	}

	public void setEwm(String ewm) {
		this.ewm = ewm;
	}

	public Integer getYssId() {
		return yssId;
	}

	public void setYssId(Integer yssId) {
		this.yssId = yssId;
	}

	public String getYssmc() {
		return yssmc;
	}

	public void setYssmc(String yssmc) {
		this.yssmc = yssmc;
	}

	public Integer getWlxxId() {
		return wlxxId;
	}

	public void setWlxxId(Integer wlxxId) {
		this.wlxxId = wlxxId;
	}

	public Integer getFhdwId() {
		return fhdwId;
	}

	public void setFhdwId(Integer fhdwId) {
		this.fhdwId = fhdwId;
	}

	public Integer getShdwId() {
		return shdwId;
	}

	public void setShdwId(Integer shdwId) {
		this.shdwId = shdwId;
	}

	public Integer getCyclId() {
		return cyclId;
	}

	public void setCyclId(Integer cyclId) {
		this.cyclId = cyclId;
	}
	
	public String getCph() {
		return cph;
	}

	public void setCph(String cph) {
		this.cph = cph;
	}

	public Integer getCysjId() {
		return cysjId;
	}

	public void setCysjId(Integer cysjId) {
		this.cysjId = cysjId;
	}

	public Integer getXdyhId() {
		return xdyhId;
	}

	public void setXdyhId(Integer xdyhId) {
		this.xdyhId = xdyhId;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	private String ddh;//订单号
	private Integer lxlx;//流向类型
	private Float yzxzl;//预装卸重量
	private Float sjzl;//实际重量
	private Float zlceb;//重量差额比
	private Integer ddztId;//订单状态id
	private String ddztmc;//订单状态名称
	private String bjsj;//编辑时间
	private String jhysrq;//计划运输日期
	private String cksj;//出库时间
	private String ewm;//二维码
	private Integer yssId;//运输商id
	private String yssmc;
	private Integer wlxxId;//物料信息id
	private Integer fhdwId;//发货单位id
	private Integer shdwId;//收货单位id
	private Integer cyclId;//承运车辆id
	private String cph;
	private Integer cysjId;//承运司机id
	private Integer xdyhId;
	private String bz;//备注

	public static void main(String[] args) {
		
		String val = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
            val += String.valueOf(random.nextInt(10));
        }
		System.out.println(val);
	}

}
