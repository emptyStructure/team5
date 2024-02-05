package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MessageDAO;
import com.team5.dto.MessageDTO;

@WebServlet("/trashmessage")
public class TrashMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TrashMessage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		List<MessageDTO> namelist = new ArrayList<MessageDTO>();
		namelist = dao.nameList();
		List<MessageDTO> fromchatlist = new ArrayList<MessageDTO>();
		dto.setMid(mid);
		
		if (request.getParameter("mno") != null) {
			int mno = Integer.parseInt(request.getParameter("mno"));
			dto.setMno(mno); // 클릭한 상대방의 mno값 세팅
			fromchatlist = dao.fromchatlist();
			request.setAttribute("fromchatlist", fromchatlist);
			
			response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        for (MessageDTO chat : fromchatlist) {
	            out.println("<p>" + chat.getSendDate() + ": " + chat.getMscontent() + "</p>");
	        }
		}
		
		
		request.setAttribute("namelist", namelist);
		RequestDispatcher rd = request.getRequestDispatcher("trashmessage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		int toMno = Integer.parseInt(request.getParameter("mno")); 
		String mscontent = request.getParameter("mscontent");
		
		// 자기 Mno(FromMno)
		String mid = (String) session.getAttribute("mid");
		System.out.println(mid);
		dto.setToMno(toMno);
		dto.setMscontent(mscontent);
		dto.setMid(mid); // 로그인 된 사람 아이디
		int result = dao.insertChat(dto);
		
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.print(result);
		System.out.println(result);
	}

}
