package kr.co.iei.controller;

import java.util.ArrayList;
import java.util.Scanner;

import kr.co.iei.memo_service.MemoService;
import kr.co.iei.model.vo.Memo;

public class Controller {
	Scanner sc;
	MemoService memoService;
	public Controller() {
		super();
		sc = new Scanner(System.in);
		memoService = new MemoService();
	}
	
	public void main() {
		while(true) {
			System.out.println("\n---메모장-----\n");
			System.out.println("1. 전체 메모 보기");
			System.out.println("2. 아이디로 메모 조회");
			System.out.println("3. 작성자로 메모 조회");
			System.out.println("4. 메모 등록");		
			System.out.println("5. 메모 삭제");
			System.out.println("6. 메모 수정");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 >> ");
			int select = sc.nextInt();
			switch (select) {
			case 1: 
				selectAllMember();
				break;
			case 2: 
				selectMemoId();
				break;
			case 3: 
				selectMemoWriter();
				break;
			case 4: 
				break;
			case 5: 
				break;
			case 6: 
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
		ArrayList<Memo> memo = memoService.selectAllMember();
		System.out.println("\n--- 전체 메모 조회 ---\n");
		System.out.println("아이디\t작성자\t내용\t작성일");
		for(Memo m : memo) {
			System.out.println(m.getMemoId()+"\t"+m.getMemoWriter()+"\t"+m.getMemoContent()+"\t"+m.getWriteDate());
		}
	}
	
	public void selectMemoId() {
		System.out.println("\n--- 아이디로 메모 조회 ---\n");
		System.out.print("조회 할 아이디 입력 : ");
		int memoId = sc.nextInt();
		Memo m = memoService.selectMemoId(memoId);
		if(m != null) {
			System.out.println("\n아이디\t작성자\t내용\t작성일");
			System.out.println(m.getMemoId()+"\t"+m.getMemoWriter()+"\t"+m.getMemoContent()+"\t"+m.getWriteDate());
		}else {
			System.out.println("회원 정보를 찾지 못했습니다.");
		}
	}
	
	public void selectMemoWriter() {
		System.out.println("\n--- 작성자로 메모 찾기 ---\n");
		System.out.print("조회 할 작성자명 입력 : ");
		String memoWriter = sc.next();
		ArrayList<Memo> memo = memoService.selectMemoWriter(memoWriter);
		if(memo.isEmpty()) {
			System.out.println("회원 정보를 찾지 못했습니다.");
		}else {
			System.out.println("\n아이디\t작성자\t내용\t작성일");
			for(Memo m : memo) {
				System.out.println(m.getMemoId()+"\t"+m.getMemoWriter()+"\t"+m.getMemoContent()+"\t"+m.getWriteDate());
			}
		}
	}

}



























