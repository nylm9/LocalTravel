package com.localtravel.dto;

public class LikeBtnDto {
	private String lbcode;
	private String lbmid;

	
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

	@Override
	public String toString() {
		return "LikeBtnDto [lbcode=" + lbcode + ", lbmid=" + lbmid + "]";
	}


	


}
