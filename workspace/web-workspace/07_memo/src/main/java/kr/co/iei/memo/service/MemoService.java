package kr.co.iei.memo.service;
import java.sql.Connection;
import java.util.ArrayList;
import kr.co.iei.common.JDBCTemplate;
import kr.co.iei.memo.dao.MemoDao;
import kr.co.iei.memo.vo.Memo;
public class MemoService {
	
	private MemoDao memoDao;
	
	
	public MemoService() {
		super();
		memoDao = new MemoDao();
	}
	
	public ArrayList<Memo> selectAllMemo() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Memo> list = memoDao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertMemo(Memo m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memoDao.insertMemo(conn, m);
		if (result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Memo selectMemoId(int memoId) {
		Connection conn = JDBCTemplate.getConnection();
		Memo m = memoDao.selectMemoId(conn,memoId);
		JDBCTemplate.close(conn);
		return m;
	}

	public int deleteMemo(int memoId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = memoDao.deleteMemo(conn, memoId);	
		if (result > 0) {
	        JDBCTemplate.commit(conn);
	    } else {
	        JDBCTemplate.rollback(conn);
	    }
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int updateMemo(Memo m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memoDao.updateMemo(conn, m);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Memo> selectMemoWriter(String memoWriter) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Memo> memo = memoDao.selectMemoWriter(conn, memoWriter);
		JDBCTemplate.close(conn);
		return memo;
	}
	
}