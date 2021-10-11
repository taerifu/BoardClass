<%@page import="kh.semi.boardclass.admin.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Notice> volist=(ArrayList<Notice>)request.getAttribute("noticevolist");
	int startPage = (int)request.getAttribute("startPage");
	int endPage = (int)request.getAttribute("endPage");
	int pageCount = (int)request.getAttribute("pageCount");
	%>
<!DOCTYPE html>
<%@page import="kh.semi.boardclass.admin.model.vo.Notice"%>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="./css/admin/notice/adminNotice.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script type="text/javascript" src="./js/admin/notice/adminNotice.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
    <title>공지사항 조회</title>
</head>

<body>
    <%@include file="/WEB-INF/admin/main/adminHeader.jsp" %>
    <header></header>
     <section>
        <div class="admin-notice-section">
            <div class="admin-notice-div">
                <div class="admin-notice-title">공지사항 조회</div>
                <div class="admin-notice-search">
                    <select class="admin-notice-search-select">
                        <option>글제목 </option>
                    </select>
                    <input type="text" class="admin-notice-search-input">
                    <input type="button" value="검색" class="admin-notice-search-button">
                <button type="button" class="insert btn btn-primary"
                    style="float : right; background-color: #285226; color: #EAEAEA; border-radius: 5px;">공지사항작성</button>
                </div>

                <div class="admin-notice-table-div">
                    <table class="table table-striped admin-notice-table" style="text-align: center;">
                        <tr style="text-align:center; font-size: 16px; font-weight: bold;">
                            <td>글번호</td>
                            <td style="width : 200px;">글제목</td>
                            <td>최초 작성일</td>
                            <td>최종 수정일</td>
                            <td>수정 </td>
                            <td>삭제 </td>
                        </tr>
                        <%if(volist !=null){
						 for(Notice n : volist){ %> 
                        <tr>
                            <td><%=n.getAnnounceNo() %></td>
                            <td><a href = #사용자가보는공지사항화면새창열기 target = '_blank'> <%=n.getAdminTitle() %></a></td>
                            <td><%=n.getAdminWrDate() %></td>
                            <td><%=n.getAdminRwrDate() %></td>
                            <td><button class="update btn btn-primary" value="updatego" no="<%=n.getAnnounceNo()%>">글수정</button> </td>
                            <td><button class="delete btn btn-primary" value="deletego" id="<%=n.getAnnounceNo() %>">글삭제</button> </td>
                        </tr>
                         <%} }%> 
                    </table>
                </div>

            <div class="admin-notice-page-nav">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                <% if(startPage == 1) {%>
                	<li class="page-item-previous disabled">
                	<%} else { %>
                  <li class="page-item-previous">
                  <% }%>
                    <a class="page-link" href="noticelist?pagenum=${startPage-1}" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
  	<%for (int i = startPage; i <= endPage; i++) {%>
		<li class="page-item"><a class="page-link" href="noticelist?pagenum=<%=i%>"><%=i%></a></li>
		<%} if(endPage == pageCount){%>
		<li class="page-item-next disabled">
		<%}else{ %>
                  <li class="page-item-next">
                  <% }%>
                    <a class="page-link" href="noticelist?pagenum=${endPage+1}" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
        </div>
        </div>
        </div>
    </section>
</body>

</html>