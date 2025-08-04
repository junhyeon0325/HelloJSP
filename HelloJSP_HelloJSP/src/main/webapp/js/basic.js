/**
 * 
 */

console.log("basic");

//var name = 'Hong';	// 변수선언

//name = 'Hwang';	// 새로운 값을 대입

//var name = 'Park';	//
//console.log(name);

let name = 'Kim';	// let으로 같은이름으로 선언하면 오류남, 그래서 변수의 선언은 한번만 선언해라. / 반대로 var는 같은이름으로 선언하면 오류 안남 / let을 최대한 써라
const age = 20;		// 상수
//age = 30;

// Object 타입 선언
const obj = new Object();	// {}
obj.name = 'Hong';	// name속성
obj.age = 20;	// age속성
obj.info = function () {
	console.log('이름은 ' + obj.name + ', 나이는 ' + obj.age);
}
obj.hobbies = ['독서','수영','자전거'];
obj.pets = [{name: '야옹이', age: 2}, {name: '멍멍이', age: 3}];

console.log(obj.age);
console.log(obj['name']);
console.log('첫번째 취미: ' + obj.hobbies[0]);
console.log('두번째 취미: ' + obj['hobbies'][1]);
console.log(`세번째 취미: ${obj['hobbies'][2]}`);	// 빽틱으로도 할 수 있다.

obj.pets[0].name = '고양이';	// 값을 바꿀 수도 있음
obj.pets[1].name;

// 객체구조
console.log(this);	
console.dir(window.document.children[0].children[1].innerHTML);

//window.alert('윈도우객체의 alert함수');		// 알람창


obj.info();