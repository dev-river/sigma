package kr.co.domain;

import java.io.Serializable;

public class buyListVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String id;
	private int gdnum;
	private int buyprice;
	private String buydate;
	private String category;
	private String title;
	
	public buyListVO() {
		// TODO Auto-generated constructor stub
	}

	public buyListVO(int num, String id, int gdnum, int buyprice, String buydate, String category, String title) {
		super();
		this.num = num;
		this.id = id;
		this.gdnum = gdnum;
		this.buyprice = buyprice;
		this.buydate = buydate;
		this.category = category;
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGdnum() {
		return gdnum;
	}

	public void setGdnum(int gdnum) {
		this.gdnum = gdnum;
	}

	public int getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(int buyprice) {
		this.buyprice = buyprice;
	}

	public String getBuydate() {
		return buydate;
	}

	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
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
		buyListVO other = (buyListVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "buyListVO [num=" + num + ", id=" + id + ", gdnum=" + gdnum + ", buyprice=" + buyprice + ", buydate="
				+ buydate + ", category=" + category + ", title=" + title + "]";
	}

	
	
	
}
