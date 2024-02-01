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
				dto.setSwriter(rs.getString(5));
				dto.setMno(rs.getInt(6));
				dto.setSdate(rs.getString(7));
				dto.setTotal(rs.getInt(8));
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
				result.setSwriter(rs.getString(5));
				result.setMno(rs.getInt(6));
				result.setSdate(rs.getString(7));
				result.setTotal(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}
	
	public int join(JoinSomoimDTO dto, String mid) {
		int result = 0;
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO joinSomoim (mno, sno, name, ph, message) VALUES ((SELECT mno FROM member WHERE MID = ?),?,?,?,?)";
		
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
		return result;
	}

	public int write(SomoimDTO dto, String mid) {
		int result = 0;

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO somoim (stitle, scontent, scategory, mno) VALUES (?,?,?,(SELECT mno FROM member WHERE MID = ?))";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStitle());
			pstmt.setString(2, dto.getScontent());
			pstmt.setString(3, dto.getScategory());
			pstmt.setString(4, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, conn);
		}
		
		return result;
	}

}
