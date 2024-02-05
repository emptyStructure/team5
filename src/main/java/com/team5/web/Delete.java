package com.team5.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.BoardDAO;
import com.team5.dto.BoardDTO;
import com.team5.util.Util;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Delete() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(Util.intCheck(request.getParameter("bno")) && session.getAttribute("mid") != null) {
			int bno = Util.str2Int(request.getParameter("bno"));
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = new BoardDTO();
			dto.setBno(bno);
			dto.setMid((String) session.getAttribute("mid"));
			
			int result = dao.delete(dto);
			if(result == 1){
				response.sendRedirect("./board");
			} else {
				response.sendRedirect("./error.jsp");
			}
		} else {
			response.sendRedirect("./error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
