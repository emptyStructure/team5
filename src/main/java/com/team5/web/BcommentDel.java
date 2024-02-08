package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.BcommentDAO;
import com.team5.dto.BcommentDTO;
import com.team5.util.Util;

@WebServlet("/bcommentDel")
public class BcommentDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BcommentDel() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null && Util.intCheck(request.getParameter("bno"))
				&& Util.intCheck2(request.getParameter("cno"))) {
			BcommentDTO dto = new BcommentDTO();
			dto.setMid((String)session.getAttribute("mid"));
			dto.setCno(Util.str2Int(request.getParameter("cno")));
			
			BcommentDAO dao = new BcommentDAO();
			int result = dao.bcommentDel(dto);
			if(result == 1) {
				response.sendRedirect("./detail?cno="+request.getParameter("cno"));
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int result = 0;
		if(session.getAttribute("mid") != null && Util.intCheck2(request.getParameter("cno"))) {
			BcommentDTO dto = new BcommentDTO();
			dto.setMid((String)session.getAttribute("mid"));
			dto.setCno(Util.str2Int(request.getParameter("cno")));
			
			BcommentDAO dao = new BcommentDAO();
			result = dao.bcommentDel(dto);
		}
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}
}
