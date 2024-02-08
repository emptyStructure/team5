package com.team5.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MemberDAO;
import com.team5.dto.MemberDTO;
import com.team5.util.MailApp;
import com.team5.util.RandomCodeGenerator;


@WebServlet("/findPw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FindPw() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("findPw.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		List<MemberDTO> pwList = new ArrayList<>();
		//String id = "";
		//String email = "";
		if (request.getParameter("idfinder") != null && !request.getParameter("idfinder").isEmpty() && 
				request.getParameter("emailfinder") != null && !request.getParameter("emailfinder").isEmpty()) {
			String id = request.getParameter("idfinder");
			String email = request.getParameter("emailfinder");
			MemberDTO dto = new MemberDTO();
			dto.setMid(id);
			dto.setMemail(email);
			MemberDAO dao = new MemberDAO();
			pwList = dao.checkIdEmail(dto);
			
			if (pwList.size() > 0) {
				//메일발송
				String code = RandomCodeGenerator.randomCode();
				MailApp.gmailSend(email, code);
				//다른서블릿에서 쓰기위해 세션을 이용해 저장
				HttpSession session = request.getSession();
				session.setAttribute("sendCode", code);
				
				//비밀번호 정보 보내기
				request.setAttribute("pwList", pwList);
				RequestDispatcher rd = request.getRequestDispatcher("findPwResult.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("cantFind.jsp");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("cantFind.jsp");
			rd.forward(request, response);
		}
	}
//		String inputCode = request.getParameter("code");
//		System.out.println(inputCode);
//		int result = 0;
//		if (pwList.size() > 0) {
//			if (code.equals(inputCode)) {
//				result = 1;
//			} else {
//				result = 0;
//			}
//			//값 보내기
//			PrintWriter pw = response.getWriter();
//			pw.print(result);
	

}
