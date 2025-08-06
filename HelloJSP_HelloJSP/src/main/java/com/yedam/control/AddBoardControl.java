package com.yedam.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.yedam.common.Control;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.BoardVO;

public class AddBoardControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		// key=value + 파일 => 처리. (파일이 이진값 구성되어있는 표현이 그레되면 안되니까 일반 파일로 처리로 해야하니까) 기존 형식으로는 처리를 못해줌
		// cos.jar 활용해서 Multipart요청을 처리. 해주는 라이브러리를 활용할거다
		// 게시글 DB Insert.
		
		// 서버상의 upload 폴더에 저장
		String upload = req.getServletContext().getRealPath("upload");	// upload파일의 전체 경로가 upload에 들어감
		System.out.println(upload);
		
		MultipartRequest mr = new MultipartRequest(
				req,	// 요청정보
				upload, // 업로드 경로
				1024 * 1024 * 5,	// 최대 업로드 할 수 있는 파일 크기 너무 크면 사이트의 리소스가 부족해질 수 있음
				"UTF-8",	// 인코딩 방식 설정
				new DefaultFileRenamePolicy()	// 리네임정책 (동일한 파일 이름이 있으면 안되니까) 
				);
		
		// addBoard.do?title=???&Writer=???&content=????
		String title = mr.getParameter("title");
		String writer = mr.getParameter("writer");
		String content = mr.getParameter("content");
		String img = mr.getFilesystemName("images");	// 파일이름 filesystemName이라는 메소드를 통해서 가져와야함

		//
		BoardVO param = new BoardVO();
		param.setTitle(title);
		param.setContent(content);
		param.setWriter(writer);
		param.setImage(img);

		BoardService svc = new BoardServiceImpl();
		if (svc.registerBoard(param)) {	
			// 목록이동
			resp.sendRedirect("boardList.do");
		} else {
			System.out.println("에러발생.");
		}
	} // end of execute
}
