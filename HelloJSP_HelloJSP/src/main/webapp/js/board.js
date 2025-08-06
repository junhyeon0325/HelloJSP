/**
 * board.js
 * 144 댓글 정보 => json 반환.
 */

let page = 1;// page 변경

// 페이지가 로딩되면 바로 실행되는 규칙
function showReplyList() {
	// 기존목록을 지우고... 새로운 목록을 그릴 수 있게 해야함
	document.querySelectorAll('div.content>ul>li').forEach((elem, idx) => {
		if(idx >= 2) {
			elem.remove();
		}
	});
	svc.replyList({ bno, page }, // 첫번째 param
		result => {
			result.forEach(reply => {
				let li = makeRow(reply);
				document.querySelector('div.content>ul').appendChild(li);	// div.content>ul 꺽쇠괄호가 없이 div.content ul요런 형태면 div밑에 있는 모든 ul을 가리키는 것이다
			})
		}, // 두번째 param.
		err => console.error(err)	// 세번째 param
	);
} // end of showReplyList().
showReplyList();	// 최초목록을 그려줘야하니까 최초목록 출력.

// 이벤트 등록.
document.querySelector('#addReply').addEventListener('click', function(e) {
	// 게시글번호(bno)/ 작성자(logId)/ 댓글(reply)
	let reply = document.querySelector('#reply').value;
	if (!bno || !reply || !logId) { // true/false => 거짓처럼 여기는 값 falsy(0, '', null, undefined) 거짓스럽다라고 말함
		alert('필수값을 입력');
		return;	// 아래 코드값을 실행 안하게 하는거, 함수종료
	}

	svc.registerReply({ bno, reply, replyer: logId },
		result => {
			if (result.retCode == 'OK') {
				let r = result.retVal;
				let li = makeRow(r);
				document.querySelector('div.content>ul').appendChild(li);
			} else if (result.retCode == 'NG') {
				alert('처리중 예외발생.')
			} else {
				alert('알수 없는 코드')
			}
		},
		err => console.error(err)
	);
});

// 페이징 링크에 클릭이벤트.
document.querySelectorAll('div.footer>div.pagination>a').forEach(atag => {
	atag.addEventListener('click', e => {
		e.preventDefault();	// 기본기능을 막겠습니다. 차단. submit안하겠습니다 a링크를 안하겠습니다.
		page = e.target.innerText;
		// 목록그려주기.
		showReplyList();
		
	})

})


function makeRow(reply) {
	let li = document.createElement('li');
	['replyNo', 'reply', 'replyer'].forEach(elem => {
		let span = document.createElement('span');
		span.innerText = reply[elem];
		if (elem == 'reply') {
			span.setAttribute('class', 'col-sm-5');
		} else {
			span.setAttribute('class', 'col-sm-2');
		}
		li.appendChild(span);
	})// 반복.
	// 삭제버튼.
	let span = document.createElement('span');
	span.setAttribute('class', 'col-sm-2');
	let btn = document.createElement('button');
	btn.addEventListener('click', deleteRowFnc);	// deleteRowFnc정의구문만 쓰는거, 어짜피 이벤트리스너가 실행하라고 하는거니까 따로()를 해서 매개변수를 넘겨주는게 아님
	btn.innerText = '삭제';
	span.appendChild(btn);
	li.appendChild(span);
	return li;
} // end of makeRow

// 데이터 삭제 이벤트 핸들러.
function deleteRowFnc(e) {
	// 여기서 e는 event
	let rno = e.target.parentElement.parentElement.children[0].innerText;
	console.log(rno);
	if (!confirm(`${rno}번 댓글을 삭제하겠습니까?`)) {		// !를 붙인이유는 true값을 false값으로 변환할려고 
		alert('삭제를 취소했습니다.');
		return;
	}
	// fetch 서버프로그램 호출.
	svc.removeReply(rno,
		result => {
			if (result.retCode == 'OK') {		// return code가 
				e.target.parentElement.parentElement.remove();
			} else if (result.retCode == 'NG') {
				alert('삭제실패!!');
			} else {
				aleft('알수없는 코드입니다.');
			}
		}, err => console.error(err)
	)
} // end of deleteRowFnc