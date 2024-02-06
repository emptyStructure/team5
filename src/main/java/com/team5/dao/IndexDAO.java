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
import com.team5.dto.SomoimDTO;

public class IndexDAO extends AbstractDAO{

	public List<BoardDTO> boardList() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT bno, btitle, "
				+ "DATE_FORMAT(bdate,'%Y. %m. %d. %h:%i') AS bdate "	
				+ "FROM board ORDER BY bno desc LIMIT 0, 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO e = new BoardDTO();
				e.setBno(rs.getInt(1));
				e.setBtitle(rs.getString(2));
				e.setBdate(rs.getString(3));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}				
		
		return list;
	}

	public List<SomoimDTO> somList() {
		List<SomoimDTO> list = new ArrayList<SomoimDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT sno, stitle, "
				+ "if(date_format(current_timestamp(),'%Y. %m. %d') = DATE_FORMAT(sdate,'%Y. %m. %d'),date_format(sdate,'%h:%i'),date_format(sdate,'%m. %d')) AS sdate "
				+ "FROM somoim ORDER BY sno desc LIMIT 0, 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SomoimDTO e = new SomoimDTO();
				e.setSno(rs.getInt("sno"));
				e.setStitle(rs.getString("stitle"));
				e.setSdate(rs.getString("sdate"));
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		
		return list;
	}

	public List<Map<String, Object>> marketList() {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT jno, jtitle, "
				+ "if(date_format(CURRENT_TIMESTAMP(),'%Y. %m. %d') = DATE_FORMAT(jdate,'%Y. %m. %d'),date_format(jdate,'%h:%i'),date_format(jdate,'%m. %d')) AS jdate "
				+ "FROM joonggo ORDER BY jno DESC LIMIT 0, 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("jno", rs.getInt("jno"));
				e.put("title", rs.getString("jtitle"));
				e.put("date", rs.getString("jdate"));
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
