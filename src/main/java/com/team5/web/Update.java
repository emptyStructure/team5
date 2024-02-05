package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import com.team5.dao.BoardDAO;
import com.team5.dto.BoardDTO;
import com.team5.util.Util;

@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Update() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("mid") != null) {
			int bno = Util.str2Int(request.getParameter("bno"));
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.detail(bno);
			
			if (session.getAttribute("mid").equals(dto.getMid())) {
				request.setAttribute("update", dto);
				RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
				rd.forward(request, response);
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./login?login=nologin");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (request.getParameter("btitle") != null && request.getParameter("bcontent") != null && Util.intCheck(request.getParameter("bno")) && session.getAttribute("mid") != null) {
			BoardDTO dto = new BoardDTO();
			dto.setBtitle(request.getParameter("btitle"));
			dto.setBcontent(request.getParameter("bcontent"));
			dto.setBno(Util.str2Int(request.getParameter("bno")));
			dto.setMid((String) session.getAttribute("mid"));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.update(dto);
			if (result == 1) {
				response.sendRedirect("./detail?bno=" + request.getParameter("bno"));
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./error.jsp");
		}
	}
}
