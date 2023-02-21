package com.localtravel.dto;

public class LikeFoodBtnDto {
	private String lbfcode;
	private String lbfmid;
	public String getLbfcode() {
		return lbfcode;
	}
	public void setLbfcode(String lbfcode) {
		this.lbfcode = lbfcode;
	}
	public String getLbfmid() {
		return lbfmid;
	}
	public void setLbfmid(String lbfmid) {
		this.lbfmid = lbfmid;
	}
	@Override
	public String toString() {
		return "LikeFoodDto [lbfcode=" + lbfcode + ", lbfmid=" + lbfmid + "]";
	}

}
