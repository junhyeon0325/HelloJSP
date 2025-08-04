/**
 * 
 * 문자열 메소드(indexOf, substring, slice, split, toUpperCase, toLowerCase, trim, replace, includes)
 */

//1번)
let strAry = [" Hello, Java         "//
	, " HTML, Css, JavaScript   "//
	, "     Java is complier    "//
	, "       Java and Javascript      "];
let filterWord = "java";
/*결과=> "HELLO, ****"
	  "HTML, CSS, ****SCRIPT"
	  "**** IS COMPILER"
	  "**** AND ****SCRIPT" */

function filter() {
	strAry.forEach(elem => {	
		let result = elem.trim().toLowerCase().replaceAll(filterWord, "****").toUpperCase();
		console.log(`"${result}"`);
	})
};
filter();

	  	  
//2번) 13남자 24여자
let noAry = ["920304-1213421", "9905082928123", "030702-4323123"]
/*결과=> "920304-1213421"은 남자입니다
	  "990508 2928123"은 여자입니다
	  "030702-7323123"은 여자입니다*/
function no() {
	noAry.forEach(elem => {
		//let gen = elem.substr(7,1);
		let gen = elem.slice(-7)[0]; 
		let gender = gen == '1' ? '남자' : (gen == '3' ? '남자' : '여자');
		
		/*if(elem.substr(7,1) == 1 || elem.substr(7,1) == 3){
			console.log(`${elem}은 남자입니다`)
		} else {
			console.log(`${elem}은 여자입니다`)
		}*/
		console.log(`"${elem}" 은 ${gender}입니다.`);
	})
}
no();
	  
	  
let idx = "Hello, World".indexOf('W');
console.log(idx);	// 찾는 값이 없을 경우 => -1 값을 반환
idx = "Hello, World".indexOf("Hell");
if(idx == -1) {
	console.log("찾는 문자열이 없습니다");
}
console.log(idx);

// 네사람 이름중에 '길동' 이름이 총 몇명인지를 반환하는 함수를 생성
const names = ['홍길동','홍길순','김길동','김민수'];

/*function getKildong() {
	let count = 0;
	for(let i = 0; i < names.length; i++) {
		let idxn = names[i].indexOf('길동');
		if(idxn > -1){
			count++;
		}
	}
	console.log(count + '명');
} */


function getKildong() {
	let count = 0;
	names.forEach(elem => {
		if(elem.indexOf('김') == 0){
			count++;
		};
	});
	console.log(`${count}명`);
}
getKildong();	// '2명' 출력'

const obj = {
	name: '홍길동', // obj.name
	age: 20,
	info: function() {
		return `이름은 ${this.name}, 나이는 ${this.age}`;
	}
}
console.log(obj.name);

// 배열(문자) 메소드 정의 활용.
Array.prototype.sum = function(num1) {
	this.push(num1);
}

const numbers = [1,2];
numbers.push(3);
numbers.sum(4);

console.log(numbers);