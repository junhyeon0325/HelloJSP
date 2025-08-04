package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DBUtil;
import com.yedam.common.SearchDTO;
import com.yedam.mapper.MemberMapper;
import com.yedam.vo.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	SqlSession sqlSession = DBUtil.getInstance().openSession();
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public boolean addMember(MemberVO member) {
		int r = mapper.insertMember(member);
		if (r > 0) {
			sqlSession.commit();
			return true; // 정상등록
		}
		return false; // 비정상처리
	}

	@Override
	public MemberVO userCheck(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
	public List<MemberVO> memberList(SearchDTO search) {
		return mapper.selectMemberList(search);
	}
	
	@Override
	public int totalCount(SearchDTO search) {
		return mapper.selectMemberCount(search);
	}
	
}
