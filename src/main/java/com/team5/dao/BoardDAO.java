package com.team5.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.util.Util;
import com.team5.dto.BcommentDTO;
import com.team5.dto.BoardDTO;

public class BoardDAO extends AbstractDAO {
	
	public List<BoardDTO> boardList(int page){
		List<BoardDTO> list = null;
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM boardview LIMIT ? , 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, (page-1) * 10);
			rs = pstmt.executeQuery();
			list = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setBno(rs.getInt("bno"));
				e.setBtitle(rs.getString("btitle"));
				e.setBwrite(rs.getString("bwrite"));
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

	public int totalCount() {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM boardview";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return result;
	}

	public int bwrite(BoardDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO board (btitle, bcontent, mno, bip) "
				+ "VALUES(?,?,(SELECT mno FROM member WHERE mid=?), ?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setString(3, dto.getMid());
			pstmt.setString(4, dto.getBip());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		return result;
	}

	public void logWrite(String ip, String url, String data) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO iplog (iip, iurl, idata) VALUES (?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sql);
			pstmt.setString(2, ip);
			pstmt.setString(3, data);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
	}

	public BoardDTO detail(int bno) {
		BoardDTO dto = new BoardDTO();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT b.bno, b.btitle, b.bcontent, m.mname as bwrite, m.mid, b.bdate, b.bip, "
				+ "(SELECT COUNT(*) FROM visitcount WHERE bno=b.bno) AS bcount "
				+ "FROM board b JOIN member m ON b.mno=m.mno WHERE b.bno=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto.setBno(rs.getInt("bno"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setBcontent(rs.getString("bcontent"));
				dto.setBwrite(rs.getString("bwrite"));
				dto.setBdate(rs.getString("bdate"));
				dto.setBcount(rs.getInt("bcount"));
				dto.setMid(rs.getString("mid"));
				dto.setBip(rs.getString("bip"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return dto;
	}

	public int update(BoardDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET btitle=?, bcontent=? "
				+ "WHERE bno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getBtitle());
			pstmt.setString(2, dto.getBcontent());
			pstmt.setInt(3, dto.getBno());
			pstmt.setString(4, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close (null, pstmt, con);
		}
		return result;
	}

	public int delete(BoardDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET bdel='0' WHERE bno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBno());
			pstmt.setString(2, dto.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close (null, pstmt, con);
		}
		return result;
	}
	
	public void countUp(int bno, String mid) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM visitcount WHERE bno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int result = rs.getInt(1);
				if (result == 0) {
					realCountUp(bno, mid);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close (rs, pstmt, con);
		}
	}

	private void realCountUp(int bno, String mid) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO visitcount (bno, mno) VALUES(?, (SELECT mno FROM member WHERE mid=?))";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, mid);
			pstmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close (null, pstmt, con);
		}
	}

	public List<BcommentDTO> bcommentList(int bno) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM bcommentview WHERE bno=? and cdel='1'";
		List<BcommentDTO> list = new ArrayList<BcommentDTO>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BcommentDTO dto = new BcommentDTO();
				dto.setCno(rs.getInt("cno"));
				dto.setBno(rs.getInt("bno"));
				dto.setMno(rs.getInt("mno"));
				dto.setCcontent(rs.getString("ccontent"));
				dto.setCdate(rs.getString("cdate"));
				dto.setMid(rs.getString("mid"));
				dto.setMname(rs.getString("mname"));
				dto.setCip(Util.ipMasking(rs.getString("cip")));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close (rs, pstmt, con);
		}
		return list;
	}
}
