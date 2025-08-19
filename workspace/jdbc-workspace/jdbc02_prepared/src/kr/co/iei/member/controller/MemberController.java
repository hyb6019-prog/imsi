package kr.co.iei.member.controller;


import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

import kr.co.iei.member.model.vo.Member;

public class MemberController {
	Scanner sc;

	public MemberController() {
		super();
		sc = new Scanner(System.in);
	}
	
	public void main() {
		while(true) {
			System.out.println("\n-----회원 관리 프로그램v2----\n");
			System.out.println("1. 전체 회원 조회");
			System.out.println("2. 아이디로 회원 조회");		
			System.out.println("3. 이름으로 회원 조회");		
			System.out.println("4. 회원 가입");
			System.out.println("5. 회원 정보 수정");
			System.out.println("6. 회원 탈퇴");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 >>");
			int select = sc.nextInt();
			switch (select) {
			case 1: 
				selectAllMember();
				break;
			case 2: 
				selectMemberId();
				break;
			case 3: 
				selectMemberName();
				break;
			case 4: 
				insertMember();
				break;
			case 5: 
				updateMember();
				break;
			case 6: 
				deleteMember();
				break;
			case 0:
				System.out.println("끝!");
				return;
			default:
				System.out.println("잘못입력하셨습니다.");
				break;
			
			}
		}
	}
	
	public void selectAllMember() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member_tbl";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				String memberId = rset.getString("member_id");
				String memberPw = rset.getString("member_pw");
				String memberName = rset.getString("member_name");
				int memberAge = rset.getInt("member_age");
				String memberGender = rset.getString("member_gender");
				String memberPhone = rset.getString("member_phone");
				Date enrollDate = rset.getDate("enroll_date");
				Member m = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, enrollDate); 
				list.add(m);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("\n---전체 회원 정보---\n");
		System.out.println("아이디\t비밀번호\t이름\t전화번호\t나이\t성별\t회원가입일");
		for(Member m : list) {
			System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getMemberAge()+"\t"+m.getMemberGender()+"\t"+m.getEnrollDate());
		}
	}
	
	public void selectMemberId() {
		//1. DB 작업 -> O
		//2. query = select * from member_tbl where member_id = '아이디'
		//3. 입력받아야 할 정보 : 아이디
		System.out.println("\n----아이디로 회원 조회-----\n");
		System.out.print("조회 할 아이디 : ");
		String memberId = sc.next();
		
		//0-1. 반환 할 객체 선언
		Connection conn = null;
//		Statement stmt= null;
		PreparedStatement pstmt = null; //쿼리문을 수행하고 결과를 받아오는 객체 (Statement -> PreparedStatement)
		ResultSet rset = null;
		
		//0-2. 결과 저장할 변수
		Member m = null;
		
		//0-3. 쿼리 작성
		//String query ="select * from member_tbl where member_id='"+memberId+"'";
		//PreparedStatment에서는 쿼리문에서 변수로 대체되어야 하는 부분을 ?로 표시
		String query = "select * from member_tbl where member_id= ?";
		// ? : 위치홀더 -> sql구문에 나타내는 토큰, 실제로 sql구문이 실행되기전에 값으로 다 대체되어야함
		//				-> 실행시점에 값으로 대체되지 않은 상태로 실행하면 에러발생
		// 위치홀더는 리터럴을 대체
		// -> 값에 대한 부분만 대체가 가능(테이블이름, 컬럼이름, 조건절에 사용한 컬럼이름, 연산자...등등 모두 불가능)
		// -> 위치홀더에 어떤 값이 들어가더라도 쿼리문 문법에는 변화가 없어야 함 -> 쿼리의 구조변경은 불가능
		
		try {
			//1. 드라이버 등록
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2. connection 생성
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			//3.  Statemnet 생성
//			stmt = conn.createStatement();
			//3. PreparedStatement
			pstmt = conn.prepareStatement(query); //객체 생성할때 쿼리문을 전달하면서 생성(위치홀더인 상태의 쿼리)
			//3-1. PrepaerdStatement가 받은 쿼리는 위치홀더가 들어간 쿼리 -> 실행전에 값으로 대체
			pstmt.setString(1, memberId);//1번 위치홀더 자리에 memberId값으로 대체
			//모든 위치홀더가 값으로 대체된 후 실행
			//4. 쿼리문 실행하고 결과 받아옴
			//5. 받아온 결과 저장
//			rset = stmt.executeQuery(query);
			rset = pstmt.executeQuery();//너 갖고 있는거 실행해//위에 생성시 쿼리 값을 줬기때문
			//쿼리 실행 시 매개변수로 쿼리문 전송하지 않음
			// -> PreparedStatement 객체 생성 시 위치홀더로 작성된 쿼리를 전송했고,
			// -> 위치홀더에 들어갈 값을 PreparedStatement에 매소드를 이용해서 처리
			// -> 값으로 대체된 완성된 쿼리는 PreparedStatement만 알고 있음 -> 완성된 쿼리 실행
			if(rset.next()) {
				m = new Member();
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setMemberGender(rset.getString("member_gender"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPw(rset.getString("member_pw"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(m == null) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("아이디 : "+m.getMemberId());
			System.out.println("비밀번호 : "+m.getMemberPw());
			System.out.println("이름 : "+m.getMemberName());
			System.out.println("전화번호 : "+m.getMemberPhone());
			System.out.println("나이 : "+m.getMemberGender());
			System.out.println("성별 : "+m.getMemberGender());
			System.out.println("회원가입일 : "+m.getEnrollDate());
		}
	}
	
	public void selectMemberName() {
		System.out.println("\n----이름으로 회원 조회-----\n");
		System.out.print("조회 할 이름 : ");
		String memberName = sc.next();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
//		String query = "select * from member_tbl where member_name like '%'||?||'%'";//연결연산자를 활용한 방법
		String query = "select * from member_tbl where member_name like ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, memberName);	//연결연산자를 활용한 방법
			pstmt.setString(1, "%"+memberName+"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Member m  = new Member();
				m.setEnrollDate(rset.getDate("enroll_Date"));
				m.setMemberAge(rset.getInt("member_age"));
				m.setMemberGender(rset.getString("member_gender"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberName(rset.getString("member_name"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberPw(rset.getString("member_pw"));
				list.add(m);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				rset.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		if(list.isEmpty()) {
			System.out.println("회원을 찾을 수 없습니다.");
		}else {
			System.out.println("\n---전체 회원 정보---\n");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t나이\t성별\t회원가입일");
			for(Member m : list) {
				System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getMemberAge()+"\t"+m.getMemberGender()+"\t"+m.getEnrollDate());
			}
		}
	}
	
	public void insertMember() {
		//입력받아야하는 정보 : 아이디,비밀번호,이름,전화번호,나이,성별
		System.out.println("\n----회원 정보 등록----\n");
		System.out.print("아이디 입력 : ");
		String memberId = sc.next();
		System.out.print("비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("이름 입력 : ");
		String memberName = sc.next();
		System.out.print("전화번호 입력 : ");
		String memberPhone = sc.next();
		System.out.print("나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.print("성별 입력 : ");
		String memberGender = sc.next();
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into member_tbl values(?,?,?,?,?,?,sysdate)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","jdbc_user","1234");
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			pstmt.setString(3, memberName);
			pstmt.setString(4, memberPhone);
			pstmt.setInt(5, memberAge);
			pstmt.setString(6, memberGender);
			result = pstmt.executeUpdate();
			
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
				pstmt.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result > 0) {
			System.out.println("회원 정보 등록 성공");
		}else {
			System.out.println("회원 정보 등록 실패");
		}
		
	}
	
	public void updateMember() {
		System.out.println("\n--- 회원 정보 수정 ---\n");
		System.out.print("수정 할 회원 아이디 : ");
		String memberId = sc.next();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		String query = "select count(*) cnt from member_tbl where member_id = ?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_user", "1234");
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			rset.next();
			result = rset.getInt("cnt");
			
			if(result == 1) {
				System.out.print("수정 할 회원 비밀번호 :  ");
				int memberPw = sc.nextInt();
				System.out.print("수정 할 회원 이름 : ");
				String memberName = sc.next();
				query = "update member_tbl set member_pw = ?, member_name = ? where member_id = ?";
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, memberPw);
				pstmt.setString(2, memberName);
				pstmt.setString(3, memberId);
				result = pstmt.executeUpdate();//업데이트 실행코드
				
				if(result > 0) {
					conn.commit();
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
				pstmt.close();
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result > 0) {
			System.out.println("회원정보 수정 성공");
		}else {
			System.out.println("회원정보 수정 실패");
		}
	}
	
	public void deleteMember() {
		System.out.println("\n--- 회원 정보 삭제 ---\n");
		System.out.print("삭제 할 회원 아이디 : ");
		String memberId = sc.next();
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		Member m = null;
		String query = "delete from member_tbl where member_id = ?";
		int result = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe", "jdbc_user", "1234");
			conn.getAutoCommit();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
			
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
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result > 0) {
			System.out.println("회원 정보 삭제 성공");
		}else {
			System.out.println("회원 정보 삭제 실패");
		}
	}
}



















