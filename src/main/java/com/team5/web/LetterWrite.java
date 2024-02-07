package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.LetterDAO;
import com.team5.dto.LetterDTO;

@WebServlet("/letterWrite")
public class LetterWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LetterWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mname")==null||session.getAttribute("mid")==null) {
			response.sendRedirect("login");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/letterWrite.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mname")==null||session.getAttribute("mid")==null) {
			response.sendRedirect("login");
		} else {
			LetterDAO dao = new LetterDAO();
			LetterDTO dto = new LetterDTO();
			dto.setLtitle(request.getParameter("title"));
			dto.setMsg(request.getParameter("content"));
			dto.setReceiver(request.getParameter("receiver"));
			dto.setWriter((String)session.getAttribute("mid"));
			
			int result = dao.searchUser(dto);
			PrintWriter pw = response.getWriter();
			pw.print(result);
		}
	}

}
