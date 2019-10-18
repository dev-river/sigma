package kr.co.domain;

import java.io.Serializable;

public class adminSetVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String bgfilepath;
	private String logofilepath;
	private int regiCharge;
	private int buyCharge;
	
	public adminSetVO() {
		// TODO Auto-generated constructor stub
	}

	public adminSetVO(String bgfilepath, String logofilepath, int regiCharge, int buyCharge) {
		super();
		this.bgfilepath = bgfilepath;
		this.logofilepath = logofilepath;
		this.regiCharge = regiCharge;
		this.buyCharge = buyCharge;
	}

	public String getBgfilepath() {
		return bgfilepath;
	}

	public void setBgfilepath(String bgfilepath) {
		this.bgfilepath = bgfilepath;
	}

	public String getLogofilepath() {
		return logofilepath;
	}

	public void setLogofilepath(String logofilepath) {
		this.logofilepath = logofilepath;
	}

	public int getRegiCharge() {
		return regiCharge;
	}

	public void setRegiCharge(int regiCharge) {
		this.regiCharge = regiCharge;
	}

	public int getBuyCharge() {
		return buyCharge;
	}

	public void setBuyCharge(int buyCharge) {
		this.buyCharge = buyCharge;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
