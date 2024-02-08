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

@WebServlet("/bcommentEdit")
public class BcommentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BcommentEdit() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int result = 0;
		if (session.getAttribute("mid") != null && Util.intCheck2(request.getParameter("cno"))
				&& request.getParameter("ccontent") != null) {
			BcommentDTO dto = new BcommentDTO();
			dto.setMid((String) session.getAttribute("mid"));
			dto.setCno(Util.str2Int2(request.getParameter("cno")));
			dto.setCcontent(Util.addBR(request.getParameter("ccontent")));
			
			BcommentDAO dao = new BcommentDAO();
			result = dao.bcommentEdit(dto);
		}
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}

}
