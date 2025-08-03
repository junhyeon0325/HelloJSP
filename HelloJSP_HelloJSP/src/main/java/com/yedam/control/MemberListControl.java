package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.service.MemberService;
import com.yedam.service.MemberServiceImpl;
import com.yedam.vo.MemberVO;

public class MemberListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		MemberService svc = new MemberServiceImpl();
		
		List<MemberVO> list = svc.getAllMembers();
				
		req.setAttribute("member_list", list);
		
		req.getRequestDispatcher("manager/member_list.tiles").forward(req, resp);
	}

}
