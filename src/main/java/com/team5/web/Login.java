package com.team5.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MemberDAO;
import com.team5.dto.MemberDTO;


@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null && request.getParameter("pw") != null) {
			MemberDTO dto = new MemberDTO();
			dto.setMid(request.getParameter("id"));
			dto.setMpw(request.getParameter("pw"));
			
			MemberDAO dao = new MemberDAO();
			//로그인 확인 count불러오기
			dto = dao.login(dto);
			
			if (dto.getCount() == 1) {
				//로그인 성공, index페이지 이동, 로그인 세션 저장
				
				HttpSession session = request.getSession();
				session.setAttribute("mname", dto.getMname());//mname이라는 이름으로 세션만들기
				session.setAttribute("mid", dto.getMid());//mid라는 이름으로 세션 만듬
				
				response.sendRedirect("./index");
			} else {
				//에러페이지? 파라미터값 = 4567
				response.sendRedirect("./login?error=4567");
			}
			
		}

	}
}
