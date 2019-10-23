package kr.co.domain;

import java.io.Serializable;

public class adminSlideVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String filepath;
	private String urlpath;
	private String regidate;
	
	public adminSlideVO() {
		// TODO Auto-generated constructor stub
	}

	public adminSlideVO(int num, String filepath, String urlpath, String regidate) {
		super();
		this.num = num;
		this.filepath = filepath;
		this.urlpath = urlpath;
		this.regidate = regidate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String geturlpath() {
		return urlpath;
	}

	public void seturlpath(String urlpath) {
		this.urlpath = urlpath;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
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
		adminSlideVO other = (adminSlideVO) obj;
		if (num != other.num)
			return false;
		return true;
	}

}
