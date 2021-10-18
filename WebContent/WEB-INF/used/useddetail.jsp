<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${used != null}">
		<div>
			<c:if test="${used.userId eq user.userId}">
				<button type="button" onclick="#">수정</button>
				<button type="button" onclick="#">삭제</button>
			</c:if>
		</div>
		<div>
			<table>
				<tr>
					<td rowspan=6>${used.usedImg}</td>
					<td colspan=2>${used.usedTitle}</td>
				</tr>
				<tr>
					<td colspan=2>${used.usedPrice}</td>
				</tr>
				<tr>
					<td>판매자</td>
					<td>${used.userId}</td>
				</tr>
				<tr>
					<td>상품상태</td>
					<td><c:choose>
							<c:when test="${used.usedState eq '0'}">미개봉</c:when>
							<c:when test="${used.usedState eq '1'}">상태좋음</c:when>
							<c:when test="${used.usedState eq '2'}">사용흔적있음</c:when>
							<c:when test="${used.usedState eq '3'}">구성품누락</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td>교환여부</td>
					<td><c:choose>
							<c:when test="${used.usedChange eq '0'}">교환가능</c:when>
							<c:when test="${used.usedChange eq '1'}">교환불가</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<td>거래방법</td>
					<td><c:choose>
							<c:when test="${used.usedExtype eq '0'}">직거래&amp;택배</c:when>
							<c:when test="${used.usedExtype eq '1'}">직거래</c:when>
							<c:when test="${used.usedExtype eq '2'}">택배</c:when>
						</c:choose></td>
				</tr>
			</table>
		</div>
		<div>연관상품</div>
		<div>${used.usedInfo}</div>
		<div>댓글등록창</div>
		<div>댓글창</div>

	</c:if>
</body>
</html>