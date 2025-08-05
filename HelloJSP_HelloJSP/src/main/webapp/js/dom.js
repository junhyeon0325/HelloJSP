/**
 * dom.js 0805 0924
 * <ul id="target">
     <li>apple</li>						// innerText
     <li>banana</li>
   </ul>
 */

// ul태그
let ul = document.createElement('ul');	// <ul />태그를 만든다라는의미
ul.setAttribute('id', 'target');		// ul태그의 id값안에 target을 넣어라

// li태그
// 1번째 li태그
let li = document.createElement('li');	// <li />태그를 만든거를 li변수에 저장
li.innerText = 'apple';					// innerText = li태그 사이에 apple를 넣어달라
ul.appendChild(li);						// appendChild = ul태그의 하위태그로 li태그를 넣겠다 라는 의미
// 2번째 li태그
li = document.createElement('li'); 
li.innerText = 'banana';
ul.appendChild(li);	
	
// 출력
console.log(ul);						// ul태그를 콘솔에 출력
document.querySelector('#show').appendChild(ul);  // <div id='show' />, 문서에 'show'id태그값의 ul을 출력