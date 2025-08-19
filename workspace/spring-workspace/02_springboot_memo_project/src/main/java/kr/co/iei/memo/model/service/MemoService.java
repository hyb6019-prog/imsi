package kr.co.iei.memo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.iei.memo.model.dao.MemoDao;
import kr.co.iei.memo.model.vo.Memo;

@Service
public class MemoService {
	
	@Autowired
	private MemoDao memoDao;

	public List selectAllMemo() {
		List list = memoDao.selectAllMemo();	
		return list;
	}

	public List searchWriter(String memoWriter) {
		List list = memoDao.searchWriter(memoWriter);
		return list;
	}

	public int insertMemo(Memo m) {
		int result = memoDao.insertMemo(m);
		return result;
	}

	public Memo getMemo(int memoId) {
		Memo m = memoDao.getMemo(memoId);
		return m;
	}

	public Memo selectOneMemo(int memoId) {
		Memo m = memoDao.selectOneMemo(memoId);
		return m;
	}

	public int memoUpdate(Memo m) {
		int result = memoDao.memoUpdate(m);
		return result;
	}

	public int deleteMemo(int memoId) {
		int result = memoDao.deleteMemo(memoId);
		return result;
	}


}
