package com.team5.web;

import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MessageDAO;
import com.team5.dto.MessageDTO;
import com.team5.util.Util;

@WebServlet("/personalchat")
public class PersonalChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PersonalChat() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		int fromMno = (Integer) session.getAttribute("mno");
		int toMno = Util.str2Int(request.getParameter("toMno"));
		int result = 0;
		MessageDAO dao = new MessageDAO();
		List<MessageDTO> userlist = dao.userList();
		request.setAttribute("userlist", userlist);
		
		System.out.println("실행전 결과값: " + result);
		if (mid != null && fromMno > 0) {
			MessageDTO dto = new MessageDTO();
			dto.setFromMno(fromMno);
			dto.setToMno(toMno);
			List<MessageDTO> personalchatlist = dao.personalChatList(dto);
			request.setAttribute("personalchatlist", personalchatlist);
			result = 1;
			System.out.println("실행후 결과값: " + result);
			System.out.println(personalchatlist);

			RequestDispatcher dispatcher = request.getRequestDispatcher("personalchat.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		String mid = (String) session.getAttribute("mid");
		int fromMno = (Integer) session.getAttribute("mno");
		int toMno = Util.str2Int(request.getParameter("toMno"));
		int result = 0;
		if (mid != null && fromMno > 0) {
			dto.setFromMno(fromMno);
			dto.setToMno(toMno);
			String mscontent = request.getParameter("mscontent");
			mscontent = mscontent.replaceAll("<br>", "");
			mscontent = mscontent.replaceAll("<script>", "");
			mscontent = mscontent.replaceAll("</script>", "");
			mscontent = mscontent.replaceAll("<style>", "");
			mscontent = mscontent.replaceAll("</style>", "");
			mscontent = mscontent.replaceAll("<a>", "");
			mscontent = mscontent.replaceAll("</a>", "");
			mscontent = mscontent.replaceAll("<form>", "");
			mscontent = mscontent.replaceAll("</form>", "");
			mscontent = mscontent.replaceAll("<button>", "");
			mscontent = mscontent.replaceAll("</button>", "");
			mscontent = mscontent.replaceAll("<input>", "");
			mscontent = mscontent.replaceAll("</input>", "");
			mscontent = mscontent.replaceAll("자바", "아잉");
			mscontent = mscontent.replaceAll("코딩", "아잉");
			mscontent = mscontent.replaceAll("html", "아잉");
			mscontent = mscontent.replaceAll("css", "아잉");
			dto.setMscontent(mscontent); //ajax를 통해 받은 채팅값
			result = dao.personalChatting(dto);
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} else {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		}
	}

}
