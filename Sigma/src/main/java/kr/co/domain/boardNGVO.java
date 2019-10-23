package kr.co.domain;

import java.io.Serializable;

public class boardNGVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int num;
	private String title;
	private String content;
	private String writer;
	private String regidate;
	private String updatedate;
	private int viewcnt;
	private String filepath;
	private int adminselect;
	
	public boardNGVO() {
		
	}

	public boardNGVO(int num, String title, String content, String writer, String regidate, String updatedate,
			int viewcnt, String filepath, int adminselect) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regidate = regidate;
		this.updatedate = updatedate;
		this.viewcnt = viewcnt;
		this.filepath = filepath;
		this.adminselect = adminselect;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getAdminselect() {
		return adminselect;
	}

	public void setAdminselect(int adminselect) {
		this.adminselect = adminselect;
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
		boardNGVO other = (boardNGVO) obj;
		if (num != other.num)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "boardNGVO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regidate=" + regidate + ", updatedate=" + updatedate + ", viewcnt=" + viewcnt + ", filepath="
				+ filepath + ", adminselect=" + adminselect + "]";
	}

}
