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
import com.yedam.vo.EventVO;

// 이벤트 등록, fullcalenda에 일정 등록
public class AddEventControl implements Control {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		// 파라미터 받기
		String title = req.getParameter("title");
		String start = req.getParameter("start");
		String end = req.getParameter("end");
		
		// 파라미터로 받은 데이터드을 EventVO객체 만들어서 evo에 대입
		EventVO evo = new EventVO();
		evo.setTitle(title);
		evo.setStart(start);
		evo.setEnd(end);
		
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyService svc = new ReplyServiceImpl();
		
		if(svc.addEvent(evo)) {
			map.put("retCode", "OK");
			map.put("retVal", evo);
		} else {
			map.put("retCode", "NG");
		}
		
		/*	map.put("title", '''') // 이런방법도 있으시다고 하셨음
		try {
			svc.addEvent(map);
			resp.getWriter().print("{\"retCode\":\"OK\"}");
		} catch (Exception e) {
			resp.getWriter().print("{\"retCode\":\"NG\"}");
		}*/
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);	// 자바객체 -> json문자열.
		resp.getWriter().print(json);	// 출력
	}

}
