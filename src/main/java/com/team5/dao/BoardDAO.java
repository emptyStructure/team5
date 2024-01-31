package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.BoardDTO;

public class BoardDAO extends AbstractDAO {
	
	public List<BoardDTO> boardList(int page){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int startRow = (page - 1) * 10;
		ResultSet rs = null;
		String sql = "SELECT * FROM boardview LIMIT ? , 10";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			rs = pstmt.executeQuery();
			
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

	
	
}
