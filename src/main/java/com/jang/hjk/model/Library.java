package com.jang.hjk.model;

public class Library {

	
	private int l_num; // 자료실번호
	private int ma_num; // 관리자번호
	private String l_name; // 제목
	private String l_file; // 첨부파일
	private String l_content; // 내용
	private String l_reg; // 작성일
	private int l_hits; // 조회수
	
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public int getMa_num() {
		return ma_num;
	}
	public void setMa_num(int ma_num) {
		this.ma_num = ma_num;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_file() {
		return l_file;
	}
	public void setL_file(String l_file) {
		this.l_file = l_file;
	}
	public String getL_content() {
		return l_content;
	}
	public void setL_content(String l_content) {
		this.l_content = l_content;
	}
	public String getL_reg() {
		return l_reg;
	}
	public void setL_reg(String l_reg) {
		this.l_reg = l_reg;
	}
	public int getL_hits() {
		return l_hits;
	}
	public void setL_hits(int l_hits) {
		this.l_hits = l_hits;
	}
	
	
}
