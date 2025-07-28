package com.yedam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;

@WebServlet("/DeleteBoard")
public class DeleteBoardServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); // 웹브라우저의 컨텐츠타입.

		BoardService svc = new BoardServiceImpl();

		String board_no = request.getParameter("board_no"); // "3"
		int bno = Integer.parseInt(board_no); // "23" -> 23

		if (svc.removeBoard(bno)) {
			// 목록.
			response.sendRedirect("BoardListServlet");
		} else {
			System.out.println("에러발생."); // 에러페이지(jsp)
		}

	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("DeleteBoardServlet doGet메소드 호출");
		doPost(request, response);
	}

}
