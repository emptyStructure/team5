package com.team5.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.InfoDAO;
import com.team5.dto.BoardDTO;
import com.team5.dto.MemberDTO;

@WebServlet("/myInfo")
public class MyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MyInfo() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		if (session.getAttribute("mid") != null && !session.getAttribute("mid").equals("")) {			
			InfoDAO dao = new InfoDAO();
			String mid = (String)(session.getAttribute("mid"));

			//내 정보 보기
			MemberDTO mdto = new MemberDTO();
			mdto = dao.myInfo(mid);
			request.setAttribute("myInfo", mdto);
			
			//내가 쓴 글 보기
			BoardDTO bdto = new BoardDTO();
			List<BoardDTO> myBoard = dao.myBoard(mid);
			request.setAttribute("myBoard", myBoard);
			
			//내가 쓴 댓글
			List<Map<String, Object>> mycomments = dao.myComments(mid);
			request.setAttribute("myComments", mycomments);
			
			
			//내가 참여중인 소모임
			//List<Map<String, Object>> mysomoim = dao.mySomoim(mid);
			//request.setAttribute("mysomoim", mysomoim);
			
			
			//내 중고거래내역 보기  내가 판 물건, 내가 산 물건

			RequestDispatcher rd = request.getRequestDispatcher("/myInfo.jsp");
			rd.forward(request, response);
			
		} else {
			response.sendRedirect("./login");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("mid") != null && !session.getAttribute("mid").equals("")) {
			
			//내 정보 수정
			MemberDTO dto = new MemberDTO();
			dto.setMid((String)(session.getAttribute("mid")));
			dto.setMname(request.getParameter("mName"));
			dto.setMpw(request.getParameter("mPW"));
			dto.setMemail(request.getParameter("mEmail"));
			
			InfoDAO dao = new InfoDAO();
			int result = dao.changeInfo(dto);
			
			if (result == 1) {
				System.out.println("통신 성공");
				response.sendRedirect("./myInfo");
			} else {
				response.sendRedirect("./error.jsp");
			}
			
		} else {
			response.sendRedirect("./login");
		}
		
	}

}
