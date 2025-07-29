package com.yedam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

//import org.apache.ibatis.session.SqlSession;
//
//import com.yedam.service.BoardService;
//import com.yedam.service.BoardServiceImpl;
//import com.yedam.vo.BoardVO;
// Controleer자체도 하나의 데이터 타입임
interface Controller {
	public void exe(); // 추상메소드
}

class Sample implements Controller {
	public void exe() {
		System.out.println("Sample 클래스");
	}
}

public class Main {
	public static void main(String[] args) {

//		BoardService svc = new BoardServiceImpl(); // 업무기능.
//
//		int searchNo = 1;
//
//		// 조회. 조회수증가. => 업무(조회: 글번호조회 + 조회카운트)
//		BoardVO board = svc.searchBoard(searchNo);
//
//		System.out.println(board.toString());

		ArrayList<Book> list = new ArrayList<>();
//		Book book = list.get(0);

		// 키=값 쌍으로 담을수 있다 키에해당하는 데이타타입은 String, value 에는 integer가 와야함
		// Map는 인터페이스
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("홍길동", 80);
		map.put("박길동", 78);
//		map.put(200, 22);	이럼 안됨

		// list get에는 index번호를 넣었는데 map은 키를 넣어주면 값이 반환됨
		Integer result = map.get("홍길동");
		System.out.println(result);

		// new 하고 <>안에 적어줘도 되고 안적어줘도 되고 알아서 채워줌
		Map<String, Controller> controls = new HashMap<String, Controller>();
		controls.put("abc.do", new Sample());
		controls.put("ddc.do", new Controller() {
			@Override
			public void exe() {
				System.out.println("Test입니다.");
			}
		});
		
		Controller val = controls.get("Sample");
		val.exe();
		
	}
}
