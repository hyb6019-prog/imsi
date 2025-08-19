package jdbc_memo_model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_memo_model.vo.Memo;

public class MemoDao {

	public ArrayList<Memo> selectAllMemo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		
		String query = "select * from memo_tbl";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Memo m = new Memo();
				m.setWriteDate(rset.getDate("write_date"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setMemoContent(rset.getString("memo_content"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<Memo> selectMemoName(Connection conn, String memoWriter) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		
		String query = "select * from memo_tbl where memo_writer like '%'||?||'%'";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memoWriter);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Memo m = new Memo();
				m.setWriteDate(rset.getDate("write_date"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setMemoContent(rset.getString("memo_content"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public int insertMemo(Connection conn, Memo m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = "insert into memo_tbl values(memo_seq.nextval,?,?,sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemoWriter());
			pstmt.setString(2, m.getMemoContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
