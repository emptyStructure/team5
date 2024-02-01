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
		MessageDAO dao = new MessageDAO();
		List<MessageDTO> namelist = new ArrayList<MessageDTO>();
		namelist = dao.nameList();
		List<MessageDTO> fromchatlist = new ArrayList<MessageDTO>();
		fromchatlist = dao.fromchatlist();
		request.setAttribute("namelist", namelist);
		request.setAttribute("fromchatlist", fromchatlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("trashmessage.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		int toMno = Integer.parseInt(request.getParameter("mno")); 
		String mname = request.getParameter("mname"); 
		String mscontent = request.getParameter("mscontent");
		int testnum = 9;
		dto.setToMno(toMno);
		dto.setMscontent(mscontent);
		dto.setFromMno(testnum);
		int result = dao.insertChat(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		System.out.println(result);
	}

}
