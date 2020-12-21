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
	 * 待一检上榜
	 */
	public static final Integer DAI_YI_JIAN_SHANG_BANG=7;
	/**
	 * 待二检上榜
	 */
	public static final Integer DAI_ER_JIAN_SHANG_BANG=11;
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

	public Integer getRkzt() {
		return rkzt;
	}

	public void setRkzt(Integer rkzt) {
		this.rkzt = rkzt;
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

	public String getCrksj() {
		return crksj;
	}

	public void setCrksj(String crksj) {
		this.crksj = crksj;
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

	public String getWlmc() {
		return wlmc;
	}

	public void setWlmc(String wlmc) {
		this.wlmc = wlmc;
	}

	public Integer getFhdwId() {
		return fhdwId;
	}

	public void setFhdwId(Integer fhdwId) {
		this.fhdwId = fhdwId;
	}

	public String getFhdwmc() {
		return fhdwmc;
	}

	public void setFhdwmc(String fhdwmc) {
		this.fhdwmc = fhdwmc;
	}
	
	public Integer getShdwId() {
		return shdwId;
	}

	public void setShdwId(Integer shdwId) {
		this.shdwId = shdwId;
	}

	public String getShdwmc() {
		return shdwmc;
	}

	public void setShdwmc(String shdwmc) {
		this.shdwmc = shdwmc;
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

	public String getDdbz() {
		return ddbz;
	}

	public void setDdbz(String ddbz) {
		this.ddbz = ddbz;
	}

	private String ddh;//订单号
	private Integer lxlx;//流向类型
	private Float yzxzl;//预装卸重量
	private Float sjzl;//实际重量
	private Float zlceb;//重量差额比
	private Integer ddztId;//订单状态id
	private String ddztmc;//订单状态名称
	private Integer rkzt;//入库状态  1.未入库 2.待入库 3.已入库 4.入库异常
	private String bjsj;//编辑时间
	private String jhysrq;//计划运输日期
	private String crksj;//出入库时间
	private String ewm;//二维码
	private Integer yssId;//运输商id
	private String yssmc;
	private Integer wlxxId;//物料信息id
	private String wlmc;
	private Integer fhdwId;//发货单位id
	private String fhdwmc;
	private Integer shdwId;//收货单位id
	private String shdwmc;
	private Integer cyclId;//承运车辆id
	private String cph;
	private Integer cysjId;//承运司机id
	private Integer xdyhId;//下单用户id
	private String bz;//备注
	private String ddbz;//备注（这个属性在其他类里也有bz字段重名时才用）
	
	/**
	 * 创建订单唯一编码
	 * @return
	 */
	public static String createWybm() {
		String wybm = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
        	wybm += String.valueOf(random.nextInt(10));
        }
        return wybm;
	}

	public static void main(String[] args) {
		
		String val = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
            val += String.valueOf(random.nextInt(10));
        }
		System.out.println(val);
	}

}
