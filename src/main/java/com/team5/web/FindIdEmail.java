package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.MemberDAO;
import com.team5.dto.MemberDTO;


@WebServlet("/findIdEmail")
public class FindIdEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FindIdEmail() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if ((request.getParameter("emailfinder") != null && !request.getParameter("emailfinder").isEmpty())) {
			String email = request.getParameter("emailfinder");
			MemberDTO dto = new MemberDTO();
			dto.setMemail(email);
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> emailFinderList = dao.emailFinder(dto);
			if(emailFinderList.size() > 0) {
				request.setAttribute("emailFinderList", emailFinderList);
				RequestDispatcher rd = request.getRequestDispatcher("findIdResult.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("cantFind.jsp");
				rd.forward(request, response);
			}
		} else {
			//둘다거나 or 오류
			RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
			rd.forward(request, response);
		}
	}

}
