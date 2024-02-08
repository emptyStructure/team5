package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/pwCheck")
public class PwCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public PwCheck() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 코드 읽어오기
		HttpSession session = request.getSession();
		String code = (String) session.getAttribute("sendCode");
		//jsp파일에서 코드값 가져오기
		String inputCode = request.getParameter("code");
		System.out.println(inputCode);
		int result = 0;
		if (code != null && code.equals(inputCode)) {
			result = 1;
		} else {
			result = 0;
		}
		//값 보내기
		PrintWriter pw = response.getWriter();
		pw.print(result);
	}

}
