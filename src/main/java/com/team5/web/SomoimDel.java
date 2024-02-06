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
import com.team5.util.Util;

@WebServlet("/somoimDel")
public class SomoimDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SomoimDel() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("mid")+"";
		int sno =Util.str2Int2(request.getParameter("sno"));
		SomoimDAO dao = new SomoimDAO();
		int result = 0;
		result = dao.del(sno, mid);
		if(result == 1) {
			response.setContentType("text/html; charset=UTF-8");

	        PrintWriter out = response.getWriter();
	        out.println("<html><head><title>Close Window</title></head><body>");
	        out.println("<script type=\"text/javascript\">");
	        out.println("opener.window.location.reload();");
	        out.println("alert('글이 삭제되었습니다.');");
	        out.println("window.close();"); // 창을 닫는 JavaScript 코드
	        out.println("</script>");
	        out.println("</body></html>");
			
		} else {
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
