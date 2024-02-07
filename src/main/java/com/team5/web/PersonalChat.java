package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.util.Util;

@WebServlet("/personalchat")
public class PersonalChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PersonalChat() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("personalchat.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int toMno = Util.str2Int(request.getParameter("toMno"));
		System.out.println(toMno);
	}

}
