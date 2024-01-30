package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.SomoimDAO;
import com.team5.dto.SomoimDTO;

@WebServlet("/soDetail")
public class SoDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SoDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getParameter("sno");

		SomoimDAO dao = new SomoimDAO();
		SomoimDTO detail = dao.detail(Integer.parseInt(request.getParameter("sno")));
		request.setAttribute("detail", detail);
		
		RequestDispatcher rd = request.getRequestDispatcher("soDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
