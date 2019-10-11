package kr.co.domain;

import java.io.Serializable;

public class memberVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String nickname;
	private String name;
	private String pw;
	private int accessing;
	private String author;
	private String phone;
	private String email;
	private String birth;
	private String sex;
	private String address1;
	private String address2;
	private String joindate;
	private int cash;
	private String compname;
	private String compdetail;
	private int compnum;
	private String compaddress1;
	private String compaddress2;
	private String compphone;
	private String filepath;
	
	public memberVO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public memberVO(String id, String nickname, String name, String pw, int accessing, String author, String phone,
			String email, String birth, String sex, String address1, String address2, String joindate, int cash,
			String compname, String compdetail, int compnum, String compaddress1, String compaddress2, String compphone,
			String filepath) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.name = name;
		this.pw = pw;
		this.accessing = accessing;
		this.author = author;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.sex = sex;
		this.address1 = address1;
		this.address2 = address2;
		this.joindate = joindate;
		this.cash = cash;
		this.compname = compname;
		this.compdetail = compdetail;
		this.compnum = compnum;
		this.compaddress1 = compaddress1;
		this.compaddress2 = compaddress2;
		this.compphone = compphone;
		this.filepath = filepath;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public int getAccessing() {
		return accessing;
	}

	public void setAccessing(int accessing) {
		this.accessing = accessing;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public String getCompname() {
		return compname;
	}

	public void setCompname(String compname) {
		this.compname = compname;
	}

	public String getCompdetail() {
		return compdetail;
	}

	public void setCompdetail(String compdetail) {
		this.compdetail = compdetail;
	}

	public int getCompnum() {
		return compnum;
	}

	public void setCompnum(int compnum) {
		this.compnum = compnum;
	}

	public String getCompaddress1() {
		return compaddress1;
	}

	public void setCompaddress1(String compaddress1) {
		this.compaddress1 = compaddress1;
	}

	public String getCompaddress2() {
		return compaddress2;
	}

	public void setCompaddress2(String compaddress2) {
		this.compaddress2 = compaddress2;
	}

	public String getCompphone() {
		return compphone;
	}

	public void setCompphone(String compphone) {
		this.compphone = compphone;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
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
		memberVO other = (memberVO) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}



	@Override
	public String toString() {
		return "memberVO [id=" + id + ", nickname=" + nickname + ", name=" + name + ", pw=" + pw + ", accessing="
				+ accessing + ", author=" + author + ", phone=" + phone + ", email=" + email + ", birth=" + birth
				+ ", sex=" + sex + ", address1=" + address1 + ", address2=" + address2 + ", joindate=" + joindate
				+ ", cash=" + cash + ", compname=" + compname + ", compdetail=" + compdetail + ", compnum=" + compnum
				+ ", compaddress1=" + compaddress1 + ", compaddress2=" + compaddress2 + ", compphone=" + compphone
				+ ", filepath=" + filepath + "]";
	}

	
	
}
