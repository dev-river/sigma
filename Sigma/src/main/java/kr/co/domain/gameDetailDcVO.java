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
   private int joinclick;
   private int goal;
   private String rqstartdate;
   private String rqenddate;
   private String dcstartdate;
   private String dcenddate;
   private String title;
   
   public gameDetailDcVO() {
	// TODO Auto-generated constructor stub
}
   

public gameDetailDcVO(int num, int gdnum, int dcrate, int joinclick, int goal, String rqstartdate, String rqenddate,
		String dcstartdate, String dcenddate, String title) {
	super();
	this.num = num;
	this.gdnum = gdnum;
	this.dcrate = dcrate;
	this.joinclick = joinclick;
	this.goal = goal;
	this.rqstartdate = rqstartdate;
	this.rqenddate = rqenddate;
	this.dcstartdate = dcstartdate;
	this.dcenddate = dcenddate;
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

public int getJoinclick() {
	return joinclick;
}

public void setJoinclick(int joinclick) {
	this.joinclick = joinclick;
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
public String toString() {
	return "gameDetailDcVO [num=" + num + ", gdnum=" + gdnum + ", dcrate=" + dcrate + ", joinclick=" + joinclick
			+ ", goal=" + goal + ", rqstartdate=" + rqstartdate + ", rqenddate=" + rqenddate + ", dcstartdate="
			+ dcstartdate + ", dcenddate=" + dcenddate + "]";
}
   
   
}
