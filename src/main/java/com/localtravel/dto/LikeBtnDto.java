package com.localtravel.dto;

public class LikeBtnDto {
	private String lecode;
	private String lfcode;
	private String lename;
	private String lfname;
	private String leaddr;
	private String lfaddr;
	@Override
	public String toString() {
		return "LikeBtnDto [lecode=" + lecode + ", lfcode=" + lfcode + ", lename=" + lename + ", lfname=" + lfname
				+ ", leaddr=" + leaddr + ", lfaddr=" + lfaddr + "]";
	}
	public String getLecode() {
		return lecode;
	}
	public void setLecode(String lecode) {
		this.lecode = lecode;
	}
	public String getLfcode() {
		return lfcode;
	}
	public void setLfcode(String lfcode) {
		this.lfcode = lfcode;
	}
	public String getLename() {
		return lename;
	}
	public void setLename(String lename) {
		this.lename = lename;
	}
	public String getLfname() {
		return lfname;
	}
	public void setLfname(String lfname) {
		this.lfname = lfname;
	}
	public String getLeaddr() {
		return leaddr;
	}
	public void setLeaddr(String leaddr) {
		this.leaddr = leaddr;
	}
	public String getLfaddr() {
		return lfaddr;
	}
	public void setLfaddr(String lfaddr) {
		this.lfaddr = lfaddr;
	}

}
