package kr.co.domain;

import java.io.Serializable;

public class gameVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private String title;
	private String content;
	private String writer;
	private String regidate;
	private String category;
	private int price;
	private int dcrate;
	private int mancount;
	private int womancount;
	private int totalage;
	private int profit;
	private int buycharge;
	private int viewcnt;
	private String filepath;
	private String gamefilepath;
	private String status;
	
	public gameVO() {
		// TODO Auto-generated constructor stub
	}

	public gameVO(int num, String title, String content, String writer, String regidate, String category, int price,
			int dcrate, int mancount, int womancount, int totalage, int profit, int buycharge, int viewcnt,
			String filepath, String gamefilepath, String status) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regidate = regidate;
		this.category = category;
		this.price = price;
		this.dcrate = dcrate;
		this.mancount = mancount;
		this.womancount = womancount;
		this.totalage = totalage;
		this.profit = profit;
		this.buycharge = buycharge;
		this.viewcnt = viewcnt;
		this.filepath = filepath;
		this.gamefilepath = gamefilepath;
		this.status = status;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDcrate() {
		return dcrate;
	}

	public void setDcrate(int dcrate) {
		this.dcrate = dcrate;
	}

	public int getMancount() {
		return mancount;
	}

	public void setMancount(int mancount) {
		this.mancount = mancount;
	}

	public int getWomancount() {
		return womancount;
	}

	public void setWomancount(int womancount) {
		this.womancount = womancount;
	}

	public int getTotalage() {
		return totalage;
	}

	public void setTotalage(int totalage) {
		this.totalage = totalage;
	}

	public int getProfit() {
		return profit;
	}

	public void setProfit(int profit) {
		this.profit = profit;
	}

	public int getBuycharge() {
		return buycharge;
	}

	public void setBuycharge(int buycharge) {
		this.buycharge = buycharge;
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

	public String getGamefilepath() {
		return gamefilepath;
	}

	public void setGamefilepath(String gamefilepath) {
		this.gamefilepath = gamefilepath;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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
		gameVO other = (gameVO) obj;
		if (num != other.num)
			return false;
		return true;
	}
}
