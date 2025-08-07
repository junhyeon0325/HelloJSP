/**
 * boardService.js 
 */
class PageVO {
	
	// 생성자.
	constructor(currPage, totalCnt) {
		this.currPage = currPage;	// currPage 필드서넌.
		this.totalCnt = totalCnt;	// totalCnt 필드서넌.
		// start, end 계산.
		this.end = Math.ceil(currPage / 10) * 10;	// ceil올림 만약에 10page면
		this.start = this.end - 9;					// start는 1page
		// realEnd 계산
		let realEnd = Math.ceil(totalCnt / 5);	// 3page 
		this.end = this.end > realEnd ? realEnd : this.end;	
		//prev, next 계산
		this.prev = this.start > 1;		// 이전페이지가 있는지 없는지
		this.next = this.end < realEnd;	// 다음페이지가 있는지 없는지
		
	}
}
//console.log(new PageVO());


const svc = {
	count: 20, // 속성(property)
	increaseCount: function() {	// 메소드
		this.count++;
	},
	showCount() {	// 메소드
		return this.count;
	},
	// 목록ajax메소드.
	replyList(param = { bno: 1, page: 1 }, successCallback, errorCallback) {
		fetch('replyList.do?bno=' + param.bno + '&page=' + param.page)
			.then(resolve => resolve.json())
			.then(successCallback)
			.catch(errorCallback)
	},
	// 삭제ajax 메소드.
	removeReply(rno, successCallback, errorCallback) {
		fetch('removeReply.do?rno=' + rno)
			.then(resolve => resolve.json())
			.then(successCallback)
			.catch(errorCallback)
	},
	// 등록ajax 메소드
	registerReply(param = { bno, reply, replyer }, successCallback, errorCallback) {
		fetch('addReply.do?bno=' + param.bno + '&reply=' + param.reply + '&replyer=' + param.replyer)
			.then(resolve => resolve.json())
			.then(successCallback)
			.catch(errorCallback)
	},
	// bno에 대한 전체 건수 얻는 ajax메소드
	replyTotalCount(bno, successCallback, errorCallback) {
		fetch('totalReply.do?bno=' + bno)
			.then(resolve => resolve.json())
			.then(successCallback)
			.catch(errorCallback)
	}
}