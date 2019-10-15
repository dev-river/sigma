package kr.co.domain;

import java.io.Serializable;

public class replyVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int num;
	private int frnum;
	private String content;
	private String replyer;
	private String regidate;
	private String updatedate;
	
	public replyVO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public replyVO(int frnum, String content, String replyer) {
		this.frnum = frnum;
		this.content = content;
		this.replyer = replyer;
	}



	public replyVO(int num, int frnum, String content, String replyer, String regidate, String updatedate) {
		this.num = num;
		this.frnum = frnum;
		this.content = content;
		this.replyer = replyer;
		this.regidate = regidate;
		this.updatedate = updatedate;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getFrnum() {
		return frnum;
	}

	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "replyVO [num=" + num + ", frnum=" + frnum + ", content=" + content + ", replyer=" + replyer + "]";
	}






	
	

}
