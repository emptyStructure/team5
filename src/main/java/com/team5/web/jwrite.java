package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.team5.dao.JBoardDAO;
import com.team5.dto.JBoardDTO;
import com.team5.util.Util;

/**
 * Servlet implementation class jwrite
 */
@WebServlet("/jwrite")
public class jwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jwrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 이전 페이지의 URL을 세션에 저장하는 코드 : 전전 페이지 이동에 필요함! <삭제하지 마세요>
		HttpSession session =request.getSession();
		String originalReferer = request.getHeader("Referer");
		session.setAttribute("originalReferer", originalReferer);

		
		if(session.getAttribute("mname")==null ) {
			response.sendRedirect("./login");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("jwrite.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		// 세션에 들어있는 mid가져오기
		HttpSession session = request.getSession();
		
	if(session.getAttribute("mid") == null || session.getAttribute("mname") == null) {			
		response.sendRedirect("./login?login=nologin");
		
	}else {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			title = Util.removeTag(title);
			content = Util.removeTag(content);
			
			JBoardDTO dto = new JBoardDTO();
			dto.setJtitle(title);
			dto.setJcontent(content);
			dto.setJmid((String) session.getAttribute("mid"));
			dto.setJip(Util.getIP(request));
			JBoardDAO dao = new JBoardDAO();
			int result = dao.jwrite(dto);
			
			if(result ==1) {
				response.sendRedirect("./jboard");
				
			} else {
				response.sendRedirect("./error");
			}
			
			
			
		}
		
		
	}
}


