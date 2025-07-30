package com.yedam.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.common.SearchDTO;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.BoardVO;

public class BoardListControl implements Control{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("글목록 컨트롤.");

		// 파라미터 (page&searchCondition&keyword) 파라미터가 안넘어오면 1페이지로
		String page = req.getParameter("page");
		String sc = req.getParameter("searchCondition");
		String kw = req.getParameter("keyword");
		
		page = page == null ? "1" : page;
		
		// SearchDTO (메소드에 전달할 파라미터)
		SearchDTO search = new SearchDTO();
		search.setPage(Integer.parseInt(page));
		search.setSearchCondition(sc);
		search.setKeyword(kw);
		
		// WEB-INF/html/register_form.html
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList(search);	// 글목록 가져오는 카운트
		
		// 페이징
		int totlaCnt = svc.totalCount(search);
		PageDTO paging = new PageDTO(Integer.parseInt(page), totlaCnt);
		
		// jsp(뷰역할) 페이지에 데이터 전달.
		req.setAttribute("board_list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("searchCondition", sc);
		req.setAttribute("keyword", kw);
		
		// 요청재지정
		req.getRequestDispatcher("WEB-INF/html/board_list.jsp").forward(req, resp);		// 전달하는데 forward라는 메소드를 호출하고 실제 페이지가 열린다 거기에 req resp를 전달
	}
	
}
