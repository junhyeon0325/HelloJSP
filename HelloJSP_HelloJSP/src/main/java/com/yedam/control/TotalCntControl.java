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

public class TotalCntControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 파라미터 bno를 가져와서 서비스를통해서 카운트가 나올거고 그걸로 {"totalCnt" : 78} json형태로 출력
		
		// param: bno=?
		String bno = req.getParameter("bno");
		
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyService rs = new ReplyServiceImpl();
		
		int cnt = rs.replyCount(Integer.parseInt(bno));
		map.put("totalCnt", cnt);			
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);	// 자바객체 -> json문자열.
		resp.getWriter().print(json);	// 출력
	}

}
