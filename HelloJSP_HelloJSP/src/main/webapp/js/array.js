/**
 * array.js 20250805 1103
 * (forEach, map, filter, reduce)
 * document.querySelectorAll() 결과에 사용.
 */


/*members.forEach ((elem, idx, ary) => {
	if (idx == ary.length - 1) {
		console.log(elem);
	}
});*/


let sum = 0;
var evenSum = (elem, idx, ary) => {
	if (elem % 2 == 0) {
		sum += elem;
	}
	if (idx == ary.length - 1) {
		console.log(`짝수합계는 ${sum}`);
	}
}

var oddSum = (elem, idx, ary) => {
	if (idx % 2 == 0) {
		sum += elem;
	}
	if (idx == ary.length - 1) {
		console.log(`홀수번째 인덱스의 합계는 ${sum}`);
	}
}

var totalSum = (elem, idx, ary) => {
	sum += elem;
	if (idx == ary.length - 1) {
		console.log(`홀수번째 인덱스의 합계는 ${sum}`);
	}
}

[12, 34, 83, 22, 59, 77].forEach(totalSum);