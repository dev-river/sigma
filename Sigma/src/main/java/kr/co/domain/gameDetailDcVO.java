package kr.co.domain;

import java.io.Serializable;

public class gameDetailDcVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int num;
	private int gdnum;
	private int dcrate;
	private int goal;
	private String rqstartdate;
	private String rqenddate;
	private String dcstartdate;
	private String dcenddate;
	
	public gameDetailDcVO() {
		// TODO Auto-generated constructor stub
	}

	public gameDetailDcVO(int num, int gdnum, int dcrate, int goal, String rqstartdate, String rqenddate,
			String dcstartdate, String dcenddate) {
		super();
		this.num = num;
		this.gdnum = gdnum;
		this.dcrate = dcrate;
		this.goal = goal;
		this.rqstartdate = rqstartdate;
		this.rqenddate = rqenddate;
		this.dcstartdate = dcstartdate;
		this.dcenddate = dcenddate;
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

	public int getDcrate() {
		return dcrate;
	}

	public void setDcrate(int dcrate) {
		this.dcrate = dcrate;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public String getRqstartdate() {
		return rqstartdate;
	}

	public void setRqstartdate(String rqstartdate) {
		this.rqstartdate = rqstartdate;
	}

	public String getRqenddate() {
		return rqenddate;
	}

	public void setRqenddate(String rqenddate) {
		this.rqenddate = rqenddate;
	}

	public String getDcstartdate() {
		return dcstartdate;
	}

	public void setDcstartdate(String dcstartdate) {
		this.dcstartdate = dcstartdate;
	}

	public String getDcenddate() {
		return dcenddate;
	}

	public void setDcenddate(String dcenddate) {
		this.dcenddate = dcenddate;
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
		gameDetailDcVO other = (gameDetailDcVO) obj;
		if (num != other.num)
			return false;
		return true;
	}
}
