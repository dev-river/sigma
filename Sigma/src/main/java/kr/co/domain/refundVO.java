package kr.co.domain;

import java.io.Serializable;

public class refundVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String id;
	private int buynum;
	private String status;
	private String content;
	private String compcontent;
	private String updatedate;
	private String refunddate;
	private String title;
	
	public refundVO() {
		// TODO Auto-generated constructor stub
	}

	

	public refundVO(int num, String id, int buynum, String status, String content, String compcontent,
			String updatedate, String refunddate, String title) {
		super();
		this.num = num;
		this.id = id;
		this.buynum = buynum;
		this.status = status;
		this.content = content;
		this.compcontent = compcontent;
		this.updatedate = updatedate;
		this.refunddate = refunddate;
		this.title = title;
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

	public int getBuynum() {
		return buynum;
	}

	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCompcontent() {
		return compcontent;
	}

	public void setCompcontent(String compcontent) {
		this.compcontent = compcontent;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getRefunddate() {
		return refunddate;
	}

	public void setRefunddate(String refunddate) {
		this.refunddate = refunddate;
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
		refundVO other = (refundVO) obj;
		if (num != other.num)
			return false;
		return true;
	}
}
