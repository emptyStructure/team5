package com.team5.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.JCommentDAO;
import com.team5.dto.JCommentDTO;
import com.team5.util.Util;

/**
 * Servlet implementation class JComment
 */
@WebServlet("/jcomment")
public class JComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JComment() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		if (request.getParameter("commentcontent") != null && Util.intCheck(request.getParameter("jno"))
				&& session.getAttribute("mid") != null) {

			String commentcontent = request.getParameter("commentcontent");
			commentcontent = Util.removeTag(commentcontent);
			commentcontent = Util.addBR(commentcontent);

			String jno = request.getParameter("jno");

			JCommentDTO dto = new JCommentDTO();

			dto.setJccontent(commentcontent);
			dto.setJno(Util.str2Int(jno));
			dto.setJcmid((String) session.getAttribute("mid"));
			dto.setJcip(Util.getIP(request));

			JCommentDAO dao = new JCommentDAO();

			int result = dao.jcommentWrite(dto);

			if (result == 1) {
				response.sendRedirect("./jdetail?no=" + jno);
			} else {
				System.out.println("wejwepg");
				response.sendRedirect("./error.jsp");
			}
		} else {
		
			response.sendRedirect("./error.jsp");
		}
	}

}
