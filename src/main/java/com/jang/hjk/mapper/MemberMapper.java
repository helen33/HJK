package com.jang.hjk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Post;
import com.jang.hjk.model.Zip;

//회원, 우편번호		---> 마이페이지
@Repository(value = "memberMapper")
public interface MemberMapper {
	
	List<Member> getMemberAll(); // 회원정보불러오기
	List<Post> getPost(String dong); // 우편번호 찾기
	
	Member findMember(@Param(value="userId")String userId, @Param(value="password")String password); // 로그인
	Member idSearch(@Param(value="m_name")String m_name, @Param(value="m_phone")String m_phone); // 아이디 찾기
	Member pwSearch(@Param(value="m_id")String m_id, @Param(value="m_name")String m_name, @Param(value="m_phone")String m_phone); // 비밀번호 찾기
	int findMemberNum(String memberId); // 세션으로 회원번호 찾기
	Member findMemberInfo(String memberId); // 세션으로 회원정보 찾기
	
	void insert(Member member); // 회원가입
	void updateMember(Member member); // 회원정보 수정
	void deleteMember(Member member); // 회원 탈퇴
	
	int checkid(@Param(value="m_id")String m_id); //중복확인
	Manager findManager(@Param(value="ma_id")String ma_id, @Param(value="ma_pass")String ma_pass); // 관리자 로그인

}
