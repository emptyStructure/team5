package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.IndexDAO;
import com.team5.dto.BoardDTO;
import com.team5.dto.SomoimDTO;


@WebServlet("/index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Index() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		IndexDAO dao = new IndexDAO();
		
		List<BoardDTO> boardList = dao.boardList();	
		List<SomoimDTO> somList = dao.somList();
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("somList", somList);
		request.setAttribute("marketList", dao.marketList());
		
		RequestDispatcher rd = request.getRequestDispatcher("./index.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
