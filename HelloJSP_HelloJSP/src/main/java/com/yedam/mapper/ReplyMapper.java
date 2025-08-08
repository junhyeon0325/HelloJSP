package com.yedam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.vo.EventVO;
import com.yedam.vo.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> replyList(@Param("boardNo") int boardNo, @Param("page") int page);	// 목록.
	int deleteReply(int replyNo);	// 삭제. insert update delete는 int값이다 정해져있다
	int insertReply(ReplyVO reply);	// 등록
	int selectCount(int boardNo); 	// 댓글건수계산.
	
	// fullcalendar 목록, 추가, 삭제 -> mapper.xml에 추가
	List<EventVO> eventList();	// 목록
	int insertEvent(EventVO evo);	// 등록
	int deleteEvent(EventVO evo);	// 삭제
}
