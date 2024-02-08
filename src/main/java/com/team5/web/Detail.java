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

import com.team5.dao.BoardDAO;
import com.team5.dto.BcommentDTO;
import com.team5.dto.BoardDTO;
import com.team5.util.Util;

@WebServlet("/detail")
public class Detail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Detail() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Util.str2Int(request.getParameter("bno"));
		
		BoardDAO dao = new BoardDAO();
		dao.logWrite(Util.getIP(request), "./detail", "bno="+bno);
		HttpSession session = request.getSession();
		if(session.getAttribute("mid") != null) {
			dao.countUp(bno, (String) session.getAttribute("mid"));
		}
		
		BoardDTO dto = dao.detail(bno);
		
		if(bno == 0 || dto.getBcontent() == null) {
			response.sendRedirect("./error.jsp");
		} else {
			request.setAttribute("detail", dto);
			
			List<BcommentDTO> bcommentList = dao.bcommentList(bno);
			
			if(bcommentList.size() > 0) {
				request.setAttribute("bcommentList", bcommentList);
			}
			
		
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
		rd.forward(request, response);
		}
	

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
