package com.yedam.service;

import java.util.List;

import com.yedam.common.SearchDTO;
import com.yedam.vo.MemberVO;

// 회원관련 업무.
public interface MemberService {
	public boolean addMember(MemberVO member);		// 회원추가
	public MemberVO userCheck(String id, String pw);// 회원확인
	public List<MemberVO> getAllMembers();					// 회원조회
	public int totalCount(SearchDTO search);	// 회원 전체인원
}
