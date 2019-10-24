package kr.co.domain;

import java.io.Serializable;

public class favoriteStoreVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private int num;
	private int compnum;
	private String filepath;
	private String fid;
	private String gamefilepath;
	private int gdnum;
	private String title;
			
	
	public favoriteStoreVO() {
		// TODO Auto-generated constructor stub
	}

	

	public favoriteStoreVO(String id, int num, int compnum, String filepath) {
		super();
		this.id = id;
		this.num = num;
		this.compnum = compnum;
		this.filepath = filepath;
	}



	public String getFid() {
		return fid;
	}



	public void setFid(String fid) {
		this.fid = fid;
	}



	public String getGamefilepath() {
		return gamefilepath;
	}



	public void setGamefilepath(String gamefilepath) {
		this.gamefilepath = gamefilepath;
	}



	public int getGdnum() {
		return gdnum;
	}



	public void setGdnum(int gdnum) {
		this.gdnum = gdnum;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getFilepath() {
		return filepath;
	}



	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCompnum() {
		return compnum;
	}

	public void setCompnum(int compnum) {
		this.compnum = compnum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "favoriteStoreVO [id=" + id + ", num=" + num + ", compnum=" + compnum + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		favoriteStoreVO other = (favoriteStoreVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
	
}
