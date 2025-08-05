/**
 * array2
 * filter 배열메소드.
 * 요소의 값 -> true일 때 그 요소를 새로운 배열에 생성. 
 */

function makeRow(member) {
	// tr>td*7 기능.
	let tr = document.createElement('tr');
	// 속성값 안에 있는 값을 가져오는 방법은 2가지가 있는데 : member.id, member['id'] 요렇게 대괄호를 이용해서 가져올 수 있다. 아래쪽에 표현해놓음  
	// for .. in .. 반복문
	for (let prop in member) {	// member에 있는 속성값을 prop에 넣음
		let td = document.createElement('td');
		td.innerText = member[prop];	// <td>Mesh</td>
		tr.appendChild(td);
	} // end of for in..

	// 삭제버튼. <td><button>삭제</button></td>
	let td = document.createElement('td');
	let btn = document.createElement('button');
	// 이벤트&이벤트핸들러
	btn.addEventListener('click', (e) => {
		let parent = e.target.parentElement.parentElement;
		let fn = parent.children[1].innerText;
		let ln = parent.children[2].innerText;

		if (confirm(`${fn} ${ln}을 삭제하겠습니까?`)) {
			e.target.parentElement.parentElement.remove();	// 내가 누른 버튼값을 반환해줌
		}
	})
	btn.innerText = '삭제';
	td.appendChild(btn);
	tr.appendChild(td);
	return tr;
}

// 급여가 7000 이상인 사람들을 목록. A -> A 매핑
members.filter(elem => elem.salary >= 7000)		// 7000이상인 사람들을 새로 배열을 만들고
    .filter(elem => elem.gender == 'Female')
	.map(elem => {
		let {id, first_name, last_name, salary} = elem;		// elem에는 {id,fn,ln,email,gender,salary}가 있는데 그중에 필요한거만 보여줄려고함
		let obj = {id, first_name, last_name, salary}		// 이렇게 정보의 변환이 일어나면 매핑이라고한다. !important
//		let obj = {id: id, first_name: first_name, last_name: last_name, salary: salary} 원레 이거인데 js가 편하게 같으면 위로 적어도 되게 만듬
		return obj;
	})		// 새로운 배열을 반환해줌	
	.forEach(elem => document.querySelector('#show tbody').appendChild(makeRow(elem))	// 위에 새로 만든 배열로 반복문 forEach를 돌려서 표를만들고 그 만든거를 tbody에 넣은거
);









let result = [10, 20, 30, 40, 50].filter((elem, idx, array) => {
	if (elem >= 30) {
		return true;
	}
});
console.log(result);