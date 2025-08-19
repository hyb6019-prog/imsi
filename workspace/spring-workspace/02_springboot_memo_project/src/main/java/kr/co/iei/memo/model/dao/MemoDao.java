package kr.co.iei.memo.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.iei.memo.model.vo.Memo;

@Mapper
public interface MemoDao {

	List selectAllMemo();

	int insertMemo(Memo m);

	List searchWriter(String memoWriter);

	Memo getMemo(int memoId);

	Memo selectOneMemo(int memoId);

	int memoUpdate(Memo m);

	int deleteMemo(int memoId);

}
