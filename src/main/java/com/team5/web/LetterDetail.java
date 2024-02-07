package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.LetterDAO;
import com.team5.dto.LetterDTO;

@WebServlet("/letterDetail")
public class LetterDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LetterDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getParameter("lno");

		LetterDAO dao = new LetterDAO();
		LetterDTO detail = dao.detail(Integer.parseInt(request.getParameter("lno")));
		request.setAttribute("detail", detail);
		
		RequestDispatcher rd = request.getRequestDispatcher("letterDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
