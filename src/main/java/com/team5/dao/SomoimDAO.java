package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.JoinSomoimDTO;
import com.team5.dto.SomoimDTO;

public class SomoimDAO extends AbstractDAO{
	//전체 글
	/*
	public List<SomoimDTO> list(int page){
		List<SomoimDTO> result = new ArrayList<SomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoimView limit ?,12";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*12);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SomoimDTO dto = new SomoimDTO();
				dto.setSno(rs.getInt(1));
				dto.setStitle(rs.getString(2));
				dto.setScontent(rs.getString(3));
				dto.setScategory(rs.getString(4));
				dto.setPersonnel(rs.getInt(5));
				dto.setSwriter(rs.getString(6));
				dto.setMno(rs.getInt(7));
				dto.setSdate(rs.getString(8));
				dto.setTotal(rs.getInt(9));
				dto.setWaiting(rs.getInt(10));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	*/
	public List<SomoimDTO> list(int page, String where){
		List<SomoimDTO> result = new ArrayList<SomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoimView "+ where
				+ " limit ?,12";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (page-1)*12);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SomoimDTO dto = new SomoimDTO();
				dto.setSno(rs.getInt(1));
				dto.setStitle(rs.getString(2));
				dto.setScontent(rs.getString(3));
				dto.setScategory(rs.getString(4));
				dto.setPersonnel(rs.getInt(5));
				dto.setSwriter(rs.getString(6));
				dto.setMno(rs.getInt(7));
				dto.setSdate(rs.getString(8));
				dto.setTotal(rs.getInt(9));
				dto.setWaiting(rs.getInt(10));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int totalCount(String where) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) from somoimView "+where;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	//내 글
	public List<SomoimDTO> list(String mid){
		List<SomoimDTO> result = new ArrayList<SomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoimView where mno=(SELECT mno FROM member WHERE MID = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SomoimDTO dto = new SomoimDTO();
				dto.setSno(rs.getInt(1));
				dto.setStitle(rs.getString(2));
				dto.setScontent(rs.getString(3));
				dto.setScategory(rs.getString(4));
				dto.setPersonnel(rs.getInt(5));
				dto.setSwriter(rs.getString(6));
				dto.setMno(rs.getInt(7));
				dto.setSdate(rs.getString(8));
				dto.setTotal(rs.getInt(9));
				dto.setWaiting(rs.getInt(10));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}

	public SomoimDTO detail(int no){
		SomoimDTO result = new SomoimDTO();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoimView where sno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result.setSno(rs.getInt(1));
				result.setStitle(rs.getString(2));
				result.setScontent(rs.getString(3));
				result.setScategory(rs.getString(4));
				result.setPersonnel(rs.getInt(5));
				result.setSwriter(rs.getString(6));
				result.setMno(rs.getInt(7));
				result.setSdate(rs.getString(8));
				result.setTotal(rs.getInt(9));
				result.setMid(rs.getString(11));
				result.setAddress(rs.getString(12));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	public int joinBool(int sno, String mid) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM joinSomoim WHERE sno=? AND mno=(SELECT mno FROM member WHERE MID = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int join(JoinSomoimDTO dto) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO joinSomoim (mno, mid, sno, name, ph, message) VALUES ((SELECT mno FROM member WHERE MID = ?),?,?,?,?,?)";
		int joinBool = joinBool(dto.getSno(),dto.getMid());
		if(joinBool==0) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getMid());
				pstmt.setString(2, dto.getMid());
				pstmt.setInt(3, dto.getSno());
				pstmt.setString(4, dto.getName());
				pstmt.setString(5, dto.getPh());
				pstmt.setString(6, dto.getMessage());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(null, pstmt, conn);
			}
		}
		
		return result;
	}

	public int write(SomoimDTO dto, String mid, String mname) {
		int result = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO somoim (stitle, scontent, scategory, personnel, mno, address) VALUES (?,?,?,?,(SELECT mno FROM member WHERE MID = ?),?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStitle());
			pstmt.setString(2, dto.getScontent());
			pstmt.setString(3, dto.getScategory());
			pstmt.setInt(4, dto.getPersonnel());
			pstmt.setString(5, mid);
			pstmt.setString(6, dto.getAddress());
			result = pstmt.executeUpdate();
			if(result==1) {
				result = selfInsert(mid, mname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	public int selfInsert(String mid, String mname) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql="INSERT INTO joinSomoim (mno, sno, name, ph, message, status, mid) "
				+ "VALUES ((SELECT mno FROM member WHERE MID = ?), "
				+ "(SELECT sno FROM somoim WHERE mno=(SELECT mno FROM member WHERE MID = ?) ORDER BY sno DESC LIMIT 0,1), "
				+ "?, 'Host','Host',1,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			pstmt.setString(3, mname);
			pstmt.setString(4, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	//지원자 status따라 출력
	public List<JoinSomoimDTO> joinList(int status){
		List<JoinSomoimDTO> result = new ArrayList<JoinSomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM joinSomoim WHERE status = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, status);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinSomoimDTO dto = new JoinSomoimDTO();
				dto.setJno(rs.getInt(1));
				dto.setMno(rs.getInt(2));
				dto.setSno(rs.getInt(3));
				dto.setName(rs.getString(4));
				dto.setPh(rs.getString(5));
				dto.setMessage(rs.getString(6));
				dto.setJoindate(rs.getString(7));
				dto.setStatus(rs.getInt(8));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	//지원자 전체 출력
	public List<JoinSomoimDTO> joinList(String mid,int sno){
		List<JoinSomoimDTO> result = new ArrayList<JoinSomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, j.joinno, j.mno, j.sno, j.name, j.ph, j.message, j.joinDate, j.status, s.stitle, j.mid "
				+ "FROM joinSomoim j JOIN somoim s ON j.sno = s.sno "
				+ "WHERE j.sno= ? and s.mno=(SELECT mno FROM member WHERE MID = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinSomoimDTO dto = new JoinSomoimDTO();
				dto.setNo(rs.getInt(1));
				dto.setJno(rs.getInt(2));
				dto.setMno(rs.getInt(3));
				dto.setSno(rs.getInt(4));
				dto.setName(rs.getString(5));
				dto.setPh(rs.getString(6));
				dto.setMessage(rs.getString(7));
				dto.setJoindate(rs.getString(8));
				dto.setStatus(rs.getInt(9));
				dto.setTitle(rs.getString(10));
				dto.setMid(rs.getString(11));
				result.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public List<JoinSomoimDTO> joinList(String mid, int sno, String status) {
		List<JoinSomoimDTO> result = new ArrayList<JoinSomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO,j.joinno, j.mno, j.sno, j.name, j.ph, j.message, j.joinDate, j.status, s.stitle, j.mid "
				+ "FROM joinSomoim j JOIN somoim s ON j.sno = s.sno "
				+ "WHERE j.sno= ? and s.mno=(SELECT mno FROM member WHERE MID = ?) AND status =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			pstmt.setString(2, mid);
			pstmt.setString(3, status);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinSomoimDTO dto = new JoinSomoimDTO();
				dto.setNo(rs.getInt(1));
				dto.setJno(rs.getInt(2));
				dto.setMno(rs.getInt(3));
				dto.setSno(rs.getInt(4));
				dto.setName(rs.getString(5));
				dto.setPh(rs.getString(6));
				dto.setMessage(rs.getString(7));
				dto.setJoindate(rs.getString(8));
				dto.setStatus(rs.getInt(9));
				dto.setTitle(rs.getString(10));
				dto.setMid(rs.getString(11));
				result.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public List<JoinSomoimDTO> myJoinList(String mid){
		List<JoinSomoimDTO> result = new ArrayList<JoinSomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, s.stitle, j.name, j.ph, j.message, j.joinDate, j.status, j.sno, j.joinno, j.mid, s.host FROM joinSomoim j JOIN (SELECT s.*, m.mid AS host FROM somoim s JOIN member m ON s.mno = m.mno) as s ON j.sno = s.sno WHERE j.mno=(SELECT mno FROM member WHERE MID = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinSomoimDTO dto = new JoinSomoimDTO();
				dto.setNo(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPh(rs.getString(4));
				dto.setMessage(rs.getString(5));
				dto.setJoindate(rs.getString(6));
				dto.setStatus(rs.getInt(7));
				dto.setSno(rs.getInt(8));
				dto.setJno(rs.getInt(9));
				dto.setMid(rs.getString(10));
				dto.setHost(rs.getString(11));
				result.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public List<JoinSomoimDTO> myJoinList(String mid, int status){
		List<JoinSomoimDTO> result = new ArrayList<JoinSomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, s.stitle, j.name, j.ph, j.message, j.joinDate, j.status, j.sno, j.joinno, j.mid, s.host FROM joinSomoim j JOIN (SELECT s.*, m.mid AS host FROM somoim s JOIN member m ON s.mno = m.mno) as s ON j.sno = s.sno WHERE j.mno=(SELECT mno FROM member WHERE MID = ?) AND j.status=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, status);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinSomoimDTO dto = new JoinSomoimDTO();
				dto.setNo(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setPh(rs.getString(4));
				dto.setMessage(rs.getString(5));
				dto.setJoindate(rs.getString(6));
				dto.setStatus(rs.getInt(7));
				dto.setSno(rs.getInt(8));
				dto.setJno(rs.getInt(9));
				dto.setMid(rs.getString(10));
				dto.setHost(rs.getString(11));
				result.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int respon(int respon, JoinSomoimDTO dto, String writer) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE joinSomoim SET status=? WHERE joinno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, respon);
			pstmt.setInt(2, dto.getJno());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
		}
		
		String greeting = "";
		switch(respon) {
		case 1:
			greeting = dto.getTitle()+" 모임에 참여하신걸 환영합니다!";
			break;
		case 0:
			greeting = dto.getTitle()+" 모임에 거절되었습니다.";
			break;
		case 4:
			greeting = dto.getTitle()+" 모임에서 추방당했습니다.";
			break;
		default :
			greeting = "";
		}
		if(greeting!="") {
			LetterDAO dao = new LetterDAO();
			result = dao.autoGreeting(dto, writer, greeting);
		}
		
		return result;
	}
	public int writerBool(int sno, String mid) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select count(*) from somoim WHERE sno=? AND mno=(SELECT mno FROM member WHERE MID = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sno);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	public int update(SomoimDTO dto, String mid) {
		int result = 0;
		System.out.println("업데이트 통과");
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE somoim SET stitle=?, scontent=?, scategory=?, personnel=?, address=? WHERE sno=? AND mno=(SELECT mno from member where mid = ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStitle());
			pstmt.setString(2, dto.getScontent());
			pstmt.setString(3, dto.getScategory());
			pstmt.setInt(4, dto.getPersonnel());
			pstmt.setString(5, dto.getAddress());
			pstmt.setInt(6, dto.getSno());
			pstmt.setString(7, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}
	public int del(int sno, String mid) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE somoim SET sdel=? WHERE sno=? AND mno=(SELECT mno from member where mid = ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "0");
			pstmt.setInt(2, sno);
			pstmt.setString(3, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		return result;
	}
	

}
