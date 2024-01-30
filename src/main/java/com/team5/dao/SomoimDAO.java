package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.SomoimDTO;

public class SomoimDAO extends AbstractDAO{
	
	public List<SomoimDTO> list(){
		List<SomoimDTO> result = new ArrayList<SomoimDTO>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM somoim";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SomoimDTO dto = new SomoimDTO();
				dto.setMno(rs.getInt(1));
				dto.setStitle(rs.getString(2));
				dto.setScontent(rs.getString(3));
				dto.setScategory(rs.getString(4));
				dto.setMno(rs.getInt(5));
				dto.setSdate(rs.getString(6));
				dto.setSdel(rs.getInt(7));
				dto.setSimg(rs.getString(8));
				result.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return result;
	}

}
