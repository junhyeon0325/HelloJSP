package com.yedam.common;

import lombok.Data;

// 페이징정보.
//
// 
@Data
public class PageDTO {
	
	private int currPage;	// 현재페이지.
	private int start, end; // 시작, 끝페이지
	private boolean previous, next;	// 이전, 이후 여부를 계산해서 담아두기 위해서
	
	// 생성자 현재페이지를 기준으로 현재페이지에 넣고 스타트와 엔드를 계산 1페이지부터 10페이지까지 보여주겠습니다 라는거
	public PageDTO(int page, int totalCnt) {
		currPage = page;	// 1 ...   3  ...   10
		end = (int) Math.ceil(page * 1.0 / 10) * 10;	// end먼저 계산하는게 편해서 먼저 구함 1.0을 곱해서 double타입으로 변경 3을 넣으면 0.3을 ceil올림 그럼1 거기에 10곱해서 10 end=10
		start = end - 9;	// 스타트는 1이 시작이니까 end에서 9를 뺌
		
		// 실제 마지막 페이지 값을 구해야한다, 만약에 3페이지밖에
		int realEnd = (int) Math.ceil(totalCnt * 1.0 / 5);
		end = end > realEnd ? realEnd : end;	// end가 realEnd보다 크다면 realEnd값을 end에 넣어주고 작다면 end값을 그대로 출력, 만약 문서가 13개야 그럼 realEnd는 3이고 end는 10이지 그러니까 현재 페이지는 realEnd값이 반환되니까 3페이지만 출력
		
		// 이전, 이후
		previous = start > 1;	// start가 1보다 크면은 이전페이지가(11, 21, 31)있다는 거 true가 반환
		next = end < realEnd;	// 10보다 크다는건 다음페이지가 있다는거니까
	}
}
