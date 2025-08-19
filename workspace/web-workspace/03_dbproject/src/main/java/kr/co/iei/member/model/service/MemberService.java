package kr.co.iei.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;
import kr.co.iei.common.JDBCTemplate;
import kr.co.iei.member.model.dao.MemberDao;
import kr.co.iei.member.model.vo.Member;
public class MemberService {
	
	private MemberDao memberDao;
	
	
	public MemberService() {
		super();
		memberDao = new MemberDao();
	}
	
	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = MemberDao.selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = memberDao.insertMember(conn,m);
		if (result >0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Member selectMemberId(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = MemberDao.selectMemberId(conn,memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = memberDao.deleteMember(conn, memberId);	
				
		JDBCTemplate.close(conn);
		return result;
	}
}