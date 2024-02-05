package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		JoinSomoimDTO dto = new JoinSomoimDTO();
		SomoimDAO dao = new SomoimDAO();
		
		dto.setSno(Util.str2Int2(request.getParameter("sno")));
		dto.setName(request.getParameter("name"));
		dto.setPh(request.getParameter("ph"));
		dto.setMessage(request.getParameter("msg"));
		
		int result = dao.join(dto, (String)session.getAttribute("mid"));
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
