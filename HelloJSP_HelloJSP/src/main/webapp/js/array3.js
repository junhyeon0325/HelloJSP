/**
 * array3.js 
 */
// 20250805 1433 80점이상인사람만 출력할 수 있도록
let studentAry = [
	{name:"홍길동", score: 80},
	{name:"김민규", score: 85},
	{name:"박흥부", score: 88},
	{name:"김길동", score: 76},
]

// 초기값이 다양하게 변형 가능 지금 아래 코드처럼 문서값이 될 수도 있음 html이 될 수 있다
let results = studentAry.reduce((acc, elem) => {
	let tr = document.createElement('tr');
	for(let prop in elem) {
		let td = document.createElement('td');
		td.innerText = elem[prop];
		tr.appendChild(td);
	}
	acc.appendChild(tr);
	
	return acc;
	
}, document.querySelector('#item tbody'));
//console.log(`최고점자는 ${results.name}, 점수는 ${results.score}점입니다.`);

// 80점 이상인 사람만 출력
let newAry = studentAry.reduce((acc, elem, idx, ary) => {
	if(elem.score >= 80) {
		acc.push(elem);
	}
	return acc;
}, [])
console.log(newAry);

// 연습
let numAry = [10, 15, 34, 77, 20, 25, 30]
// reduce의 첫번째 매개변수, 두번째 매개변수가 acc초기값 / reduce를 이렇게 사용하면 합계산 
let result = numAry.reduce((acc, elem, idx, ary) => {	// acc은 10을 리턴하면 0을 출력하고 15를 리턴하면 10을 리턴한다, 즉 이전순번에서 리턴해준 값이 acc이다. 
	console.log(`${acc}, ${elem}`);
	// acc => [10] 
	if(elem % 2 == 0) {
		acc.push(elem);
	}
	return acc;	// [10, 34]
}, []);
console.log(result);