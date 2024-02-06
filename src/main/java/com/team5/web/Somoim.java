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

import com.team5.dao.SomoimDAO;
import com.team5.dto.SomoimDTO;
import com.team5.util.Util;

@WebServlet("/somoim")
public class Somoim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Somoim() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		SomoimDAO dao = new SomoimDAO();
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Util.str2Int2(request.getParameter("page"));
		}
		int totalCount = dao.totalCount();
		List<SomoimDTO> list = dao.list(page);
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("somoim.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
