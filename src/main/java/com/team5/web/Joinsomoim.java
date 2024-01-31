package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.SomoimDAO;
import com.team5.dto.JoinSomoimDTO;
import com.team5.util.Util;

@WebServlet("/joinsomoim")
public class Joinsomoim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Joinsomoim() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sno = request.getParameter("sno");
		String mno = request.getParameter("mno");
		System.out.println(mno);
		String name = request.getParameter("name");
		String ph = request.getParameter("ph");
		String msg = request.getParameter("msg");

		JoinSomoimDTO dto = new JoinSomoimDTO();
		SomoimDAO dao = new SomoimDAO();
		
		dto.setSno(Util.str2Int2(sno));
		dto.setMno(Util.str2Int2(mno));
		dto.setName(name);
		dto.setPh(ph);
		dto.setMessage(msg);
		
		int result = dao.join(dto);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
