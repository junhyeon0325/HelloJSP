package com.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.common.SearchDTO;
import com.yedam.vo.MemberVO;

public interface MemberMapper {
	public int insertMember(MemberVO member);	// 등록 insert니까 타입은 int
	public MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);	// 조회
	public List<MemberVO> selectMemberList(SearchDTO search);	// 조회
	public int selectMemberCount(SearchDTO search);
	public MemberVO selectSearchMember(String mid);
}
