package kr.co.iei.member.controller;

import java.util.ArrayList;
import java.util.Scanner;

import kr.co.iei.member.medel.service.MemberService;
import kr.co.iei.member.medel.vo.Member;

public class Controller {

	Scanner sc;
	MemberService service;
	public Controller() {
		super();
		sc = new Scanner(System.in);
		service = new MemberService();
		
	}
	
	public void main() {
		while(true) {
			System.out.println("\n--- 회원 관리 프로그램v5 ---\n");
			System.out.println("1. 전체 회원 조회");
			System.out.println("2. 아이디로 회원 조회");		
			System.out.println("3. 이름으로 회원 조회");		
			System.out.println("4. 회원 정보 등록");
			System.out.println("5. 회원 정보 수정");
			System.out.println("6. 회원 정보 삭제");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 >> ");
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
		System.out.println("\n--- 전체 회원 조회 ---\n");
		ArrayList<Member> list = service.selectAllMember();
		System.out.println("아이디\t이름\t나이\t성별");
		for(Member m : list) {
			System.out.println(m.getMemberId()+"\t"+m.getMemberName()+"\t"+m.getMemberAge()+"\t"+m.getMemberGender());
		}
	}
	
	public void selectMemberId() {
		System.out.println("\n--- 아이디로 회원 조회 ---\n");
		System.out.print("조회 할 아이디 입력 : ");
		String memberId = sc.next();
		Member m = service.selectMemberId(memberId);
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
		System.out.println("\n--- 이름으로 회원 조회 ---\n");
		System.out.print("조회 할 회원 이름 입력 : ");
		String memberName = sc.next();
		ArrayList<Member> list = service.selectMemberName(memberName);
		if(list.isEmpty()) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.println("아이디\t이름\t전화번호\t가입일");
			for(Member m : list) {
				System.out.println(m.getMemberId()+"\t"+m.getMemberName()+"\t"+m.getMemberPhone()+"\t"+m.getEnrollDate());
			}
		}
	}
	
	public void insertMember() {
		/*
		System.out.println("\n--- 회원 정보 등록 ---\n");
		System.out.print("등록 할 아이디 입력 : ");
		String memberId = sc.next();
		System.out.print("등록 할 비밀번호 입력 : ");
		String memberPw = sc.next();
		System.out.print("등록 할 이름 입력 : ");
		String memberName = sc.next();
		System.out.print("등록 할 전화번호 입력 : ");
		String memberPhone = sc.next();
		System.out.print("등록 할 나이 입력 : ");
		int memberAge = sc.nextInt();
		System.out.print("등록 할 성별 입력 : ");
		String memberGender = sc.next();
		
		Member m = new Member(memberId, memberPw, memberName, memberPhone, memberAge, memberGender, null);
		int result = service.insertMember(m);
		if(result > 0) {
			System.out.println("동록 성공");
		}else {
			System.out.println("등록 실패");
		}
		*/
		System.out.println("\n--- 회원 정보 등록 ---\n");
		Member m = new Member();
		
		while(true) {
			System.out.print("등록 할 아이디 입력 : ");
			String memberId = sc.next();
			Member member = service.selectMemberId(memberId);
			if(member == null) {
				m.setMemberId(memberId);
				break;
			}else {
				System.out.println("이미 사용중인 아이디입니다.");
			}
			
		}
		System.out.print("등록 할 비밀번호 입력 : ");
		String memberPw = sc.next();
		m.setMemberPw(memberPw);
		System.out.print("등록 할 이름 입력 : ");
		String memberName = sc.next();
		m.setMemberName(memberName);
		System.out.print("등록 할 전화번호 입력 : ");
		m.setMemberPhone(sc.next());
		System.out.print("등록 할 나이 입력 : ");
		m.setMemberAge(sc.nextInt());
		System.out.print("등록 할 성별 입력 : ");
		m.setMemberGender(sc.next());
		
		int result = service.insertMember(m);
	}
	
	public void updateMember() {
		System.out.println("\n---회원 정보 수정---\n");
		System.out.print("수정 할 회원 아이디 : ");
		String memberId = sc.next();
		
		Member m = service.selectMemberId(memberId);
		if(m == null) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			System.out.print("수정 할 비밀번호 입력 : ");
			String memberPw = sc.next();
			System.out.print("수정 할 전화번호 입력 : ");
			String memberPhone = sc.next();
			
			int result = service.updateMember(memberPw, memberPhone, memberId);
			if(result > 0) {
				System.out.println("회원 정보 수정 성공");
			}else {
				System.out.println("회원 정보 수정 실패");
			}
		}
	}
	
	public void deleteMember() {
		System.out.println("\n---회원 정보 삭제---\n");
		System.out.print("삭제 할 회원 아이디 입력 : ");
		String memberId = sc.next();
		int result = service.deleteMember(memberId);
		if(result == 2) {
			System.out.println("회원 삭제 성공");
		}else if(result == 1) {
			System.out.println("insert 실패");
		}else if(result  == 0) {
			System.out.println("delete 실패");
		}else if(result == -1) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}
	}
}

































