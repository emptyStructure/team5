package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.MessageDTO;

public class MessageDAO extends AbstractDAO {

	public List<MessageDTO> MessageList() {
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mname, mno FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMname(rs.getString("mname"));
				e.setMno(rs.getInt("mno")); // 컬럼이름, 번호 둘 중하나로 통일
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return list;
	}

	public List<MessageDTO> receivedList() {
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mscontent, mname, toMno, fromMno, "
				+ "if(date_format(senddate, '%Y-%m-%d') = date_format(current_timestamp(), '%Y-%m-%d'), "
				+ "date_format(senddate, '%H:%i'), date_format(senddate, '%Y-%m-%d')) AS senddate, "
				+ "msdel "
				+ "FROM message JOIN member WHERE message.fromMno = member.mno";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMscontent(rs.getString("mscontent"));
				e.setMname(rs.getString("mname"));
				e.setToMno(rs.getInt("toMno"));
				e.setFromMno(rs.getInt("fromMno"));
				e.setSendDate(rs.getString("sendDate"));
				e.setMsdel(rs.getInt("msdel"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}

	public List<MessageDTO> sentList() {
List<MessageDTO> list = new ArrayList<MessageDTO>();
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mscontent, mname, toMno, fromMno, "
				+ "if(date_format(senddate, '%Y-%m-%d') = date_format(current_timestamp(), '%Y-%m-%d'), "
				+ "date_format(senddate, '%H:%i'), date_format(senddate, '%Y-%m-%d')) AS senddate, "
				+ "msdel "
				+ "FROM message JOIN member WHERE message.toMno = member.mno";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMscontent(rs.getString("mscontent"));
				e.setMname(rs.getString("mname"));
				e.setToMno(rs.getInt("toMno"));
				e.setFromMno(rs.getInt("fromMno"));
				e.setSendDate(rs.getString("sendDate"));
				e.setMsdel(rs.getInt("msdel"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}

	public List<MessageDTO> nameList() {
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mno, mid, mname FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMno(rs.getInt("mno"));
				e.setMid(rs.getString("mid"));
				e.setMname(rs.getString("mname"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}

	public int insertChat(MessageDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO message (toMno, fromMno, mscontent) VALUES (?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getToMno());
			pstmt.setInt(2, dto.getFromMno());
			pstmt.setString(3, dto.getMscontent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} close(null, pstmt, con);
		
		return result;
	}

	public List<MessageDTO> fromchatlist() {
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mscontent, "
				+ "if(date_format(sendDate, '%Y-%m-%d') = date_format(current_timestamp(), '%Y-%m-%d'), "
				+ "date_format(sendDate, '%H:%i'), date_format(sendDate, '%Y-%m-%d')) AS sendDate "
				+ "FROM message WHERE fromMno = 9";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMscontent(rs.getString("mscontent"));
				e.setSendDate(rs.getString("sendDate"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}

}