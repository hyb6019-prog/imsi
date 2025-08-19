package kr.co.iei.member.service;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.co.iei.member.model.dao.MemberDao;
import kr.co.iei.member.model.vo.Member;

public class MemberService {
	MemberDao memberDao;

	public MemberService() {
		super();
		memberDao = new MemberDao();
	}

	public ArrayList<Member> selectAllmember() {
		//0-1. 반환할 객체 생성
		Connection conn = null;
		//0-2. 되돌려 줄 변수 선언
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			//1. 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. Connection 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			//service에서 생성한 connection 객체를 dao에 매개변수로 전달(servicce에서 생성한 connection을 사용하려고)
			list = memberDao.selectAllMember(conn); //내가 주는 커넥션객체 써!
			//DB작업이 다 끝났는지 체크
			//추가적인 DB 작업이 있는 경우 -> conn을 재사용해서 DB 작업 수행
			//추가적인 DB 작업이 없는 경우 -> commit, rollback 필요한지 체크하고 수행
			
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

	public Member selectMemberId(String memberId) {
		Connection conn = null;
		Member m = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			m = memberDao.selectMemberId(conn, memberId);
			
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
		return m;
	}

	public ArrayList<Member> selectMemberName(String memberName) {
		Connection conn = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			list = memberDao.selectMemberName(conn, memberName);
			
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

	public int insertMember(Member m) {
		Connection conn = null;
		
		int result = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			conn.setAutoCommit(false);
			result = memberDao.insertMember(conn, m);
			if(result > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
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
		return result;
	}

	public int updateMember(String memberPw, String memberPhone, String memberId) {
		Connection conn = null;
				
		int result = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			conn.setAutoCommit(false);
			result = memberDao.updateMember(conn, memberPw, memberPhone, memberId);
			if(result > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
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
		return result;
	}

	public int deleteMember(String memberId) {
		//select * from member_tbl where member_id=?
		//delete from member_tbl where member_id=?
		//insert into dem_member_tbl values(아이디,이름,전화번호,sysdate)
		Connection conn = null;
		int result = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			conn.setAutoCommit(false);
			Member m = memberDao.selectMemberId(conn, memberId);
			//DB작업이 추가로 있는지? -> 회원정보가 조회되면 추가작업있고 / 조회안되면 없음
			if(m != null) {
				result = memberDao.deleteMember(conn, memberId);
				//DB작업이 추가로 있는지? -> 삭제에 성공했으면 추가작업있고 / 삭제실패했으면 없음
				if(result > 0) {
					result = memberDao.insertDelMember(conn, m);
					if(result > 0) {
						conn.commit();
					}else {
						conn.rollback();
					}
				}else {
					conn.rollback();
				}
			}
			
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
		return result;
	}
	
	
}





















