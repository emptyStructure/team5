package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.JBoardDAO;
import com.team5.dao.JCommentDAO;
import com.team5.dto.JBoardDTO;
import com.team5.dto.JCommentDTO;
import com.team5.util.Util;

/**
 * Servlet implementation class JDetail
 */
@WebServlet("/jdetail")
public class JDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//오는 no 잡기 
		
		HttpSession session = request.getSession();
		int no = Util.str2Int(request.getParameter("no"));
		
		JBoardDAO dao = new JBoardDAO();
		JCommentDAO dao1 = new JCommentDAO();
		JBoardDTO dto = dao.detail(no);
		

		if (session.getAttribute("mid") != null) {
			// bno, mno
			dao.countUp(no, (String) session.getAttribute("mid"));
		}

		
		/*
		 * if(no == 0 || dto.getJcontent() == null) { //null이면 에러로
		 * response.sendRedirect("./error.jsp"); } else {
		 */
			// 정상 출력 
			//내용 가져오기
			request.setAttribute("jdetail", dto);
			
			List<JCommentDTO> commentList = dao1.commentList(no);
			
		if(commentList.size()>0) {
			request.setAttribute( "commentList",commentList);
		}
			
			
			RequestDispatcher rd = request.getRequestDispatcher("jdetail.jsp");
			rd.forward(request, response);
		}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
