package kr.co.iei.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.iei.member.model.dao.MemberDao;
import kr.co.iei.member.model.vo.Member;

//spring에게 객체 생성하라고 알려주는 어노테이션
@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	
	public List selectAllMember() {
		List list = memberDao.selectAllMember(); //mybatis는 ArrayList로 리턴하지 않고 List로 리턴함
		return list;
	}
	
	@Transactional	//commit,rollback
	public int insertMember(Member m) {
		int result = memberDao.insertMember(m);
		return result;
	}

	public Member selectOneMember(String memberId) {
		Member m = memberDao.selectOneMember(memberId);
		return m;
		
	}
	

}
