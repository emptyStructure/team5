package com.team5.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.SomoimDAO;
import com.team5.dto.JoinSomoimDTO;
import com.team5.util.Util;

@WebServlet("/joinerList")
public class JoinerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinerList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		System.out.println("리스트 접속");
		System.out.println(session.getAttribute("mname"));
		System.out.println(session.getAttribute("mid"));
		
		SomoimDAO dao = new SomoimDAO();
		System.out.println(Util.str2Int((request.getParameter("sno"))));
		List<JoinSomoimDTO> list =dao.joinList((String)session.getAttribute("mid"), Util.str2Int((request.getParameter("sno"))));
		
		request.setAttribute("title", list.get(1).getTitle());
		request.setAttribute("sno", list.get(1).getSno());
		request.setAttribute("list", list);
		
		System.out.println(list);
		RequestDispatcher rd = request.getRequestDispatcher("joinerList.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SomoimDAO dao = new SomoimDAO();
		System.out.println("dao 진입");
		int respon = Util.str2Int2(request.getParameter("respon"));
		String jno = request.getParameter("jno");
		int result = dao.respon(respon, jno);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
