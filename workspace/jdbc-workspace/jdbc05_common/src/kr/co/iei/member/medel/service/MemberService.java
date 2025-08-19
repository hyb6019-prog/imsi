package kr.co.iei.member.medel.service;

import java.sql.Connection;
import java.util.ArrayList;

import kr.co.iei.member.common.JDBCTemplate;
import kr.co.iei.member.medel.dao.MemberDao;
import kr.co.iei.member.medel.vo.Member;

public class MemberService {
	
	MemberDao memberDao;

	public MemberService() {
		super();
		memberDao = new MemberDao();
	}

	public  ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = memberDao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Member selectMemberId(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = memberDao.selectMemberId(conn,memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public ArrayList<Member> selectMemberName(String memberName) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = memberDao.selectMemberName(conn,memberName);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memberDao.insertMember(conn, m);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateMember(String memberPw, String memberPhone, String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memberDao.updateMember(conn, memberPw, memberPhone, memberId);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = -1;
		Member m = memberDao.selectMemberId(conn, memberId); 
		if(m != null) {
			result = memberDao.deleteMember(conn, memberId); 
			if(result > 0) {
				result = memberDao.insertDeleteMember(conn, m); 
				if(result == 2) {
					JDBCTemplate.commit(conn);
				}else {
					JDBCTemplate.rollback(conn);
				}
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
}
