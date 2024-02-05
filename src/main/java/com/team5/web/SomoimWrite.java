package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.SomoimDAO;
import com.team5.dto.SomoimDTO;

@WebServlet("/somoimWrite")
public class SomoimWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SomoimWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mname")==null) {
			response.sendRedirect("login");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("./somoimWrite.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("mname")==null) {
			response.sendRedirect("login");
		} else {
			SomoimDAO dao = new SomoimDAO();
			SomoimDTO dto = new SomoimDTO();
			dto.setStitle(request.getParameter("title"));
			dto.setScontent(request.getParameter("content"));
			dto.setScategory(request.getParameter("category"));
			int result = dao.write(dto, (String)session.getAttribute("mid"));
			if(result == 1) {
				response.sendRedirect("./somoim");
			} else {
				response.sendRedirect("./error.jsp");
			}
		}
	}

}
