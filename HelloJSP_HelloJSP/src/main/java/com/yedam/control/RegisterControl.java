package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class RegisterControl implements Control {

	@Override	// 예외처리를 해줘야하는데 try catch 안하고 execute에 예외를 다시 떠넘긴다라는 의미
	public void execute(HttpServletRequest req, HttpServletResponse resp)//
			throws ServletException, IOException {
		// WEB-INF/HTML/register_form.html 이걸 들어갈 수 있게 만들거
		// 페이지를 요청하면 html페이지를 보여주세요 getrequestdispatcher메소드임
		
			// 요청재지정. 제일 상의 경로가 web-inf라서 시작임
			req.getRequestDispatcher("user/register_form.tiles").forward(req, resp);
		
	}

}
