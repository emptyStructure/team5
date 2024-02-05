package com.team5.web;

import java.io.IOException;
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
 * Servlet implementation class JDelete
 */
@WebServlet("/jdelete")
public class JDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub]
	
		HttpSession session = request.getSession();
		if(Util.intCheck(request.getParameter("no")) && session.getAttribute("mid") !=null) {
			int no = Util.str2Int(request.getParameter("no"));
			JBoardDAO dao = new JBoardDAO();
			JBoardDTO dto = new JBoardDTO();
			dto.setJno(no);
			dto.setJmid((String) session.getAttribute("mid"));
			
			int result = dao.delete(dto);// dto에 Jno와 Jmid 를 셋팅해놓고 dto 값을 받아서 dao delte 값에 넣어서 실행하는 것임. 
			
			if(result ==1) {
				response.sendRedirect("./jboard");
				
			} else {
				System.out.println("14124214124");
				response.sendRedirect("./error.jsp");
			}
		} 
			 else{
			 
			 response.sendRedirect("./error.jsp"); }
		
		
}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
