package com.jang.hjk.model;

import java.sql.Timestamp;

public class Member {

	private int m_num; // 회원번호
	private String m_name; // 이름
	private String m_id; // 아이디
	private String m_pass; // 비밀번호
	private String m_phone; // 휴대폰
	private String m_birth; // 생년월일
	private String m_addr; // 상세주소
	private String m_email; // 이메일
	private Timestamp m_reg; // 가입일
	private String zip_code; // 우편번호
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public Timestamp getM_reg() {
		return m_reg;
	}
	public void setM_reg(Timestamp m_reg) {
		this.m_reg = m_reg;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	
	
}
