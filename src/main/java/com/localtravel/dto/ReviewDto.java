package com.localtravel.dto;

public class ReviewDto {
	private String rvencode;
	private String rvmid;
	private String rvcomment;
	private String rvrecommend;
	private String rvdate;
	public String getRvencode() {
		return rvencode;
	}
	public void setRvencode(String rvencode) {
		this.rvencode = rvencode;
	}
	public String getRvmid() {
		return rvmid;
	}
	public void setRvmid(String rvmid) {
		this.rvmid = rvmid;
	}
	public String getRvcomment() {
		return rvcomment;
	}
	public void setRvcomment(String rvcomment) {
		this.rvcomment = rvcomment;
	}
	public String getRvrecommend() {
		return rvrecommend;
	}
	public void setRvrecommend(String rvrecommend) {
		this.rvrecommend = rvrecommend;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	@Override
	public String toString() {
		return "ReviewDto [rvencode=" + rvencode + ", rvmid=" + rvmid + ", rvcomment=" + rvcomment + ", rvrecommend="
				+ rvrecommend + ", rvdate=" + rvdate + "]";
	}
	
	

}
