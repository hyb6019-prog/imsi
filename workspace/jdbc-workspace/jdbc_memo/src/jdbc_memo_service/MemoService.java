package jdbc_memo_service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc_memo_model.dao.MemoDao;
import jdbc_memo_model.vo.Memo;

public class MemoService {
	MemoDao memoDao = null;

	public MemoService() {
		super();
		memoDao = new MemoDao();
	}

	public ArrayList<Memo> selectAllMemo() {
		Connection conn = null;
		ResultSet rset = null;
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "memo", "1234");
			
			list = memoDao.selectAllMemo(conn);
				
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public ArrayList<Memo> selectMemoWriter(String memoWriter) {
		Connection conn = null;
		
		ArrayList<Memo> list = new ArrayList<Memo>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "memo", "1234");
			list = memoDao.selectMemoName(conn, memoWriter);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public int insertMemo(Memo m) {
		Connection conn = null;
		
		int result = 0; 
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "memo", "1234");
			result = memoDao.insertMemo(conn, m);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
