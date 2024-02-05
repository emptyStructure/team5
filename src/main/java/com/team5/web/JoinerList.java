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
		
		SomoimDAO dao = new SomoimDAO();
		
		
		//요청이 한개도 없으면 오류남. 고쳐야되네
		if(dao.wirterBool(Util.str2Int(request.getParameter("sno")),(String)session.getAttribute("mid") )==1) {
			List<JoinSomoimDTO> list = new ArrayList<JoinSomoimDTO>();
			if(request.getParameter("status")==null||request.getParameter("status")=="") {
				list =dao.joinList((String)session.getAttribute("mid"), Util.str2Int(request.getParameter("sno")));
			} else {
				list =dao.joinList((String)session.getAttribute("mid"), Util.str2Int(request.getParameter("sno")),request.getParameter("status"));
			}
			int sno = Util.str2Int(request.getParameter("sno"));
			String title = dao.detail(sno).getStitle();
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			request.setAttribute("sno", Util.str2Int(request.getParameter("sno")));
			
			RequestDispatcher rd = request.getRequestDispatcher("joinerList.jsp");
			rd.forward(request, response);
		} else {
			response.sendRedirect("error.jsp");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SomoimDAO dao = new SomoimDAO();
		int respon = Util.str2Int2(request.getParameter("respon"));
		String jno = request.getParameter("jno");
		int result = dao.respon(respon, jno);
		
		PrintWriter pw = response.getWriter();
		pw.print(result);
		
	}

}
