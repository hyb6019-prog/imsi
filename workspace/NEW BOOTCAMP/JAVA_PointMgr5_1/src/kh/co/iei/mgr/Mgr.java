package kh.co.iei.mgr;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kh.co.iei.model.vo.Gold;
import kh.co.iei.model.vo.Grade;
import kh.co.iei.model.vo.Silver;
import kh.co.iei.model.vo.Vip;

public class Mgr {

	Scanner sc;
	HashMap<String, Grade> members;
	
	
	public Mgr() {
		super();
		sc = new Scanner(System.in);
		members = new HashMap<String, Grade>();
		
		//test
		Grade g1 = new Silver("silver","회원1",1000);
		Grade g2 = new Silver("silver","회원2",2000);
		Grade g3 = new Gold("gold","회원3",1000);
		Grade g4 = new Gold("gold","회원4",2000);
		Grade g5 = new Vip("vip","회원5",1000);
		Grade g6 = new Vip("vip","회원6",2000);
		members.put("회원1", g1);
		members.put("회원2", g2);
		members.put("회원3", g3);
		members.put("회원4", g4);
		members.put("회원5", g5);
		members.put("회원6", g6);
	}



	public void main() {
		while(true) {
		System.out.println("1. 회원 정보 등록");
		System.out.println("2. 회원 정보 수정");
		System.out.println("3. 회원 정보 조회");
		System.out.println("4. 회원 정보 삭제");
		System.out.println("5. 모든 회원 조회");
		System.out.println("0. 종료");
		System.out.print("선택 > ");
		int select = sc.nextInt();
		
		switch (select) {
		case 1:	
			insertMember();
			break;
		case 2:
			updateMember();
			break;
		case 3:
			searchMember();
			break;
		case 4:
			deleteMember();
			break;
		case 5:
			printMembers();
			break;
		case 0:
			System.out.println("끌게");
			return;
			default :
				System.out.println("잘못된 입력");
		}//switch
		}//while
	}//main
	
	public void insertMember() {
		System.out.println("=== 등록 창 ===");
		System.out.println("등록할 등급 [silver/gold/vip] 입력");
		String grade =sc.next();
		System.out.println("등록할 이름 입력");
		String name = sc.next();
		System.out.println("등록할 포인트 입력");
		int point = sc.nextInt();
		
		switch (grade) {
		case "silver" :
			Grade s = new Silver(grade, name, point);
			members.put(name, s);
			break;
		case "gold" :
			Grade g = new Gold(grade, name, point);
			members.put(name, g);
			break;
		case "vip" :
			Grade v = new Vip(grade, name, point);
			members.put(name, v);
			break;
			default : 
				System.out.println("안돼");
		}//switch
	}
	
	public void updateMember() {
		System.out.println("=== 수정 창 ===");
		System.out.println("수정하고 싶은 회원 이름 입력 : ");
		String searchName = sc.next();
		
		System.out.println("수정할 등급 [silver/gold/vip] 입력");
		String grade =sc.next();
		System.out.println("수정할 이름 입력");
		String name = sc.next();
		System.out.println("수정할 포인트 입력");
		int point = sc.nextInt();
		if (!searchName.equals(name))
		{members.remove(searchName);
		}
		switch (grade) {
		case "silver" :
			Grade s = new Silver(grade, name, point);
			members.remove(searchName);
			members.put(name, s);
			break;
		case "gold" :
			Grade g = new Gold(grade, name, point);
			members.remove(searchName);
			members.put(name, g);
			break;
		case "vip" :
			Grade v = new Vip(grade, name, point);
			members.remove(searchName);
			members.put(name, v);
			break;
			default : 
				System.out.println("안돼");
		}//switch
	}
	
	public void searchMember() {
		System.out.println("=== 조회 창 ===");
		System.out.println("조회하고 싶은 회원 이름 입력 : ");
		String searchName = sc.next();
		if (members.containsKey(searchName)) {
			Grade g = members.get(searchName);
			System.out.println("등급 : "+g.getGrade());
			System.out.println("이름 : "+g.getName());
			System.out.println("포인트: "+g.getPoint());
			System.out.println("보너스: "+g.getBonusPoint());
		}else {
			System.out.println("없어");
		}
		
	}
	
	public void deleteMember() {
		System.out.println("=== 삭제 창 ===");
		System.out.println("삭제하고 싶은 회원 이름 입력 : ");
		String searchName = sc.next();
		
		if (members.containsKey(searchName)) {
			members.remove(searchName);
			System.out.println("됐어");
		}else {
			System.out.println("없어");
		}
	}
	
	public void printMembers() {
		System.out.println("=== 전체 출력 창 ===");
		System.out.println("등급\t이름\t포인트\t보너스");
		
		Set<String> names = members.keySet();
		for (String name : names) {
			Grade g = members.get(name);
			System.out.println(g.getGrade()+"\t"+g.getName()+"\t"+g.getPoint()+"\t"+g.getBonusPoint());
		}
		
	}
	
}
