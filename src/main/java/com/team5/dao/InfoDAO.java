package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.BoardDTO;
import com.team5.dto.MemberDTO;

public class InfoDAO extends AbstractDAO{
	
	public MemberDTO myInfo(String mid) {
		MemberDTO dto = new MemberDTO();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mid, mname, mdate, mno, mpw FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setMdate(rs.getString("mdate"));
				dto.setMno(rs.getInt("mno"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}				
		
		return dto;
	}

	public List<BoardDTO> myBoard(String mid) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT bno, btitle, mno, bdate, bcount "
				+ "from board WHERE mno=(SELECT mno FROM member WHERE mid=?) LIMIT 0, 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setBno(rs.getInt("bno"));
				e.setBtitle(rs.getString("btitle"));
				e.setMno(rs.getInt("mno"));
				e.setBdate(rs.getString("bdate"));
				e.setBcount(rs.getInt("bcount"));
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
