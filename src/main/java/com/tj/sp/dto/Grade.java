package com.tj.sp.dto;

public class Grade {
	private String gcode	;
	private String grade	;
	private int    ghigh	;
	private int    glow		;
	private int    gpoint	;
	public Grade() {}
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getGhigh() {
		return ghigh;
	}
	public void setGhigh(int ghigh) {
		this.ghigh = ghigh;
	}
	public int getGlow() {
		return glow;
	}
	public void setGlow(int glow) {
		this.glow = glow;
	}
	public int getGpoint() {
		return gpoint;
	}
	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}
	@Override
	public String toString() {
		return "Grade [gcode=" + gcode + ", grade=" + grade + ", ghigh=" + ghigh + ", glow=" + glow + ", gpoint="
				+ gpoint + "]";
	}
	
}
