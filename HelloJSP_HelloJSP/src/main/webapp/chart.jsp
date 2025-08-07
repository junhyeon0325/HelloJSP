<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      
      let countPerUser = [
    	  ['User','Count']
      ]
      
      // 비동기처리
      fetch('chartData.do')					// 서버에 chartData.do를 호출
        .then(resolve => resolve.json())	// 서버에서 응답한 데이터를 json형식으로 변환
        .then(result => {					// 받은 json데이터를 함수에 전달
        	console.log(result);			// 서버데이터
        	// for ... in 활용해서
        	for (let prop in result) {
        		console.log(prop, result[prop]);
        		countPerUser.push([prop, result[prop]]);	// result는 prop키의 값을 꺼내줌
        	}
		    console.log(countPerUser);	// 출력
	        google.charts.setOnLoadCallback(drawChart);	// 원레 위에 있던거 인데 아래로 내린이유는 비동기처리라서 순서가 
        })
        .catch(err => console.log(err));
      
      
      function drawChart() {

        var data = google.visualization.arrayToDataTable(countPerUser);	// 차트를 그려주는기능

        var options = {
          title: '회원별 게시글 작성현황'	// 키: '벨류'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));	// getElementMyId 도 queryselector 랑 같은거
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>
