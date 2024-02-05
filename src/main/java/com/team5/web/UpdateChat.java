package com.team5.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.MessageDAO;
import com.team5.dto.MessageDTO;

@WebServlet("/updateChat")
public class UpdateChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateChat() {
        super();
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MessageDAO dao = new MessageDAO();
		List<MessageDTO> chatlist = dao.chatList();
		
		String chatHTML = convertChatListToHTML(chatlist);
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(chatHTML);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	private String convertChatListToHTML(List<MessageDTO> chatlist) {
		StringBuilder htmlBuilder = new StringBuilder();
		
		for (MessageDTO chat : chatlist) {
			htmlBuilder.append("<h4><i class=\"xi-user\"></i> ").append(chat.getMname()).append("</h4>");
			htmlBuilder.append("<h5>").append(chat.getMscontent()).append("<small>").append(chat.getSendDate())
			.append("</small></h5><br>");
		}
		
		return htmlBuilder.toString();
	}
}
