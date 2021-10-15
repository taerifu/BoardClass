<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kh.semi.boardclass.community.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" href="css/community/freeBoardMain.css" />
<link rel="stylesheet" href="css/community/cmain.css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
</head>
<c:import url="../header.jsp" />
<body>

<div id="guide" class="row">
<nav id="aside" class="column">
		<ul>
			<li><a href="./cmain">커뮤니티</a></li>
			<li><a href="#">공지사항</a></li>
			<li><a href="./cf">자유게시판</a></li>
			<li><a href="#">유저정보게시판</a></li>
			<li><a href="#">모임게시판</a></li>
		</ul>
</nav> <!-- TODO 링크 첨부 -->
<div id= "contents">
<div class="conwrap pb30">
<section id="boardlsit">
	<div class="h3group ">
		<h3 class="tit">자유게시판</h3>
		<div class="location">
			<span class="depth">홈</span>
			<span class="depth">커뮤니티</span><strong class="this">자유게시판</strong>
		</div>
	</div>
<div class="conwrap">
	<div class="h4group">
		<h4 class="tit">전체글 보기</h4>
	</div>
	<!--  선택옵션-->
	<select id="b_category">
	  <option value="freeboard">자유게시판</option>
	  <option value="userboard">유저정보게시판</option>
	  <option value="gathering">모임게시판</option>
	</select>
	<div id ="a1">
	
	</div>

<table class="c_table">
	<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
	</tr>
	
	<c:if test="${totCnt > 0 }">
	<c:forEach var="board" items="${list }">
		<tr>
			<td style="width: 10%; font-weight: bold; font-size: 18px; text-align: center;">
				${board.boardNo }
			</td>
			<td style="width: 40%; font-weight: bold; font-size: 18px">
				<a href="cfdetail?boardNo=${board.boardNo }&pageNum=${currentPage}">${board.boardTitle }</a>
			</td>
			<td style="width: 10%; text-align: center;">${board.userId }</td>
			<td style="width: 10%;">${board.boardWriteDate }</td>
			<td style="width: 10%; text-align: center;">${board.boardViewCount }</td>
		</tr>
	</c:forEach>
	</c:if>
	<c:if test="${totCnt == 0 }">
		<tr>
			<td colspan="7">데이터가 없습니다</td>
		</tr>
	</c:if>
	</table>
	</section>
	
	<div style="text-align: centerl; margin-top:20px;" class="pagination">
		<c:if test="${startPage > blockSize }">
			<a href="cf?pageNum=${startPage-blockSize}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${pageNum == i }">
				<a href="cf?pageNum=${i }" style="color: blue;">[${i }]</a>
			</c:if>
		<c:if test="${pageNum != i }">
			<a href="cf?pageNum=${i }">[${i }]</a>
		</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="cf?pageNum=${startPage + blockSize }">[다음]</a>
		</c:if>
 	</div>
	
	<div class="btn_wrap">
		<div class="fl_c">
			<a href="./cfwrite" class="btn50 c3 reg" style="width: 240px;" tmp="contents/bod" mn="60" cn="0"><span class="write">글작성</span></a>
		</div>
	</div>

</div>
</div>
</div>
<script>
//change 될때마다 getListAjax
$(function(){
	$('#b_category').on('change', getList);
});
	function getList(){
		console.log("ajax 시작부분");
		$.ajax({
			type:"post",
			url: 'commlist',
			data: { category : $('#b_category').val()},
			dataType: 'json',
			success: function(data) {
				if(data.result == "ok") {
					$('#a1').html("");
					for(var i=0; i<data.volist.length; i++){
						var newNode = '<p id="id_'+data.volist[i].boardNo+'"><a href="#">'+data.volist[i].boardNo+'</a>  | '+data.volist[i].boardTitle+'</p>'; 
						$('#a1').append(newNode);
					}
				}else {
					
				}
			}
		});//ajax
	}
</script>



<c:import url="../footer.jsp" />
</body>
</html>