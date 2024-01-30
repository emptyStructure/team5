package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.dto.MessageDTO;

public class MessageDAO extends AbstractDAO {

	public List<MessageDTO> MessageList() {
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mname, mno FROM member";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MessageDTO e = new MessageDTO();
				e.setMname(rs.getString("mname"));
				e.setMno(rs.getInt("mno")); // 컬럼이름, 번호 둘 중하나로 통일
				list.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null, pstmt, con);
		}
		
		return list;
	}

}