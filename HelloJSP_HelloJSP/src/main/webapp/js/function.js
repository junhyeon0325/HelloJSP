/**
 * 
 */

// 함수선언식
/*function sum(num1, num2) {
	let result = num1 + num2;
	return result;
}*/

// 함수선언식 실제로는 이렇게 표현식으로 돌아간다 
/*let sum = function(num1, num2) {
	let result = num1 + num2;
	return result;
}*/

// 화살표 함수, 위에 선언식을 요렇게 화살표로 가능 
/*let sum = (num1, num2) => {
	let result = num1 + num2;
	return result;
}*/

// 실행되는 구문이 한불일때 요렇게 표현이 가능
let sum = (num1, num2) => num1 + num2;

sum(10, 12);

// 함수표현식
/*let showInfo = function(result) {
	console.log(result);
}*/

/*let showInfo = (result) => {
	console.log(result);
}*/

// 요렇게 간단하게 표시 가능
let showInfo = (result) => console.log(result);

showInfo('Hello, World');