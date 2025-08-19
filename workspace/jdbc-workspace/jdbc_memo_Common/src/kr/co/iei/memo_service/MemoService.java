package kr.co.iei.memo_service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.co.iei.common.Common;
import kr.co.iei.model.dao.MemoDao;
import kr.co.iei.model.vo.Memo;

public class MemoService {
	
	MemoDao memoDao;
	

	public MemoService() {
		super();
		memoDao = new MemoDao();
	}


	public ArrayList<Memo> selectAllMember() {
		Connection conn = Common.getConnection();
		ArrayList<Memo> memo = memoDao.selectAllMember(conn);
		Common.close(conn);
		return memo;
	}


	public Memo selectMemoId(int memoId) {
		Connection conn = Common.getConnection();
		Memo m = memoDao.selectMemoId(conn, memoId);
		Common.close(conn);
		return m;
	}


	public ArrayList<Memo> selectMemoWriter(String memoWriter) {
		Connection conn = Common.getConnection();
		ArrayList<Memo> memo = memoDao.selectMemoWriter(conn, memoWriter);
		Common.close(conn);
		return memo;
	}

}
