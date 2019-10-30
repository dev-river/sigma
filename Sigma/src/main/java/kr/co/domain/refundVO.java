package kr.co.domain;

import java.io.Serializable;

public class refundVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String id;
	private int gdnum;
	private int buyprice;
	private int buynum;
	private String buydate;
	private String status;
	private String content;
	private String compcontent;
	private String updatedate;
	private String refunddate;
	private String title;
	private String writer;
	private String regidate;
	private String filepath;
	private int dcrate;
	
	public refundVO() {
		// TODO Auto-generated constructor stub
	}

	
	public refundVO(int num, String id, int gdnum, int buyprice, int buynum, String buydate, String status,
			String content, String compcontent, String updatedate, String refunddate, String title, String writer,
			String regidate, String filepath) {
		super();
		this.num = num;
		this.id = id;
		this.gdnum = gdnum;
		this.buyprice = buyprice;
		this.buynum = buynum;
		this.buydate = buydate;
		this.status = status;
		this.content = content;
		this.compcontent = compcontent;
		this.updatedate = updatedate;
		this.refunddate = refunddate;
		this.title = title;
		this.writer = writer;
		this.regidate = regidate;
		this.filepath = filepath;
	}

	

	public int getDcrate() {
		return dcrate;
	}


	public void setDcrate(int dcrate) {
		this.dcrate = dcrate;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}


	public String getBuydate() {
		return buydate;
	}







	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}







	public String getRegidate() {
		return regidate;
	}







	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}







	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		refundVO other = (refundVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "refundVO [num=" + num + ", id=" + id + ", gdnum=" + gdnum + ", buyprice=" + buyprice + ", buynum="
				+ buynum + ", status=" + status + ", content=" + content + ", compcontent=" + compcontent
				+ ", updatedate=" + updatedate + ", refunddate=" + refunddate + ", title=" + title + "]";
	}
	
	






	
}
