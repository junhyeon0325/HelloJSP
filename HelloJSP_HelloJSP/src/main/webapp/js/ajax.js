/**
 * ajax.js
 * Asynchronous Javascript And Xml 비동기방식의 자바스크립트 xml  
 * 
 */

// 동기방식 vs 비동기방시
// 비동기방식이 훨씬 빨라서 비동기방식으로 처리한다
setTimeout(function(){
	console.log('1')
}, 1000)

setTimeout(function(){
	console.log('2')
}, 2000)

setTimeout(function(){
	console.log('3')
}, 500)

const xhtp = new XMLHttpRequest();
