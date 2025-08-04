/**
 * 
 */

const students = [];
students.push({sname: "홍길동", score: 90});

function showList() {
	students.forEach( elem => {
		let str = `<tr><td>${elem.sname}</td><td>${elem.score}</td></tr>`;
		document.querySelector('#tlist').innerHTML += str;
	});
}
showList();

document.querySelector('#addList').addEventListener('click', () => {
	
	let sname = document.querySelector('#std_name').value;
	let score = document.querySelector('#std_score').value;
	
	if(sname == '' || score == ''){
		window.alert('필수값을 입력하세요!!');
		return
	}

	document.querySelector('#tlist').innerHTML = '';
	
	students.push({sname: sname, score: score});
	
	showList();
	
	sname = document.querySelector('#std_name').value = '';
	score = document.querySelector('#std_score').value = '';
		
})