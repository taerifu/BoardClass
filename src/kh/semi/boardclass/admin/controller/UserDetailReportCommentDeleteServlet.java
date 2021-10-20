package kh.semi.boardclass.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.boardclass.admin.model.service.AdminService;

/**
 * Servlet implementation class UserDetailReportCommentDeleteServlet
 */
@WebServlet("/userdetailreportcommentdelete")
public class UserDetailReportCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDetailReportCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		int commentNo = Integer.parseInt(request.getParameter("commentNo"));
		String userId = request.getParameter("userId");
		int result = new AdminService().deleteAllComment(commentNo);


		if (result > 0) {
			request.setAttribute("msg", commentNo + "번 커뮤니티 댓글 삭제완료");
			request.setAttribute("loc", "adminuserdetail?userId="+userId);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/reportcomment/reportcommentalert.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("msg", "삭제실패 ");
			request.setAttribute("loc", "adminuserdetail?userId="+userId);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/admin/reportcomment/reportcommentalert.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
