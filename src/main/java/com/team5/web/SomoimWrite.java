package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.SomoimDAO;

@WebServlet("/somoimWrite")
public class SomoimWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SomoimWrite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	RequestDispatcher rd = request.getRequestDispatcher("./somoimWrite.jsp");
	rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		
		SomoimDAO dao = new SomoimDAO();
		int result = dao.write(title, content, category);
		if(result == 1) {
			System.out.println("게시글 작성 성공");
			response.sendRedirect("./somoim");
		} else {
			System.out.println("게시글 작성 실패");
			response.sendRedirect("./error.jsp");
		}
		
	}

}
