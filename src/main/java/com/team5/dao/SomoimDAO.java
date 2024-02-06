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
	public List<SomoimDTO> list(){
		List<SomoimDTO> result = new ArrayList<SomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoimView";
		try {
			pstmt = conn.prepareStatement(sql);
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
	
	public int join(JoinSomoimDTO dto, String mid) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO joinSomoim (mno, sno, name, ph, message) VALUES ((SELECT mno FROM member WHERE MID = ?),?,?,?,?)";
		int joinBool = joinBool(dto.getSno(),mid);
		if(joinBool==0) {
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setInt(2, dto.getSno());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getPh());
				pstmt.setString(5, dto.getMessage());
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
		
		String sql = "INSERT INTO somoim (stitle, scontent, scategory, personnel, mno) VALUES (?,?,?,?,(SELECT mno FROM member WHERE MID = ?))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStitle());
			pstmt.setString(2, dto.getScontent());
			pstmt.setString(3, dto.getScategory());
			pstmt.setInt(4, dto.getPersonnel());
			pstmt.setString(5, mid);
			result = pstmt.executeUpdate();
			if(result==1) {
				String sql2="INSERT INTO joinSomoim (mno, sno, name, ph, message, status) "
						+ "VALUES ((SELECT mno FROM member WHERE MID = ?), "
						+ "(SELECT sno FROM somoim WHERE mno=(SELECT mno FROM member WHERE MID = ?) ORDER BY sno DESC LIMIT 0,1), "
						+ "?, 'Host','Host',1)";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, mid);
				pstmt.setString(2, mid);
				pstmt.setString(3, mname);
				result = pstmt.executeUpdate();
			}
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
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, j.joinno, j.mno, j.sno, j.name, j.ph, j.message, j.joinDate, j.status, s.stitle "
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
		String sql = "SELECT ROW_NUMBER() OVER ( ORDER BY joinno) AS NO,j.joinno, j.mno, j.sno, j.name, j.ph, j.message, j.joinDate, j.status, s.stitle "
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
		String sql = "SELECT  ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, s.stitle, j.name, j.ph, j.message, j.joinDate, j.status, j.sno FROM joinSomoim j JOIN somoim s ON j.sno = s.sno WHERE j.mno=(SELECT mno FROM member WHERE MID = ?)";
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
				dto.setJno(rs.getInt(8));
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
		String sql = "SELECT  ROW_NUMBER() OVER ( ORDER BY joinno) AS NO, s.stitle, j.name, j.ph, j.message, j.joinDate, j.status, j.sno FROM joinSomoim j JOIN somoim s ON j.sno = s.sno WHERE j.mno=(SELECT mno FROM member WHERE MID = ?) AND j.status=?";
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
				dto.setJno(rs.getInt(8));
				result.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int respon(int respon, String jno) {
		int result = 0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "UPDATE joinSomoim SET status=? WHERE joinno=?";
		System.out.println(respon);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, respon);
			pstmt.setString(2, jno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(null, pstmt, conn);
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
	

}
