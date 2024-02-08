package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class JCommentdel
 */
@WebServlet("/jcommentdel")
public class JCommentdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JCommentdel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int result = 0;
		if(session.getAttribute("mid") !=null && Util.intCheck2(request.getParameter("no"))) {
			
			JCommentDTO dto = new JCommentDTO();
			dto.setJcmid((String)session.getAttribute("mid"));
			dto.setJcno(Util.str2Int2(request.getParameter("no")));
			
			JCommentDAO dao = new JCommentDAO();
			result =dao.commentDelete(dto);
			
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}

}
