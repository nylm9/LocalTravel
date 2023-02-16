package com.localtravel.dto;

public class LikeBtnDto {
	private String lbcode;
	private String lbmid;

	private String lbname;
	
	private String lbaddr;
	public String getLbmid() {
		return lbmid;
	}
	
	public void setLbmid(String lbmid) {
		this.lbmid = lbmid;
	}

	public String getLbcode() {
		return lbcode;
	}

	public void setLbcode(String lbcode) {
		this.lbcode = lbcode;
	}

	public String getLbname() {
		return lbname;
	}

	public void setLbname(String lbname) {
		this.lbname = lbname;
	}

	public String getLbaddr() {
		return lbaddr;
	}

	public void setLbaddr(String lbaddr) {
		this.lbaddr = lbaddr;
	}

	@Override
	public String toString() {
		return "LikeBtnDto [lbcode=" + lbcode + ", lbmid=" + lbmid + ", lbname=" + lbname + ", lbaddr=" + lbaddr + "]";
	}

	


}
