package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class MemberControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String mid = req.getParameter("mid");
		String page = req.getParameter("page");
		
		MemberService svc = new MemberServiceImpl();
		MemberVO member = svc.searchMember(mid);
		
		req.setAttribute("member_info", member);
		req.setAttribute("page", page);
		
		req.getRequestDispatcher("manager/member.tiles").forward(req, resp);
	}

}
