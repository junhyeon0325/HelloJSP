/**
 * data.js 
 */

const str = `[{"id":1,"first_name":"Cece","last_name":"Hutchison","email":"chutchison0@xinhuanet.com","gender":"Male","salary":6446},
{"id":2,"first_name":"Janel","last_name":"Voelker","email":"jvoelker1@nymag.com","gender":"Female","salary":7085},
{"id":3,"first_name":"Sioux","last_name":"Lackmann","email":"slackmann2@cyberchimps.com","gender":"Agender","salary":5847},
{"id":4,"first_name":"Ephraim","last_name":"Brentnall","email":"ebrentnall3@newsvine.com","gender":"Male","salary":8279},
{"id":5,"first_name":"Shanon","last_name":"McBryde","email":"smcbryde4@360.cn","gender":"Female","salary":8770},
{"id":6,"first_name":"Wendye","last_name":"Buer","email":"wbuer5@parallels.com","gender":"Polygender","salary":5020},
{"id":7,"first_name":"Ripley","last_name":"Spaice","email":"rspaice6@cafepress.com","gender":"Non-binary","salary":5462},
{"id":8,"first_name":"Swen","last_name":"Keemar","email":"skeemar7@state.gov","gender":"Male","salary":9177},
{"id":9,"first_name":"Lion","last_name":"Choldcroft","email":"lcholdcroft8@google.co.uk","gender":"Male","salary":7710},
{"id":10,"first_name":"Sherwood","last_name":"Dundon","email":"sdundon9@friendfeed.com","gender":"Male","salary":9022},
{"id":11,"first_name":"Chiquita","last_name":"Otson","email":"cotsona@tripod.com","gender":"Female","salary":7182},
{"id":12,"first_name":"Sallyann","last_name":"Dalgarnowch","email":"sdalgarnowchb@gnu.org","gender":"Female","salary":6814},
{"id":13,"first_name":"Glad","last_name":"Lowfill","email":"glowfillc@mapquest.com","gender":"Female","salary":7371},
{"id":14,"first_name":"Alex","last_name":"Lazell","email":"alazelld@jigsy.com","gender":"Male","salary":8899},
{"id":15,"first_name":"Lewes","last_name":"Fillimore","email":"lfillimoree@hud.gov","gender":"Male","salary":5308}]`;
// json 문자열(객체) -> JSON.parse() -> 객체.
let members = JSON.parse(str);

let students = [{ name: "Hong", age: 20}, {name: "Choi", age: 21}];
//				[{"name":"Hong","age":20},{"name":"Choi","age":21}] 요런형태로 바꿔줌 잘보면 name하고 age가 문자열로 바뀜
// 객체 -> JSON.stringify() -> json문자열
let json = JSON.stringify(students);
//console.log(json);

// 반복문(forEach) => 성별:Female 급여: 6000 이상인 사람을 출력.

members.forEach(elem => {
	if(elem.gender == "Female" && elem.salary > 6000) {
		console.log(`이름 : ${elem.last_name}, 성별 : ${elem.gender}, salary : ${elem.salary}`);
	}  
})