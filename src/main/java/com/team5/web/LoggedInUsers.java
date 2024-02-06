package com.team5.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MessageDAO;
import com.team5.dto.MessageDTO;

@WebServlet("/loggedinusers")
public class LoggedInUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoggedInUsers() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		
		MessageDAO dao = new MessageDAO();
		List<MessageDTO> loginlist = dao.loginList(mid);
		System.out.println("실행");
		System.out.println(loginlist);
		request.setAttribute("loginlist", loginlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("chatting.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
