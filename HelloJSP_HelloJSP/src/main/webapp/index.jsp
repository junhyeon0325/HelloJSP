<!-- 위에 taglib page이거는 지시자 core라서 c를 씀 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:forward page="boardList.do"></jsp:forward>
	<h3>Hello, JSP</h3>

	<!-- var는 변수선언, 이말은 String name = "홍길동"; 요거임-->
	<c:set var="name" value="홍길동1"></c:set>
	<c:out value="${name }"></c:out>

	<c:choose>
		<c:when test="${not empty name}">
			<p>정답</p>
		</c:when>
		<c:otherwise>
			<p>오답</p>
		</c:otherwise>
	</c:choose>
	<!-- 어떤 변수의 값을 출력하겠냐 -->
	<!-- 자바코드를 대신해서 똑같은 거를 대신해서 수행할려고 하는거임 그래서 자바코드 다 지움 -->

	<c:set var="age" value="19"></c:set>
	<!--  value안에 있는거 지금 문자타입임 -->

	<c:if test="${age >= 20 }">
		<p>당신은 성년입니다</p>
	</c:if>
	<!-- test안에 조건문 가 변수값을 불러오는거 조건에 만족하면 if문 안에 실행-->

	<c:choose>
		<c:when test="${age >= 30 }">
			<p style="color: red;">어른</p>
		</c:when>
		<c:when test="${age >= 20 }">
			<p style="color: red;">청년</p>
		</c:when>
		<c:otherwise>
			<p style="color: green;">미성년</p>
		</c:otherwise>
	</c:choose>
	
	<!-- 반복문 step의 기본값은 1 -->
	<c:forEach var="i" begin="1" end="10" step="2">
		<p>2 * ${i } = ${2 * i }</p>
	</c:forEach>
</body>
</html>