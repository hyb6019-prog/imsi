package jdbc_memo_controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Scanner;

import jdbc_memo_model.vo.Memo;
import jdbc_memo_service.MemoService;

public class MemoController {
	Scanner sc;
	MemoService memoService;
	
	public MemoController() {
		super();
		sc = new Scanner(System.in);
		memoService = new MemoService();
	}

	public void main() {
		while(true) {
			System.out.println("\n---메모장-----\n");
			System.out.println("1. 전체 메모 보기");
			System.out.println("2. 작성자로 메모 조회");		
			System.out.println("3. 메모 등록");		
			System.out.println("4. 메모 삭제");
			System.out.println("5. 메모 수정");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 >> ");
			int select = sc.nextInt();
			switch (select) {
			case 1: 
				selectAllMemo();
				break;
			case 2: 
				selectMemoWriter();
				break;
			case 3: 
				insertMemo();
				break;
			case 4: 
				break;
			case 5: 
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
	
	public void selectAllMemo() {
		ArrayList<Memo> list = memoService.selectAllMemo();
		System.out.println("\n----- 전체 메모 조회 -------\n");
		System.out.println("ID\t작성자\t내용\t\t작성일");
		for(Memo m : list) {
			System.out.println(m.getMemoId()+"\t"+m.getMemoWriter()+"\t"+m.getMemoContent()+"\t\t"+m.getWriteDate());
		}
	}
	
	public void selectMemoWriter() {
		System.out.println("\n---작성자로 메모 조회---\n");
		System.out.print("조회 할 작성자 입력 : "); 
		String memoWriter = sc.next();
		
		ArrayList<Memo> list = memoService.selectMemoWriter(memoWriter);
		System.out.println("\n----- 전체 메모 조회 -------\n");
		System.out.println("ID\t작성자\t작성일\t내용");
		for(Memo m : list) {
			System.out.println(m.getMemoId()+"\t"+m.getMemoWriter()+"\t"+m.getWriteDate()+"\t\t"+m.getMemoContent());
		}
		
	}
	public void insertMemo() {
		System.out.println("\n---메모 등록---\n");
		System.out.print("등록 할 작성자 입력: ");
		String memoWriter = sc.next();
		System.out.print("등록 할 메모 내용 : ");
		String memoContent = sc.nextLine();
		sc.nextLine();
		
		Memo m = new Memo(0, memoWriter, memoContent, null);
		int result = memoService.insertMemo(m);
		if(result > 0) {
			System.out.println("메모 등록 성공");
		}else {
			System.out.println("메모 등록 실패");
		}
	}
}























