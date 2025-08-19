package kr.co.iei.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.iei.common.Common;
import kr.co.iei.model.vo.Memo;

public class MemoDao {

	
	
	public ArrayList<Memo> selectAllMember(Connection conn) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Memo> memo = new ArrayList<Memo>();
		String query = "select * from memo_tbl";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Memo m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getDate("write_date"));
				memo.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Common.close(pstmt);
			Common.close(rset);
		}
		return memo;
	}

	public Memo selectMemoId(Connection conn, int memoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Memo m = new Memo();
		String query = "select * from memo_tbl where memo_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memoId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getDate("write_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Common.close(pstmt);
			Common.close(rset);
		}
		return m;
	}

	public ArrayList<Memo> selectMemoWriter(Connection conn, String memoWriter) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Memo> memo = new ArrayList<Memo>();
		String query = "select * from memo_tbl where memo_writer like '%'||?||'%'";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memoWriter);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Memo m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getDate("wriet_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			Common.close(pstmt);
			Common.close(rset);
		}
		return memo;
	}

}














