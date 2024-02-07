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

import com.team5.dao.LetterDAO;
import com.team5.dto.LetterDTO;

@WebServlet("/letter")
public class Letter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Letter() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mname")==null||session.getAttribute("mid")==null) {
			response.sendRedirect("login");
		} else {
			String mid = (String) session.getAttribute("mid");
			LetterDAO dao = new LetterDAO();
			List<LetterDTO> list = dao.letterList(mid);
			
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("letter.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
