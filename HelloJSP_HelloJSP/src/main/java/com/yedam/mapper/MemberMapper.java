package com.yedam.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO member);	// 등록 insert니까 타입은 int
	public MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);	// 조회
}
