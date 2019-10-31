package kr.co.domain;

import java.io.Serializable;

public class gameDetailFileVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private int gdnum;
	private String filename;
	private String uploaddate;
	
	public gameDetailFileVO() {
		// TODO Auto-generated constructor stub
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
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
		gameDetailFileVO other = (gameDetailFileVO) obj;
		if (num != other.num)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return filename;
	}
	
	
}
