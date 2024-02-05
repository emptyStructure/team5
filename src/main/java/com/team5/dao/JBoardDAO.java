package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.team5.dto.*;

public class JBoardDAO extends AbstractDAO {

	public List<JBoardDTO> jBoardList(int page) {
		
	
		
		List<JBoardDTO> list = new ArrayList<JBoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM joonggo LIMIT ?, 10";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  (page - 1) * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JBoardDTO e = new JBoardDTO();
				e.setJno(rs.getInt("jno"));
				e.setJtitle(rs.getString("jtitle"));
				e.setJwrite(rs.getString("jwrite"));
				e.setJdate(rs.getString("jdate"));
				e.setJcount(rs.getInt("jcount"));
				e.setJsell(rs.getString("jsell"));
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
	Connection con =db.getConnection();
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	String sql = "SELECT COUNT(*) FROM joonggo";
	
	int result = 0;
	
	try {
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			result = rs.getInt(1);
		}
		
	} catch(SQLException e) { 
		e.printStackTrace();
	} finally {
		close(rs,pstmt,con);
	}
		// TODO Auto-generated method stub
		return result;
	}

public JBoardDTO detail(int no) {
	JBoardDTO dto = new JBoardDTO();
	Connection con = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT j.jno, j.jtitle, j.jcontent, m.mname as jboard_wirte, m.mid,j.jdate, j.jip, "
			+ "			(SELECT COUNT(*) FROM visitcount WHERE jno = j.jno) AS board_count "
			+ "			FROM joonggo j JOIN member m ON j.mno=m.mno WHERE j.jno=?";
	
	try {
		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1,no);
		rs= pstmt.executeQuery();
		
		if(rs.next()) {
			dto.setJno(rs.getInt("jno"));
			dto.setJtitle(rs.getString("jtitle"));
			dto.setJcontent(rs.getString("jcontent"));
			dto.setJwrite(rs.getString("jwrite"));
			dto.setJdate(rs.getString("jdate"));
			dto.setJcount(rs.getInt("jcount"));
			dto.setJmid(rs.getString("mid"));
			dto.setJip(rs.getString("jip"));
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	// TODO Auto-generated method stub
	return dto;
}

public int jwrite(JBoardDTO dto) {
	
	int result = 0; 
	
	Connection con = db.getConnection();
	PreparedStatement pstmt = null; 
	String sql = "INSERT INTO joonggo( jtitle, jcontent, mno, jip)"
			+"VALUES(?,?,(SELECT mno FROM member WHERE mid=?),?)";
	// TODO Auto-generated method stub
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getJtitle());
		pstmt.setString(2, dto.getJcontent());
		pstmt.setString(3, dto.getJmid());
		pstmt.setString(4, dto.getJip());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(null,pstmt,con);
	}
	
	return result;
}

}
