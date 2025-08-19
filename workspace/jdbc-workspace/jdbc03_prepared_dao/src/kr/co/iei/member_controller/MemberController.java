package kr.co.iei.member_controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

import kr.co.iei.member_model.dao.MemberDao;
import kr.co.iei.member_model.vo.Member;

public class MemberController {
	Scanner sc;
	MemberDao memberDao;
	
	public MemberController() {
		super();
		sc = new Scanner(System.in);
		memberDao = new MemberDao();
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
		//1. O
		//2. select * from member_tbl
		//3. 없음
		ArrayList<Member> list = memberDao.selectAllMember();
		System.out.println("\n---전체 회원 조회---\n");
		System.out.println("아이디\t비밀번호\t이름\t전화번호\t나이\t성별\t가입일");
		for(Member m : list) {
			System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getMemberAge()+"\t"+m.getMemberGender()+"\t"+m.getEnrollDate());
		}
		
	}
	
	public void selectMemberId() {
		//1. DB 작업 필요한지 ? O
		//2. 쿼리 : select * from member_tbl where member_id = ?
		//3. 입력받을 정보 : 아이디
		System.out.println("\n---아이디로 회원 조회----\n");
		System.out.print("조회 할 회원 아이디 입력 : ");
		String memberId = sc.next();
		
		//DB접속해서 필요한 DB작업 수행하고 결과 받아옴
		//	-> DB 관련 작업은 컨트롤러가 아닌 DAO가 처리
		
		//쿼리문 수행에 필요한 데이터(controller -> dao 로 데이터 전송 -> 메소드의 매개변수로 전달)
		//쿼리문의 결과(dao -> controller로 데이터 전송 -> 메소드의 리턴)
		
		//컨트롤러가 알아야 하는건 결과의 자료형
		Member m = memberDao.selectMemberId(memberId);
		if(m == null) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("아이디 : "+m.getMemberId());
			System.out.println("비밀번호 : "+m.getMemberPw());
			System.out.println("이름 : "+m.getMemberName());
			System.out.println("전화번호 : "+m.getMemberPhone());
			System.out.println("나이 : "+m.getMemberAge());
			System.out.println("성별 : "+m.getMemberGender());
			System.out.println("가입일 : "+m.getEnrollDate());
		}
	}
	
	public void selectMemberName() {
		
		System.out.println("\n---이름으로 회원 조회---\n");
		System.out.print("조회 할 회원 이름 : ");
		String memberName = sc.next();
		
		ArrayList<Member> list = memberDao.selectMemberName(memberName);
		if(list.isEmpty()) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("\n---이름으로 회원 조회---\n");
			System.out.println("아이디\t비밀번호\t이름\t전화번호\t나이\t성별\t가입일");
			for(Member m : list) {
				System.out.println(m.getMemberId()+"\t"+m.getMemberPw()+"\t\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getMemberAge()+"\t"+m.getMemberGender()+"\t"+m.getEnrollDate());
			}
		}
	}
	
	public void insertMember() {
		//1. DB 작업 필요 O
		//2. 쿼리 : insert into member_tbl values(?,?,?,?,?,?,sysdate)
		//3. 입력받을 정보 : 아이디,비밀번호,이름,전화번호,나이,성별
		System.out.println("\n--회원 정보 등록----\n");
		System.out.print("등록 할 회원 아이디 입력 : ");
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
		//컨트롤러 -> Dao로 전송할 데이터 : 아이디,비밀번호,이름,전화번호,나이,성별 -> 매개변수
		//Dao -> 컨트롤러로 리턴할 데이터 : 정수
//		int result = memberDao.insertMember(memberId,memberPw,memberName,memberPhone,memberAge,memberGender);
		Member m = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, null); 
		int result = memberDao.insertMember(m);
		if(result > 0) {
			System.out.println("회원 정보 등록 완료!");
		}else {
			System.out.println("정보 등록 실패!!");
		}
	}
	
	public void updateMember() {
		//select count(*) as cnt from member_tbl where member_id=?
		//select * from member_tbl where member_id=?
		//update member_tbl set member_pw=?, member_phone=? where member_id=?
		System.out.println("\n---회원 정보 수정---\n");
		System.out.print("수정 할 회원 아이디 : ");
		String memberId = sc.next();
		
		Member m = memberDao.selectMemberId(memberId);
		
		if(m == null) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("수정 할 회원 비밀번호 입력 : ");
			String memberPw = sc.next();
			System.out.println("수정 할 회원 전화번호 입력 : ");
			String memberPhone = sc.next();
			int result = memberDao.updateMember(memberPw, memberPhone, memberId);
			if(result > 0) {
				System.out.println("정보변경 성공");
			}else {
				System.out.println("정보변경 실패");
			}
		}
	}
	
	public void deleteMember() {
		//삭제로직  -> member_tbl(delete)
		//				-> select * from member_tbl where member_id=?
	    //				-> delete from member_tbl where member_id=?
		//			-> del_member_tbl(insert)
		//				-> insert into del_member_tbl values(아이디,이름,전화번호,sysdate)
		
		//입력받을정보 1개(아이디), 이름,전화번호는 DB에서 조회해서 자동으로 처리
		System.out.println("\n---회원 정보 삭제---\n");
		System.out.print("삭제 할 회원 아이디 입력 : ");
		String memberId = sc.next();
		Member m = memberDao.selectMemberId(memberId); //조회 먼저
		if(m != null) {
			int result1 = memberDao.deleteMember(memberId);
			if(result1 > 0) {
				int result2 = memberDao.insertDelMember(m);
				if(result2 > 0) {
					System.out.println("삭제 성공");
				}else {
					System.out.println("del_member_tbl에 insert 실패");
				}
			}else {
				System.out.println("member_tbl에서 삭제 실패");
			}
		}else {
			System.out.println("회원 정보를 조회할 수 없습니다.");
		}
	}
}
























