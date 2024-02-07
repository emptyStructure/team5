package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.SomoimDAO;
import com.team5.dto.SomoimDTO;
import com.team5.util.Util;

@WebServlet("/somoim")
public class Somoim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Somoim() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		SomoimDAO dao = new SomoimDAO();
		/*페이지 설정*/
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Util.str2Int2(request.getParameter("page"));
		}
		
		/*select부분 확인*/
		String category = request.getParameter("category");
		String select = request.getParameter("select");
		String sql = "";
		
		String cate = "";
		if(category!=null) {
			switch(category) {
			case "meal" :
				cate = "'식사'";
				break;
			case "game" :
				cate = "'게임'";
				break;
			case "study" :
				cate = "'공부'";
				break;
			case "drinking" :
				cate = "'유흥'";
				break;
			default :
				cate="";
				break;
			}
		}
		String sel = "";
		if(select!=null) {
			switch(select) {
			case "recruiting" :
				sel = "personnel > total";
				break;
			case "complete" :
				sel = "personnel = total";
				break;
			default : 
				sel = "";
				break;
			}
		}
		
		if(cate!=null&&cate!="" && sel!=null&&sel!="") {
			//둘 다 값이 있는 경우
			sql = "WHERE scategory ="+cate+" AND "+sel;
		} else if((cate!=null&&cate!="")||(sel==null&&sel=="")) {
			//카테고리만 값이 있는 경우
			sql = "WHERE scategory ="+cate;
		} else if((cate==null&&cate=="")||(sel!=null&&sel!="")) {
			//select만 값이 있는 경우
			sql = "WHERE "+sel;
		} else {
			sql = "";
		}
		
		int totalCount = dao.totalCount(sql);
		List<SomoimDTO> list = dao.list(page, sql);
		
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.setAttribute("category", category);
		request.setAttribute("select", select);
		
		RequestDispatcher rd = request.getRequestDispatcher("somoim.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
