package com.team5.dto;

public class JBoardDTO {
	
	private int jno, jcount, jcomment, jdel;
	private String jtitle, jcontent, jwrite, jdate, jmid, jip, jsell;
	String jimg;
	public int getJno() {
		return jno;
	}
	public void setJno(int jno) {
		this.jno = jno;
	}
	public int getJcount() {
		return jcount;
	}
	public void setJcount(int jcount) {
		this.jcount = jcount;
	}
	public int getJcomment() {
		return jcomment;
	}
	public void setJcomment(int jcomment) {
		this.jcomment = jcomment;
	}
	public int getJdel() {
		return jdel;
	}
	public void setJdel(int jdel) {
		this.jdel = jdel;
	}
	public String getJtitle() {
		return jtitle;
	}
	public void setJtitle(String jtitle) {
		this.jtitle = jtitle;
	}
	public String getJcontent() {
		return jcontent;
	}
	public void setJcontent(String jcontent) {
		this.jcontent = jcontent;
	}
	public String getJwrite() {
		return jwrite;
	}
	public void setJwrite(String jwrite) {
		this.jwrite = jwrite;
	}
	public String getJdate() {
		return jdate;
	}
	public void setJdate(String jdate) {
		this.jdate = jdate;
	}
	public String getJmid() {
		return jmid;
	}
	public void setJmid(String jmid) {
		this.jmid = jmid;
	}
	public String getJip() {
		return jip;
	}
	public void setJip(String jip) {
		this.jip = jip;
	}
	public String getJsell() {
		return jsell;
	}
	public void setJsell(String jsell) {
		this.jsell = jsell;
	}
	public String getJimg() {
		return jimg;
	}
	public void setJimg(String base64EncodedImage) {
		this.jimg = base64EncodedImage;
	}

}
