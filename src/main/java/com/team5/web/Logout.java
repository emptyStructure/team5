package com.team5.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Logout() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("mname") != null) {
			session.removeAttribute("mname");
		}
		if (session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		session.invalidate();
		
		
		/// 이전 페이지의 URL 가져오기
        String referer = request.getHeader("referer");

        // 이전 페이지가 존재하면 해당 페이지로 리다이렉트, 없으면 기본 페이지로 이동
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
           response.sendRedirect("./index"); // 기본 페이지로 리다이렉트
        }
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
