package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.team5.dto.MemberDTO;

public class MemberDAO extends AbstractDAO{

	public MemberDTO login(MemberDTO dto) {
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		
		return dto;
	}

}
