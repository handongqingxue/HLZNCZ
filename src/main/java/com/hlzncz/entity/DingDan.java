package com.hlzncz.entity;

import java.io.Serializable;
import java.util.Random;

public class DingDan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String wybm;//Ψһ����
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

	public Integer getCysjId() {
		return cysjId;
	}

	public void setCysjId(Integer cysjId) {
		this.cysjId = cysjId;
	}

	private String ddh;//������
	private Integer lxlx;//��������
	private Float yzxzl;//Ԥװж����
	private Float sjzl;//ʵ������
	private Float zlceb;//��������
	private Integer ddztId;//����״̬id
	private String ddztmc;//����״̬����
	private String jhysrq;//�ƻ���������
	private String cksj;//����ʱ��
	private String ewm;//��ά��
	private Integer yssId;//������id
	private Integer wlxxId;//������Ϣid
	private Integer fhdwId;//������λid
	private Integer shdwId;//�ջ���λid
	private Integer cyclId;//���˳���id
	private Integer cysjId;//����˾��id
	
	public static void main(String[] args) {
		
		String val = "";
        Random random = new Random();
        for (int i = 0; i < 18; i++) {
            val += String.valueOf(random.nextInt(10));
        }
		System.out.println(val);
	}

}
