package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.JBoardDAO;
import com.team5.dto.JBoardDTO;
import com.team5.util.Util;

/**
 * Servlet implementation class JBoardLIst
 */
@WebServlet("/jboard")
public class JBoardLIst extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JBoardLIst() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//page받기 
		int page = 1;
		if (request.getParameter("page") != null && request.getParameter("page") != "") {
			page = Util.str2Int2(request.getParameter("page"));
		}
		
		JBoardDAO dao = new JBoardDAO();
		//List<JBoardDTO> list = dao.jBoardList(page);
		List<JBoardDTO> list = dao.jBoardList(page);
				
		int totalCount = dao.totalCount();

		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("totalCount", totalCount);
		//request.setAttribute("page", page);
		System.out.println(list);
		RequestDispatcher rd = request.getRequestDispatcher("jboard.jsp");
		rd.forward(request, response);
		
		
		//dto
		//dao 
		//request setattribute
		//request dispatcher 
		//rdforward 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
