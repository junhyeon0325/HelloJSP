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

public class RemoveEventControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String title = req.getParameter("title");
		
		EventVO evo = new EventVO();
		evo.setTitle(title);
		
		Map<String, Object> map = new HashMap<String, Object>();
		ReplyService svc = new ReplyServiceImpl();
		
		if(svc.removeEvent(evo)) {
			map.put("retCode", "OK");
			map.put("retVal", evo);
		} else {
			map.put("retCode", "NG");
		}
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json = gson.toJson(map);	// 자바객체 -> json문자열.
		resp.getWriter().print(json);	// 출력

	}

}
