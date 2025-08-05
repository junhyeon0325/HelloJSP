/**
 * object.js 
 */

//console.log(members);

console.log(members[0]);

for (let member of members) {	
	//let member = members[0]; // {id:?, fn:?, ln:?......}
	//let id = member.id;								// 요방식은 옛날 방식 최근에 나온 밑에방식으로 이용
	//let first_name = member.first_name;
	
	let { id, first_name, last_name, email } = member;	//디스트럭처링을 이용한 방법, 교과서 페이지 92p
	console.log(`${id}, ${first_name}, ${last_name}`);
	
	let tr = document.createElement('tr');
	// 속성값 안에 있는 값을 가져오는 방법은 2가지가 있는데 : member.id, member['id'] 요렇게 대괄호를 이용해서 가져올 수 있다. 아래쪽에 표현해놓음  
	// for .. in .. 반복문
	for (let prop in member) {	// member에 있는 속성값을 prop에 넣음
		console.log(`속성: ${prop}, 값: ${member[prop]}`);
		if(prop == 'gender') {
			if(member[prop] == 'Female') {
				tr.style.backgroundColor = 'pink';
			} else if(member[prop] == 'Male') {
				tr.style.backgroundColor = 'yellow';
			}
		}
		let td = document.createElement('td');
		td.innerText = member[prop];	// <td>Mesh</td>
		tr.appendChild(td);	
	} // end of for in..
	
	// 삭제버튼. <td><button>삭제</button></td>
	let td = document.createElement('td');
	let btn = document.createElement('button');
	// 이벤트&이벤트핸들러
	btn.addEventListener('click', (e) => {
		console.dir(e.target.parentElement.parentElement);
		let parent = e.target.parentElement.parentElement;
		console.log(parent.children);
		let fn = parent.children[1].innerText;
		let ln = parent.children[2].innerText;
		
		if(confirm(`${fn} ${ln}을 삭제하겠습니까?`)) {
			e.target.parentElement.parentElement.remove();	// 내가 누른 버튼값을 반환해줌
		}
	})
	btn.innerText = '삭제';
	td.appendChild(btn);
	tr.appendChild(td);
	
	document.querySelector('#show tbody').appendChild(tr);
} // end of for of..

let sum = 0;
document.querySelectorAll('#show tbody tr td:nth-of-type(6)').forEach(elem => sum += parseInt(elem.innerText));
console.log(`합계는 ${sum}`);