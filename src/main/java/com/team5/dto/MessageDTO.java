package com.team5.dto;

public class MessageDTO {
	private int mno, msno, toMno, fromMno, msdel;
	private String mname, mscontent, sendDate, mid;
	public int getMsno() {
		return msno;
	}
	public void setMsno(int msno) {
		this.msno = msno;
	}
	public int getToMno() {
		return toMno;
	}
	public void setToMno(int toMno) {
		this.toMno = toMno;
	}
	public int getFromMno() {
		return fromMno;
	}
	public void setFromMno(int fromMno) {
		this.fromMno = fromMno;
	}
	public int getMsdel() {
		return msdel;
	}
	public void setMsdel(int msdel) {
		this.msdel = msdel;
	}
	public String getMscontent() {
		return mscontent;
	}
	public void setMscontent(String mscontent) {
		this.mscontent = mscontent;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
}
