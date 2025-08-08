/**
 * openapi.js
 * 
 *  
 */


let url = `https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=pntIir%2FSkT46WZRhvrhH9j8cEOwoXzS2LsTVserQYIVlvv%2BjFbHx9RfqfkmM4YKFmoM%2FKRswFfGVaW08RPyRhw%3D%3D`

// 이벤트 등록
document.querySelector('#search').addEventListener('change', function(e) {
	let sido = e.target.value;
	searchCenterList(sido);
});

// 검색목록 생성.
fetch(url)
	.then(resolve => resolve.json())
	.then(result => {
		const search = document.getElementById('search');
		result.data.reduce((acc, elem) => {		// 중복되지않게 할려고 reduce씀 reduce를 반환값이 배열이라 또 쓸 수 있음
			if (acc.indexOf(elem.sido) == -1) {
				acc.push(elem.sido); // ['서울특별시','제주자치도']
			}
			return acc;	// 다음순번의 acc값으로 활용.
		}, [])
			.forEach(elem => {
				// <option value="서울특별시">서울특별시</option>
				let opt = document.createElement('option');
				opt.value = elem;
				opt.innerHTML = elem;
				search.appendChild(opt);
			})

	})
	.catch(err => console.error(err));

// 함수호출.
searchCenterList('서울특별시');

function searchCenterList(sido) {

	fetch(url)
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result.data);
			// 결과 목록을 활용해서 페이지 작성.
			document.querySelector('#list').innerHTML = '';
			result.data.forEach(elem => {	//forEach한번더
				if (elem.sido == sido) {

					let tr = document.createElement('tr');
					tr.addEventListener('click', function(e){
						window.open('daumapi.jsp?lat='+elem.lat+'&lng='+elem.lng);
					});

					['id', 'centerName', 'phoneNumber'].forEach(prop => {
						let td = document.createElement('td');
						td.innerText = elem[prop];
						tr.appendChild(td);
					});

					document.querySelector('#list').appendChild(tr);
				};
			});
		})
		.catch(err => console.error(err));
}





