package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team5.db.DBConnection;
import com.team5.dto.*;

public class JBoardDAO extends AbstractDAO {

	public List<JBoardDTO> jBoardList(int page) {
		
	
		
		List<JBoardDTO> list = new ArrayList<JBoardDTO>();
		Connection con = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT j.jno, j.jtitle, j.jwrite, j.jdate, j.jimg, "
				+ "    IFNULL(vc.visit_count, 0) AS jcount, "
				+ "    j.jsell "
				+ "FROM joonggo j "
				+ "LEFT JOIN ( "
				+ "    SELECT jno, COUNT(*) AS visit_count "
				+ "    FROM jvisitcount "
				+ "    GROUP BY jno "
				+ ") AS vc ON j.jno = vc.jno "
				+ "WHERE j.jdel != '0' "
				+ "ORDER BY j.jdate DESC "
				+ "LIMIT ?, 10 ";
				
				
				
				
				/* "SELECT j.jno, j.jtitle, j.jwrite, j.jdate, "
				+ "    IFNULL(vc.visit_count, 0) AS jcount, "
				+ "    j.jsell "
				+ "FROM joonggo j "
				+ "LEFT JOIN ( "
				+ "    SELECT jno, COUNT(*) AS visit_count"
				+ "    FROM jvisitcount "
				+ "    GROUP BY jno "
				+ ") AS vc ON j.jno = vc.jno "
				+ "WHERE EXISTS (SELECT 1 FROM joonggo WHERE j.jno = joonggo.jno AND joonggo.jdel = 1 "
				+ "ORDER BY j.jdate DESC "
				+ "LIMIT ?, 10";*/
				
//				"SELECT jno, jtitle, jwrite, jdate, (SELECT COUNT(*) FROM jvisitcount WHERE jno = joonggo.jno) AS jcount , jsell  FROM joonggo LIMIT ?, 10";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,  (page - 1) * 10);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				JBoardDTO e = new JBoardDTO();
				e.setJno(rs.getInt("jno"));
				e.setJtitle(rs.getString("jtitle"));
				e.setJimg(rs.getString("jimg"));
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
	String sql = "SELECT j.jno, j.jtitle, j.jcontent, m.mname as jboard_write, m.mid as jmid,j.jdate,j.jsell, j.jip, "
			+ "			(SELECT COUNT(*) FROM jvisitcount WHERE jno = j.jno) AS jboard_count "
			+ "			FROM joonggo j JOIN member m ON j.mno=m.mno WHERE j.jno=?";
	
	try {
		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1,no);
		rs= pstmt.executeQuery();
		
		if(rs.next()) {
			dto.setJno(rs.getInt("jno"));
			dto.setJtitle(rs.getString("jtitle"));
			dto.setJcontent(rs.getString("jcontent"));
			dto.setJwrite(rs.getString("jboard_write"));
			dto.setJdate(rs.getString("jdate"));
			dto.setJcount(rs.getInt( "jboard_count"));
			dto.setJsell(rs.getString("jsell"));
			dto.setJmid(rs.getString("jmid"));
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
	String sql = "INSERT INTO joonggo( jtitle, jcontent,jimg,  mno, jwrite, jip)"
			+"VALUES(?,?,?,(SELECT mno FROM member WHERE mid=?),(SELECT mid FROM member WHERE mid=?) ,?)";
	// TODO Auto-generated method stub
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dto.getJtitle());
		pstmt.setString(2, dto.getJcontent());
		pstmt.setString(3, dto.getJimg());
		pstmt.setString(4, dto.getJmid());
		pstmt.setString(5, dto.getJmid());
		pstmt.setString(6, dto.getJip());
		
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(null,pstmt,con);
	}
	
	return result;
}




public void countUp(int no, String mid) {
	Connection con = db.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//String sql = "UPDATE board SET board_count = board_count + 1 WHERE board_no=?";
	String sql = "SELECT count(*) FROM jvisitcount "
			+ "WHERE jno=? AND mno=(SELECT mno FROM member WHERE mid=?)";
	
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setString(2, mid);
		//pstmt.execute();
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int result = rs.getInt(1);
			//System.out.println("해당 페이지에 내가 방문한 적이 있나? " + result);
			if(result == 0) { //읽은 적 없는 사람이 조회한다면~~
				realCountUp(no,mid);
			}
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(null, pstmt, con);
	}

}

private void realCountUp(int no, String mid) {
	
	Connection con = db.getConnection();
	PreparedStatement pstmt = null;
	String sql = "INSERT INTO jvisitcount (jno, mno) "
			+ "VALUES(?, (SELECT mno FROM member WHERE mid=?))";
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setString(2, mid);
		pstmt.execute();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(null, pstmt, con);		}
	
	
}




public int delete(JBoardDTO dto) {
	// TODO Auto-generated method stub
	
	int result = 0; 
	
	Connection con = DBConnection.getInstance().getConnection();
	
	PreparedStatement pstmt = null;
	
	String sql = "UPDATE joonggo " +
			"SET jdel = '0' " +
			"WHERE jno = ? " +
			"AND mno = (SELECT mno FROM member WHERE mid = ?)";
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,dto.getJno());
		pstmt.setString(2,dto.getJmid());
		result = pstmt.executeUpdate();
		
	} catch(SQLException e) { 
		e.printStackTrace();
		
	}finally {
		close(null, pstmt,con);
	}
	return result;
	
	
}




public int jupdate(JBoardDTO dto) {
	
	int result =0;
	
	Connection con =DBConnection.getInstance().getConnection();
	PreparedStatement pstmt = null ;
	String sql = "UPDATE joonggo SET jtitle=?,jsell=?, jcontent=? WHERE jno =? AND mno=(SELECT mno FROM member WHERE mid =?) ";
	
	
	try {
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,dto.getJtitle() );
		pstmt.setString(2, dto.getJsell());
		pstmt.setString(3,dto.getJcontent() );
		pstmt.setInt(4,dto.getJno() );
		pstmt.setString(5,dto.getJmid() );
		result = pstmt.executeUpdate();
	} catch(SQLException e) { 
		e.printStackTrace();
	}	finally { 
		close(null,pstmt,con);
	}
	
	return result;
}




}
