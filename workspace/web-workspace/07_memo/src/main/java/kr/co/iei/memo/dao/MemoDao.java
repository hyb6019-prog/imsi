package kr.co.iei.memo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kr.co.iei.common.JDBCTemplate;
import kr.co.iei.memo.vo.Memo;

public class MemoDao {
	
	public ArrayList<Memo> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Memo> list = new ArrayList<Memo>();
		
		String query = "select * from memo_tbl order by 1";
		
				
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Memo m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoTitle(rset.getString("memo_title"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getString("write_date"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int insertMemo(Connection conn, Memo m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "INSERT INTO memo_tbl "
	             + "(memo_id, memo_title, memo_content, memo_writer, write_date)"
	             + "VALUES (memo_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'yyyy-mm-dd'))";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemoTitle());
			pstmt.setString(2, m.getMemoContent());
			pstmt.setString(3, m.getMemoWriter());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public Memo selectMemoId(Connection conn, int memoId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Memo m = null;
		String query = "select * from memo_tbl where memo_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memoId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoTitle(rset.getString("memo_title"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getNString("write_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	public int deleteMemo(Connection conn, int memoId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from memo_tbl where memo_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memoId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}	
	
	public int updateMemo(Connection conn, Memo m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = "update memo_tbl set memo_title=?, memo_content=?, memo_writer=? where memo_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemoTitle());
			pstmt.setString(2, m.getMemoContent());
			pstmt.setString(3, m.getMemoWriter());
			pstmt.setInt(4, m.getMemoId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
				JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Memo> selectMemoWriter(Connection conn, String memoWriter) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Memo> memo = new ArrayList<Memo>();
		String query = "select * from memo_tbl where memo_writer like ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+memoWriter+"%");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Memo m = new Memo();
				m.setMemoContent(rset.getString("memo_content"));
				m.setMemoId(rset.getInt("memo_id"));
				m.setMemoTitle(rset.getString("memo_title"));
				m.setMemoWriter(rset.getString("memo_writer"));
				m.setWriteDate(rset.getNString("write_date"));
				memo.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return memo;
	}
}