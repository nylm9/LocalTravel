package com.localtravel.dto;

import lombok.Data;

@Data
public class TRStationDto {
	private String nodeid;
	private String nodename;
	private String nocitycode;
	public String getNodeid() {
		return nodeid;
	}
	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}
	public String getNodename() {
		return nodename;
	}
	public void setNodename(String nodename) {
		this.nodename = nodename;
	}
	public String getNocitycode() {
		return nocitycode;
	}
	public void setNocitycode(String nocitycode) {
		this.nocitycode = nocitycode;
	}
	
	
}
