package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jang.hjk.mapper.MemberMapper;
import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Post;

@Service(value= "memberService")
public class MemberService {

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	public List<Member> getManagerAll() {
		System.out.println("MemberService" + "getManagerAll()");
		return this.memberMapper.getMemberAll();
	}
	
	public List<Member> getMemberAll(){
		System.out.println("MemberService" + "getMemberAll()");
		return this.memberMapper.getMemberAll();
	}
	
	public Member getMember(String userId, String password){
		System.out.println("MemberService" + "getMember(String userId, String password)");
		return memberMapper.findMember(userId, password);
	}
	
	public Member idSearch(String m_name, String m_phone){
		System.out.println("MemberService" + "idSearch(String m_name, String m_phone)");
		return memberMapper.idSearch(m_name, m_phone);
	}
	
	public Member pwSearch(String m_id, String m_name, String m_phone){
		System.out.println("MemberService" + "pwSearch(String m_id, String m_name, String m_phone)");
		return memberMapper.pwSearch(m_id,m_name, m_phone);
	}
	
	public void insert(Member member){
		System.out.print("LoginService들어왔니???????????");
		this.memberMapper.insert(member);
	}
	
	public List<Post> getPost(String dong) {
		// 우편번호 찾기
		System.out.println("우편번호찾는 서비스 => " + dong);
		return this.memberMapper.getPost(dong);
	}
	
	public int checkid(String m_id){
		System.out.println("Service checkid==>" + m_id);
		return this.memberMapper.checkid(m_id);
	}
	
	public Manager findManager(String ma_id, String ma_pass){
		System.out.println("MemberService" + "findManager(String ma_id, String ma_pass)");
		return memberMapper.findManager(ma_id, ma_pass);
	}
	
	public int findMemberNum(String memberId) {
		System.out.println("MemberService" + "findMemberNum(String memberId)" + memberId);
		int memberNum = memberMapper.findMemberNum(memberId);
		System.out.println("MemberService" + "회원번호 찍히나?" + memberNum);
		return memberNum;
	}
	
	public Member findMemberInfo (String memberId){
		System.out.println("MemberService" + "findMemberInfo (String memberId)");
		return memberMapper.findMemberInfo(memberId);
	}
	
	public void updateMember(Member member){
		System.out.println("MemberService" + "updateUser(Member member)" + member.getM_id());
		this.memberMapper.updateMember(member);
	}
	
	public void deleteMember(Member member){
		System.out.println("MemberService" + "deleteMember(Member member)" + member.getM_id());
		this.memberMapper.deleteMember(member);
	}

}
