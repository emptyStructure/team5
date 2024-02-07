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


@WebServlet("/findIdName")
public class FindIdName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FindIdName() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if ((request.getParameter("namefinder") != null && !request.getParameter("namefinder").isEmpty())) {
			//이름으로 찾기기능
			String name = request.getParameter("namefinder");
			MemberDTO dto = new MemberDTO();
			dto.setMname(name);
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> nameFinderList = dao.namefinder(dto);
			if(nameFinderList.size() > 0) {
				request.setAttribute("nameFinderList", nameFinderList);
				RequestDispatcher rd = request.getRequestDispatcher("findIdResult.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("cantFind.jsp");
				rd.forward(request, response);
			}
		}
		
	}

}
