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

@WebServlet("/somoimApplications")
public class SomoimApplications extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SomoimApplications() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mname")==null) {
			response.sendRedirect("login");
		} else {
			SomoimDAO dao = new SomoimDAO();
			List<JoinSomoimDTO> list = new ArrayList<JoinSomoimDTO>();
			if(request.getParameter("status")!=null&&request.getParameter("status")!="") {
				list = dao.myJoinList((String)session.getAttribute("mid"), Util.str2Int2(request.getParameter("status")));
			} else {
				list =dao.myJoinList((String)session.getAttribute("mid"));
			}
			request.setAttribute("list", list);

			RequestDispatcher rd = request.getRequestDispatcher("somoimApplications.jsp");
			rd.forward(request, response);
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
