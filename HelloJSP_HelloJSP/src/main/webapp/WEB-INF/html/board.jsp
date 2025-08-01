<%@page import="com.yedam.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<%-- 이걸 해줘야 c를 써서 out을 호출해서 쓸수있음 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<h3>글상세화면(board.jsp)</h3>
<!-- msg 전달값이 있으면 메세지 출력. -->
<c:if test="${!empty msg }">
	<div style="color: red;">${msg }</div>
</c:if>

<form action="modifyForm.do">
<input type="hidden" value="${board_info.boardNo }" name="bno">
<input type="hidden" value="${page }" name="page">
<table class="table">
	<tr>
		<th>글번호</th>
		<td><c:out value="${board_info.boardNo }" /></td>
		<th>조회수</th>
		<td><c:out value="${board_info.viewCnt }" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan='2'>
			<c:out value="${board_info.title }" />
		</td>
		<td rowspan='2'>
			<c:choose>
				<c:when test="${!empty board_info.image }">
			    	<img width="150px" src='upload/${board_info.image }'>
				</c:when> 
				<c:otherwise>
			   		<img width="150px" src='https://dummyimage.com/100x100/91ff9c/ffffff&text=No'>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td colspan='2'><c:out value="${board_info.content}" /></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><c:out value="${board_info.writer}" /></td>
		<th>작성일시</th>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${board_info.creationDate}" /></td>
	</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="submit" value="수정" class="btn btn-success">
			<button type="button" class="btn btn-danger" ${logId eq board_info.writer ? '' : 'disabled' }>삭제</button>
		</td>
	</tr>
</table>
</form>

