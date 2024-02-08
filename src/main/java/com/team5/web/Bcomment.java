package com.team5.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.BcommentDAO;
import com.team5.dto.BcommentDTO;
import com.team5.util.Util;

@WebServlet("/bcomment")
public class Bcomment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Bcomment() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (request.getParameter("commentcontent") != null && Util.intCheck(request.getParameter("bno")) 
				&& session.getAttribute("mid") != null) {
			String commentcontent = request.getParameter("commentcontent");
			commentcontent = Util.addBR(commentcontent);
			String bno = request.getParameter("bno");
			
			BcommentDTO dto = new BcommentDTO();
			dto.setCcontent(commentcontent);
			dto.setBno(Util.str2Int(bno));
			dto.setMid((String) session.getAttribute("mid"));
			dto.setCip(Util.getIP(request));
			
			BcommentDAO dao = new BcommentDAO();
			int result = dao.bcommentWrite(dto);
			
			if(result == 1){
				response.sendRedirect("detail?bno=" + bno);
			} else {
				response.sendRedirect("error.jsp");
			}
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}
