package com.hlzncz.entity;

import java.io.Serializable;
import java.util.Random;

public class DingDan implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * �༭��״̬
	 */
	public static final Integer BIAN_JI_ZHONG=1;
	/**
	 * ���µ�״̬
	 */
	public static final Integer YI_XIA_DAN=2;
	/**
	 * �����
	 */
	public static final Integer YI_WAN_CHENG=3;
	/**
	 * �����״̬
	 */
	public static final Integer DAI_SHEN_HE=4;
	/**
	 * �Ŷ���
	 */
	public static final Integer PAI_DUI_ZHONG=5;
	/**
	 * ������
	 */
	public static final Integer DAI_JIAN_YAN=6;
	/**
	 * ��һ���ϰ�
	 */
	public static final Integer DAI_YI_JIAN_SHANG_BANG=7;
	/**
	 * �������ϰ�
	 */
	public static final Integer DAI_ER_JIAN_SHANG_BANG=11;
	/**
	 * ���볧
	 */
	public static final Integer DAI_LI_CHANG=12;
	/**
	 * ��װж��
	 */
	public static final Integer DAI_ZHUANG_XIE_HUO=17;
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

	private String ddh;//������
	private Integer lxlx;//��������
	private Float yzxzl;//Ԥװж����
	private Float sjzl;//ʵ������
	private Float zlceb;//��������
	private Integer ddztId;//����״̬id
	private String ddztmc;//����״̬����
	private Integer rkzt;//���״̬  1.δ��� 2.����� 3.����� 4.����쳣
	private String bjsj;//�༭ʱ��
	private String jhysrq;//�ƻ���������
	private String crksj;//�����ʱ��
	private String ewm;//��ά��
	private Integer yssId;//������id
	private String yssmc;
	private Integer wlxxId;//������Ϣid
	private String wlmc;
	private Integer fhdwId;//������λid
	private String fhdwmc;
	private Integer shdwId;//�ջ���λid
	private String shdwmc;
	private Integer cyclId;//���˳���id
	private String cph;
	private Integer cysjId;//����˾��id
	private Integer xdyhId;//�µ��û�id
	private String bz;//��ע
	private String ddbz;//��ע�������������������Ҳ��bz�ֶ�����ʱ���ã�
	
	/**
	 * ��������Ψһ����
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
