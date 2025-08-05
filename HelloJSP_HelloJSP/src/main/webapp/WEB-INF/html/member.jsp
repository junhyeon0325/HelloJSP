<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<%-- 이걸 해줘야 c를 써서 out을 호출해서 쓸수있음 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<h3>회원상세화면(member.jsp)</h3>
<!-- msg 전달값이 있으면 메세지 출력. -->
<c:if test="${!empty msg }">
	<div style="color: red;">${msg }</div>
</c:if>

<form action="">
<input type="hidden" value="${page }" name="page">
<table class="table">
	<tr>
		<th>회원ID</th>
		<td><c:out value="${member_info.memberId }" /></td>
	</tr>
	<tr>
		<th>회원이름</th>
		<td>
			<c:out value="${member_info.memberName }" />
		</td>
	</tr>
	<tr>
		<th>권한</th>
		<td>
			<c:out value="${member_info.responsibility}" />
		</td>
	</tr>
</table>
</form>