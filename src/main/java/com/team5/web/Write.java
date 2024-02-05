package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.BoardDAO;
import com.team5.dto.BoardDTO;
import com.team5.util.Util;


@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Write() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") == null) {
			response.sendRedirect("./login");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("mid") == null || session.getAttribute("mname") == null) {
			response.sendRedirect("./login?login=nologin");
		} else {
			String btitle = request.getParameter("btitle");
			String bcontent = request.getParameter("bcontent");
			
			
			
			BoardDTO dto = new BoardDTO();
			dto.setBtitle(btitle);
			dto.setBcontent(bcontent);
			dto.setMid((String) session.getAttribute("mid"));
			dto.setBip(Util.getIP(request));
			
			BoardDAO dao = new BoardDAO();
			int result = dao.bwrite(dto);
			

			
			if (result == 1) {
				response.sendRedirect("./board");
			} else {
				response.sendRedirect("./error");
			}
		}

	}

}
