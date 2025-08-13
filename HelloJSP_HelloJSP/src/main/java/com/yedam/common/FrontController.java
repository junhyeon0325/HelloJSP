package com.yedam.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.control.AddBoardControl;
import com.yedam.control.AddEventControl;
import com.yedam.control.AddReplyControl;
import com.yedam.control.BoardControl;
import com.yedam.control.BoardListControl;
import com.yedam.control.ChartControl;
import com.yedam.control.EventControl;
import com.yedam.control.JSControl;
import com.yedam.control.LoginControl;
import com.yedam.control.LoginFormControl;
import com.yedam.control.LogoutControl;
import com.yedam.control.MemberControl;
import com.yedam.control.MemberListControl;
import com.yedam.control.ModifyBoardControl;
import com.yedam.control.ModifyFormControl;
import com.yedam.control.RegisterControl;
import com.yedam.control.RemoveEventControl;
import com.yedam.control.RemoveReplyControl;
import com.yedam.control.ReplyListControl;
import com.yedam.control.SignFormControl;
import com.yedam.control.SignUpControl;
import com.yedam.control.TotalCntControl;

// init - service - detory
// *.do 로 끝나는 패턴은 다 현재파일 서블릿을 실행되도록 -> 실행할 컨트롤.(조금있다가 컨트롤이라고 쓴이유에대해서)
// frontcontroller 책 뒤에 있다, 너무 늦을까봐 일단 먼저 함
// 요청url === 실행할 컨트롤.

public class FrontController extends HttpServlet{
	
	Map<String, Control> map;
	
	// 생성자
	public FrontController() {
		map = new HashMap<String, Control>();
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		// member 브랜치 수정
		map.put("/member.do", new member());		// 글목록
		

		// member 브랜치 수정2
		map.put("/member.do", new member());		// 글목록

		// product 브랜치 수정
		map.put("/product.do", new product());		// 글목록

		// member 브랜치 수정3
		map.put("/member.do", new member());		// 글목록
		
		map.put("/boardList.do", new BoardListControl());		// 글목록
		map.put("/board.do", new BoardControl());				// 상세화면
		map.put("/register.do", new RegisterControl());			// 등록화면
		map.put("/addBoard.do", new AddBoardControl());			// 등록처리
		map.put("/modifyForm.do", new ModifyFormControl());		// 수정화면
		map.put("/modifyBoard.do", new ModifyBoardControl()); 	// 수정처리
		
		// 회원관련
		map.put("/signForm.do", new SignFormControl());		// 회원가입화면
		map.put("/signup.do", new SignUpControl());	   		// 회원가입처리
		map.put("/loginForm.do", new LoginFormControl());	// 로그인 화면
		map.put("/login.do", new LoginControl());			// 로그인 처리
		map.put("/logout.do", new LogoutControl());			// 로그아웃.
		map.put("/memberList.do", new MemberListControl());	// admin 회원목록
		map.put("/member.do", new MemberControl());			// admin 회원상세화면
		
		// 기타
		map.put("/js.do", new JSControl());		// 자바스크립트 연습
		
		// 댓글관련.
		map.put("/replyList.do", new ReplyListControl()); 		// 글번호 -> 댓글목록.
		map.put("/removeReply.do", new RemoveReplyControl());	// 댓글삭제
		map.put("/addReply.do", new AddReplyControl());			// 글등록
		map.put("/totalReply.do", new TotalCntControl());		// 글등록. bno(파라미터이름) {"totalCnt" : 78}
		
		// 기타
		map.put("/chartData.do", new ChartControl());

		// fullcalender 목록.
		map.put("/eventList.do", new EventControl());	// 이벤트목록.
		map.put("/addEvent.do", new AddEventControl()); // 이벤트등록. {retCode:"OK"/"NG"}
		map.put("/removeEvent.do", new RemoveEventControl());	// 이벤트삭제
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// url vs uri 개념을 구분하면 좋은데
		// http://localhost:8080/HelloJSP/boardList.do => url
		// /HelloJSP/boardList.do					   => uri
		String uri = req.getRequestURI();
		String context = req.getContextPath();	//	/HelloJSP
		String page = uri.substring(context.length());	//	 /boardList.do 등
		
		Control control = map.get(page);	// 페이지를 넣으면 메소드를 반환해주는 get이 해줌
		control.execute(req, resp);		// 안에 execute가 무조건 있으니까 무조건 반환해준거
	}
	
	
	
}
