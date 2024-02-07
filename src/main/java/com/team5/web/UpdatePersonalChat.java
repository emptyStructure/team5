package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.MessageDAO;
import com.team5.dto.MessageDTO;
import com.team5.util.Util;

@WebServlet("/updatePersonalChat")
public class UpdatePersonalChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePersonalChat() {
        super();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDAO dao = new MessageDAO();
		MessageDTO dto = new MessageDTO();
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		int fromMno = (Integer) session.getAttribute("mno");
		int toMno = Util.str2Int(request.getParameter("toMno"));
		if (mid != null && fromMno > 0) {
		dto.setFromMno(fromMno);
		dto.setToMno(toMno);
		List<MessageDTO> personalchatlist = dao.personalChatList(dto);
		
		String chatHTML = convertChatListToHTML(personalchatlist);

		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(chatHTML);
		}
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private String convertChatListToHTML(List<MessageDTO> personalchatlist) {
		StringBuilder htmlBuilder = new StringBuilder();
		
		for (MessageDTO chat : personalchatlist) {
			htmlBuilder.append("<h4><i class=\"xi-user\"></i> ").append(chat.getMname()).append("</h4>");
			htmlBuilder.append("<h5>").append(chat.getMscontent()).append("<small>").append(chat.getSendDate())
			.append("</small></h5><br>");
		}
		
		return htmlBuilder.toString();
		
	}
}
