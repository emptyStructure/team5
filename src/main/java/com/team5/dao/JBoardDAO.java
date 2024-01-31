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
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		return list;
		
		}

/*public List<JBoardDTO> jBoardList() {
		
		// 컨텍션을 해주고 
		
		List<JBoardDTO> list = new ArrayList<JBoardDTO>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM joonggo";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JBoardDTO e = new JBoardDTO();
				e.setJno(rs.getInt("jno"));
				e.setJtitle(rs.getString("jtitle"));
				e.setJwrite(rs.getString("jwrite"));
				e.setJdate(rs.getString("jdate"));
				e.setJcount(rs.getInt("jcount"));
				list.add(e);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
		
		// 프리페어드 
		// 리절트셋 
		// 
		
		
		
		// TODO Auto-generated method stub
		
	}*/
		




public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
