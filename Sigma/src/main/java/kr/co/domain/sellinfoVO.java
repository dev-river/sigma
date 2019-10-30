package kr.co.domain;

import java.io.Serializable;

public class sellinfoVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private int gdnum;
	private String regidate;
	private int price;
	private String usersex;
	private int userage;
	
	public sellinfoVO() {
		// TODO Auto-generated constructor stub
	}

	public sellinfoVO(int num, int gdnum, String regidate, int price, String usersex, int userage) {
		super();
		this.num = num;
		this.gdnum = gdnum;
		this.regidate = regidate;
		this.price = price;
		this.usersex = usersex;
		this.userage = userage;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getGdnum() {
		return gdnum;
	}

	public void setGdnum(int gdnum) {
		this.gdnum = gdnum;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUsersex() {
		return usersex;
	}

	public void setUsersex(String usersex) {
		this.usersex = usersex;
	}

	public int getUserage() {
		return userage;
	}

	public void setUserage(int userage) {
		this.userage = userage;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + num;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		sellinfoVO other = (sellinfoVO) obj;
		if (num != other.num)
			return false;
		return true;
	}
}
