package com.yedam.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.service.ReplyService;
import com.yedam.service.ReplyServiceImpl;
import com.yedam.vo.ReplyVO;

public class AddReplyControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		// param: addRply.do?bno=?&reply=?&replyer=?
		String bno = req.getParameter("bno");
		String reply = req.getParameter("reply");
		String replyer = req.getParameter("replyer");
		
		// addReply(ReplyVO reply)
		ReplyVO rvo = new ReplyVO();
		rvo.setBoardNo(Integer.parseInt(bno));
		rvo.setReply(reply);
		rvo.setReplyer(replyer);
		
		//retCode, bno, reply, replyer => Map<키, 값>
		Map<String, Object> map = new HashMap<String, Object>();	// Map은 인터페이스고 HashMap은 다 포함하는
		
		// DB처리 => 반환
		ReplyService svc = new ReplyServiceImpl();
		if(svc.addReply(rvo)) {
			map.put("retCode", "OK");	// map이게 자바 객체 문자열로 만들어주는 Gson이 가지고 있다
			map.put("retVal", rvo);
			//resp.getWriter().print("{\"retCode\":\"OK\"}");
		} else {
			map.put("retCode", "NG");
			//resp.getWriter().print("{\"retCode\":\"NG\"}");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);	// 자바객체 -> json문자열.
		resp.getWriter().print(json);	// 출력
	}

}
