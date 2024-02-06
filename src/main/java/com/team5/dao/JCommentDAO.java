package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.util.Util;
import com.team5.dto.JCommentDTO;

public class JCommentDAO extends AbstractDAO {
	
	public List<JCommentDTO> commentList(int no) {
		List<JCommentDTO> list = new ArrayList<JCommentDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//String sql = "SELECT * FROM comment WHERE board_no=?";
		String sql = "SELECT * FROM jcommentview WHERE jno=?";
		
//		CREATE VIEW commentview as
//		SELECT c.cno, c.board_no, c.ccomment,
//		if(date_format(cdate,'%Y-%m-%d')=date_format(NOW(),'%Y-%m-%d'),
//		date_format(cdate,'%h-%i'),
//		date_format(cdate,'%Y-%m-%d')) AS cdate,
//		c.clike, m.mno, m.`mid`, m.mname
//		FROM comment c JOIN member m ON c.mno = m.mno
//		ORDER BY c.cno desc
			
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				JCommentDTO dto = new  JCommentDTO();
				dto.setJcno(rs.getInt("jcno"));
				dto.setJno(rs.getInt("jno"));
				dto.setJccontent(rs.getString("jccontent"));
				dto.setJcdate(rs.getString("jcdate"));
				dto.setMno(rs.getInt("mno"));
				//뷰 만들어서 mname, mid 가져오게 하기
				dto.setJcmid(rs.getString("mid"));
				dto.setJcmname(rs.getString("mname"));
				/* dto.setJcip(Util.ipMasking(rs.getString("cip"))); */
				
				list.add(dto);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, con);
		}
		
		return list;
	}
	
	
	
	
	
	
	

	public int jcommentWrite(JCommentDTO dto) {
		
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		int result =0;
		String sql = "INSERT INTO jcomment (jccontent, jno, mno, jcip)  "
					+"VALUES (? ,?,(SELECT mno FROM member WHERE mid=?), ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getJccontent());
			pstmt.setInt(2, dto.getJno());
			pstmt.setString(3, dto.getJcmid());
			pstmt.setString(4, dto.getJcip());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null,pstmt, con);
		}
			
		// TODO Auto-generated method stub
		return result;
	}
	

	
	

}
