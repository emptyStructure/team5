package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.team5.dto.BoardDTO;
import com.team5.dto.MemberDTO;

public class InfoDAO extends AbstractDAO{
	
	//내정보 불러오기
	public MemberDTO myInfo(String mid) {
		MemberDTO dto = new MemberDTO();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mid, mname, mdate, mno, mpw, memail FROM member WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setMdate(rs.getString("mdate"));
				dto.setMno(rs.getInt("mno"));
				dto.setMpw(rs.getString("mpw"));
				dto.setMemail(rs.getString("memail"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}				
		
		return dto;
	}

	//내가 쓴 글 불러오기
	public List<BoardDTO> myBoard(String mid) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT bno, btitle, mno, bcount, "
				+ "DATE_FORMAT(bdate,'%Y. %m. %d') AS bdate "
				+ "from board WHERE mno=(SELECT mno FROM member WHERE mid=?) ORDER BY bno DESC";
		
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

	//내 소모임
/*	public List<Map<String, Object>> mySomoim(String mid) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT j.joinno, s.sno, s.stitle, s.scategory, DATE_FORMAT(j.joinDate,'%Y. %m. %d') AS joinDate "
				+ "FROM ( somoim s join joinSomoim j on (s.sno = j.sno)) "
				+ "WHERE j.mno=(SELECT mno FROM member WHERE mid=?) AND sdel='1' ORDER BY j.joinDate DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("joinno", rs.getInt("joinno"));
				e.put("sno", rs.getInt("sno"));
				e.put("stitle", rs.getString("stitle"));
				e.put("scategory", rs.getString("scategory"));
				e.put("joinDate", rs.getString("joinDate"));
				list.add(e);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
						
		return list;
	}*/

	//내 정보 수정
	public int changeInfo(MemberDTO dto) {
		int result = 0;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE member SET mpw=?, mname=?, memail=? WHERE mid=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMpw());
			pstmt.setString(2, dto.getMname());
			pstmt.setString(3, dto.getMemail());
			pstmt.setString(4, dto.getMid());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		
		return result;
	}

	//내 댓글보기
	public List<Map<String, Object>> myComments(String mid) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT cno, bno, ccontent, DATE_FORMAT(cdate, '%Y. %m. %d') AS cdate, "
				+ "cip FROM bcomment WHERE mno=(SELECT mno FROM member WHERE mid=?) AND cdel='1' "
				+ "ORDER BY cno DESC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("cno", rs.getInt("cno"));
				e.put("bno", rs.getInt("bno"));
				e.put("ccontent", rs.getString("ccontent"));
				e.put("cdate", rs.getString("cdate"));
				e.put("cip", rs.getString("cip"));
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
