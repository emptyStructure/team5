package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.LetterDTO;

public class LetterDAO extends AbstractDAO {

	public List<LetterDTO> receiveList(String writer) {
		List<LetterDTO> list = new ArrayList<LetterDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM letter where receiver=? order by date desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LetterDTO dto = new LetterDTO();
				dto.setLno(rs.getInt(1));
				dto.setReceiver(rs.getString(2));
				dto.setLtitle(rs.getString(3));
				dto.setMsg(rs.getString(4));
				dto.setWriter(rs.getString(5));
				dto.setDate(rs.getString(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public List<LetterDTO> letterList(String mid) {
		List<LetterDTO> list = new ArrayList<LetterDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM letter where writer = ? OR receiver = ? order by date desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LetterDTO dto = new LetterDTO();
				dto.setLno(rs.getInt(1));
				dto.setReceiver(rs.getString(2));
				dto.setLtitle(rs.getString(3));
				dto.setMsg(rs.getString(4));
				dto.setWriter(rs.getString(5));
				dto.setDate(rs.getString(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public List<LetterDTO> sentList(String receiver) {
		List<LetterDTO> list = new ArrayList<LetterDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM letter where writer=? order by date desc";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, receiver);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LetterDTO dto = new LetterDTO();
				dto.setLno(rs.getInt(1));
				dto.setReceiver(rs.getString(2));
				dto.setLtitle(rs.getString(3));
				dto.setMsg(rs.getString(4));
				dto.setWriter(rs.getString(5));
				dto.setDate(rs.getString(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
	}
	
	public int searchUser(LetterDTO dto) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) from member where mid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReceiver());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			if(result==1) {
				System.out.println("존재하는 사용자");
				result = letterWrite(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
	}
	public int letterWrite(LetterDTO dto) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO letter (receiver,ltitle, msg, writer) VALUES (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReceiver());
			pstmt.setString(2, dto.getLtitle());
			pstmt.setString(3, dto.getMsg());
			pstmt.setString(4, dto.getWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return result;
	}
	
	public LetterDTO detail(int lno, String mid) {
		LetterDTO dto = new LetterDTO();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM letter where lno=? AND (writer = ? OR receiver = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lno);
			pstmt.setString(2, mid);
			pstmt.setString(3, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setLno(rs.getInt(1));
				dto.setReceiver(rs.getString(2));
				dto.setLtitle(rs.getString(3));
				dto.setMsg(rs.getString(4));
				dto.setWriter(rs.getString(5));
				dto.setDate(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return dto;
	}
}
	