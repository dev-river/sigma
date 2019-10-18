package kr.co.domain;

import java.io.Serializable;

public class reviewVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private int num;
	private int gdnum;
	private String writer;
	private String content;
	private String regidate;
	private String updatedate;
	private String recommend;
	private int assistyes;
	private int assistno;
	
	public reviewVO() {
		// TODO Auto-generated constructor stub
	}

	public reviewVO(int num, int gdnum, String writer, String content, String regidate, String updatedate,
			String recommend, int assistyes, int assistno) {
		super();
		this.num = num;
		this.gdnum = gdnum;
		this.writer = writer;
		this.content = content;
		this.regidate = regidate;
		this.updatedate = updatedate;
		this.recommend = recommend;
		this.assistyes = assistyes;
		this.assistno = assistno;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}

	public int getAssistyes() {
		return assistyes;
	}

	public void setAssistyes(int assistyes) {
		this.assistyes = assistyes;
	}

	public int getAssistno() {
		return assistno;
	}

	public void setAssistno(int assistno) {
		this.assistno = assistno;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "reviewVO [num=" + num + ", gdnum=" + gdnum + ", writer=" + writer + ", content=" + content
				+ ", regidate=" + regidate + ", updatedate=" + updatedate + ", recommend=" + recommend + ", assistyes="
				+ assistyes + ", assistno=" + assistno + "]";
	}
}
