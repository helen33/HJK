package com.jang.hjk.model;

import java.sql.Timestamp;

public class Comments {

	private int cmt_num;
	private int q_num;
	private String cmt_id;
	private Timestamp cmt_reg;
	public int getCmt_num() {
		return cmt_num;
	}
	public void setCmt_num(int cmt_num) {
		this.cmt_num = cmt_num;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getCmt_id() {
		return cmt_id;
	}
	public void setCmt_id(String cmt_id) {
		this.cmt_id = cmt_id;
	}
	public Timestamp getCmt_reg() {
		return cmt_reg;
	}
	public void setCmt_reg(Timestamp cmt_reg) {
		this.cmt_reg = cmt_reg;
	}
	
	
}
