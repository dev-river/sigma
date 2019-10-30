package kr.co.domain;

import java.io.Serializable;

public class basketVO implements Serializable{

	/**
	 * 
	 */

	private static final long serialVersionUID = 1L;
	private int num;
	private String id;
	private int gdnum;
	private String gregidate;
	private String title;
	private String writer;
	private String sregidate;
	private int price;
	private String filepath;
	public basketVO() {
		// TODO Auto-generated constructor stub
	}
	public basketVO(int num, String id, int gdnum, String gregidate, String title, String writer, String sregidate,
			int price) {
		super();
		this.num = num;
		this.id = id;
		this.gdnum = gdnum;
		this.gregidate = gregidate;
		this.title = title;
		this.writer = writer;
		this.sregidate = sregidate;
		this.price = price;
	}
	
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
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
	public String getGregidate() {
		return gregidate;
	}
	public void setGregidate(String gregidate) {
		this.gregidate = gregidate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSregidate() {
		return sregidate;
	}
	public void setSregidate(String sregidate) {
		this.sregidate = sregidate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "basketVO [num=" + num + ", id=" + id + ", gdnum=" + gdnum + ", gregidate=" + gregidate + ", title="
				+ title + ", writer=" + writer + ", sregidate=" + sregidate + ", price=" + price + "]";
	}
	
	
}
