package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DBUtil;
import com.yedam.mapper.ReplyMapper;
import com.yedam.vo.EventVO;
import com.yedam.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{
	
	SqlSession sqlSession = DBUtil.getInstance().openSession();
	ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> replyList(int boardNo, int page) {
		// TODO Auto-generated method stub
		return mapper.replyList(boardNo, page);
	}

	@Override
	public boolean removeReply(int replyNo) {
		int r = mapper.deleteReply(replyNo);
		if( r > 0 ) {
			sqlSession.commit();
			return true;
		}
		return false;
	}

	@Override
	public boolean addReply(ReplyVO reply) {
		int r = mapper.insertReply(reply);
		if( r > 0 ) {
			sqlSession.commit();
			return true;
		}
		return false;
	}

	@Override
	public int replyCount(int boardNo) {
		return mapper.selectCount(boardNo);
	}

	@Override
	public List<EventVO> eventList() {
		// TODO Auto-generated method stub
		return mapper.eventList();
	}

	@Override
	public boolean addEvent(String title, String startDate, String endDate) {
		int r = mapper.insertEvent(title, startDate, endDate);
		if( r > 0 ) {
			sqlSession.commit();
			return true;
		}
		return false;
	}

	@Override
	public boolean removeEvent(String title) {
		int r = mapper.deleteEvent(title);
		if( r > 0 ) {
			sqlSession.commit();
			return true;
		}
		return false;
	}

}
