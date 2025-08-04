/**
 * 
 */
const fruits = ['apple','banana','cherry']; // new Array();
fruits[3] = 'orange';

// 추가, 삭제
fruits.push('melon');
fruits.unshift('mango');	// 가장 앞쪽에 추가하는 unshift
fruits.pop();	// melon제거, 가장 마지막부터 제거함
fruits.pop();	// orange제거
fruits.shift();		// mango제거
fruits.shift();		// apple제거

for (let fruit of fruits){	// 반복문 fruits배열에 있는 과일들을 fruit에 넣어서 하나하나 출력
	console.log(fruit);
}


const members = [{id:'user01', name:'Hong', point: 100}];	// 객체를 담는 방법
members.push({id:'user02', name: 'Park', point: 120});
members.push({id:'user03', name: 'Kim', point: 90});

for(let i = 0; i < members.length; i++) {
	if (members[i].point >= 100)
		console.log(`id: ${members[i].id}, name: ${members[i].name}, point: ${members[i].point}`);
}

// 화면에 배열의 갯수만큼 회원정보를 출력하는 함수
function showList() {
	// 반복문. forEach
	members.forEach( (elem, idx, ary) => {	// function없애고 화살표 함수로 바꿈
		let str = `<li>아이디: ${elem.id}, 이름: ${elem.name}, 포인트: ${elem.point}</li>`;
		// ul 요소
		document.querySelector('#list').innerHTML += str;
	});	// 배열 매소드, 매개값으로 함수를 받는다.
}	// end of showList
showList();

// 이벤트, 버튼을 클릭했을때 발생하는 이벤트function()
// 버튼을 눌렀을때 입력칸이 빈공간이면 알림창이 뜨거나 입력을 했으면 입력값이 아래에 출력되는 함수
document.querySelector('#addBtn').addEventListener('click', () => {		// function없애고 화살표 함수로 바꿈
	
	// 버튼이 눌렸을때 #mid태그의 값을 id, name, point에 넣고
	let id = document.querySelector('#mid').value;
	let name = document.querySelector('#mname').value;
	let point = document.querySelector('#point').value;
	
	// 필수값을 입력하세요!! 칸이 빈공간이면 필수값을 입력하라는 알림창이 뜸
	if(id == '' || name == '' || point == ''){
		window.alert('필수값을 입력하세요!!');
		return
	}
	
	// 초기화를 안해주면 계속 반복해서 찍히니까 초기화를 해주는거
	document.querySelector('#list').innerHTML = '';	// 초기화
	
	// 앞서 넣은 값들을 배열에 추가
	members.push({id: id, name: name, point: point})

	showList();
	
	// 입력값 초기화
	id = document.querySelector('#mid').value = '';
	name = document.querySelector('#mname').value = '';
	point = document.querySelector('#point').value = '';
})		// document.querySelector('#addBtn')요게 객체인데 요 객체가 가지고 있는 메소드가 addEventListener

