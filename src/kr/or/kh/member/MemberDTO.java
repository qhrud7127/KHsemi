package kr.or.kh.member;

import java.io.Serializable;

public class MemberDTO implements Serializable {
	private int mbno;
	private String name;
	private String addr;
	private String tel;
	private String id;
	private String pw;
	private String stype;
	
	public MemberDTO(int mbno, String name, String addr, String tel, String id, String pw, String stype) {
		this.mbno = mbno;
		this.name = name;
		this.addr = addr;
		this.tel = tel;
		this.id = id;
		this.pw = pw;
		this.stype = stype;
	}
	
	
	public MemberDTO() {
	}
	
	
	public int getMbno() {
		return mbno;
	}


	public void setMbno(int mbno) {
		this.mbno = mbno;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddr() {
		return addr;
	}


	public void setAddr(String addr) {
		this.addr = addr;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getStype() {
		return stype;
	}


	public void setStype(String stype) {
		this.stype = stype;
	}




}
