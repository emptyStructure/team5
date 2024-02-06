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
import com.team5.util.Util;

@WebServlet("/somoimUpdate")
public class SomoimUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SomoimUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mname")==null) {
			response.sendRedirect("login");
		} else {
			SomoimDAO dao = new SomoimDAO();
			SomoimDTO dto = dao.detail(Util.str2Int2(request.getParameter("sno")));
			System.out.println(dto.getMid());
			System.out.println(session.getAttribute("mid"));
			if(session.getAttribute("mid").equals(dto.getMid())) {
				request.setAttribute("detail", dto);
				RequestDispatcher rd = request.getRequestDispatcher("./somoimUpdate.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("error.jsp");
			}
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
			dto.setSno(Util.str2Int2(request.getParameter("sno")));
			dto.setPersonnel(Util.str2Int2(request.getParameter("personnel")));
			
			int result = dao.update(dto, (String)session.getAttribute("mid"));
			if(result == 1) {
				response.sendRedirect("./soDetail?sno="+request.getParameter("sno"));
			} else {
				response.sendRedirect("./error.jsp");
			}
		}
	}

}
