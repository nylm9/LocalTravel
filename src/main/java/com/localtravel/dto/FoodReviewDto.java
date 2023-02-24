package com.localtravel.dto;

public class FoodReviewDto {
	
	private String rvfdcode;
	private String rvmid;
	private String rvcomment;
	private String rvrecommend;
	private String rvdate;

	/* private String rvfdthcode; */

	public String getRvfdcode() {
		return rvfdcode;
	}
	public void setRvfdcode(String rvfdcode) {
		this.rvfdcode = rvfdcode;
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
	/*
	 * public String getRvfdthcode() { return rvfdthcode; } public void
	 * setRvfdthcode(String rvfdthcode) { this.rvfdthcode = rvfdthcode; }
	 */
	@Override
	public String toString() {
		return "FoodReviewDto [rvfdcode=" + rvfdcode + ", rvmid=" + rvmid + ", rvcomment=" + rvcomment
				+ ", rvrecommend=" + rvrecommend + ", rvdate=" + rvdate + "]";
	}
	
	

	
}
