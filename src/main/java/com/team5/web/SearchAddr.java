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

import com.team5.dao.SomoimDAO;
import com.team5.dto.JoinSomoimDTO;
import com.team5.util.Util;

@WebServlet("/searchAddr")
public class SearchAddr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchAddr() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RequestDispatcher rd = request.getRequestDispatcher("searchAddr.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
