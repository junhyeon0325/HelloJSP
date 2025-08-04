<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="center">
	<form action="memberList.do">
		<div class="row">
			<div class="col-sm-4">
				<select name="searchCondition" class="form-control">
					<option value="">선택하세요</option>
					<option value="T" ${searchConditon == 'T' ? 'selected' : '' }>회원ID</option>
					<option value="W" ${searchConditon == 'W' ? 'selected' : '' }>회원이름</option>
					<option value="TW" ${searchConditon == 'TW' ? 'selected' : '' }>회원ID & 회원이름</option>
				</select>
			</div>
			<div class="col-sm-5">
				<input type="text" name="keyword" class="form-control">
			</div>
			<div class="col-sm-3">
				<input type="submit" value="조회" class="btn btn-success">
			</div>
		</div>
	</form>
</div>
<!-- 검색 -->

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
			<%-- board_list에서 board값을 가져오는거 --%>
			<tr>
				<td><c:out value="${member.memberId}" /></td>
				<td><c:out value="${member.memberName}" /></td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<!-- paging.. -->
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<!-- 이전페이지. -->
		<c:choose>
			<c:when test="${paging.previous }">
				<li class="page-item"><a class="page-link"
					href="memberList.do?searchCondition=${searchCondition }&keyword=${keyword }&page=${paging.start - 1 }">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<!-- paging 정보를 받아서 링크생성. -->
		<c:forEach var="p" begin="${paging.start }" end="${paging.end }">
			<c:choose>
				<c:when test="${paging.currPage eq p }">	<%-- eq를 써도되고 ==를 써도되고 --%>
					<li class="page-item active" aria-current="page"><span
						class="page-link">${p }</span></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="memberList.do?searchCondition=${searchCondition }&keyword=${keyword }&page=${p }">${p }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 이후페이지. -->
		<c:choose>
			<c:when test="${paging.next }">
				<li class="page-item"><a class="page-link"
					href="memberList.do?searchCondition=${searchCondition }&keyword=${keyword }&page=${paging.end + 1 }">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item disabled"><a class="page-link">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>


    

