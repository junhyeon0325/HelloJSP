<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>회원 목록</h3>
<table class='table table-striped'>
	<thead>
		<tr>
			<th>회원ID</th>
			<th>회원이름</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="member" items="${member_list }">
			<tr>
				<td><c:out value="${member.memberId}" /></td>
				<td><c:out value="${member.memberName}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>


    

