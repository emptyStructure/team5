package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.JBoardDAO;
import com.team5.dto.JBoardDTO;
import com.team5.util.Util;

/**
 * Servlet implementation class JUpdate
 */
@WebServlet("/jupdate")
public class JUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			int no = Util.str2Int(request.getParameter("no"));
			JBoardDAO dao = new JBoardDAO();
			JBoardDTO dto = dao.detail(no);

			if (session.getAttribute("mid").equals(dto.getJmid())) {
				request.setAttribute("jupdate", dto);
				RequestDispatcher rd = request.getRequestDispatcher("jupdate.jsp");
				rd.forward(request, response);
			} else {

				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./login?login=nologin");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (request.getParameter("jtitle") != null && request.getParameter("jcontent") != null
			 && session.getAttribute("mid") != null) {
			
			JBoardDTO dto = new JBoardDTO();
			
			dto.setJtitle(request.getParameter("jtitle"));
			dto.setJcontent(request.getParameter("jcontent"));
			dto.setJno(Util.str2Int(request.getParameter("jno")));
			dto.setJmid((String)session.getAttribute("mid"));
			JBoardDAO dao = new JBoardDAO();
			int result = dao.jupdate(dto);

			if (result == 1) {
				response.sendRedirect("./jdetail?no=" + request.getParameter("jno"));
			} else {

				response.sendRedirect("./error.jsp");
			}

		} else {

			System.out.println("124214124214");
			response.sendRedirect("./error.jsp");
		}
		// TODO Auto-generated method stub

	}

}
