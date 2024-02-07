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

@WebServlet("/chatting")
public class Chatting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Chatting() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		MessageDAO dao = new MessageDAO();
		
		List<MessageDTO> userlist = dao.userList();
		request.setAttribute("userlist", userlist);
		
		// 화면에 나올 전체 채팅 목록 chatlist
		List<MessageDTO> chatlist = new ArrayList<MessageDTO>();
		chatlist = dao.chatList();
		request.setAttribute("chatlist", chatlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("chatting.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		String mid = (String) session.getAttribute("mid");
		if (mid != null) {
			dto.setMid(mid); // 로그인 세션의 id값
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
			int result = dao.chatting(dto);
			PrintWriter pw = response.getWriter();
			pw.print(result);
		}

		
	}

}
