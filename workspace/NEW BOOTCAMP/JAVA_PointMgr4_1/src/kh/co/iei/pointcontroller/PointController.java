package kh.co.iei.pointcontroller;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

import kh.co.iei.model.Gold;
import kh.co.iei.model.Grade;
import kh.co.iei.model.Silver;
import kh.co.iei.model.Vip;

public class PointController {

	Scanner sc;

	ArrayList<Grade> members;

	public PointController() {
		super();

		sc = new Scanner(System.in);
		members = new ArrayList<Grade>();

		// test

		Grade g1 = new Silver("silver", "회원1", 1000);
		Grade g2 = new Silver("silver", "회원2", 2000);
		Grade g3 = new Gold("gold", "회원3", 1000);
		Grade g4 = new Gold("gold", "회원4", 2000);
		Grade g5 = new Vip("vip", "회원5", 1000);
		Grade g6 = new Vip("vip", "회원6", 2000);
		members.add(g1);
		members.add(g2);
		members.add(g3);
		members.add(g4);
		members.add(g5);
		members.add(g6);
	}

	public void main() {
		while (true) {
			System.out.println("========== 포인트 매니저 v4 ==========");
			System.out.println("1.회원 등록");
			System.out.println("2.회원 조회");
			System.out.println("3.회원 수정");
			System.out.println("4.회원 삭제");
			System.out.println("5.전체 회원 출력");
			System.out.println("0.프로그램 종료");
			System.out.print("선택 >>> ");

			try {
				int select = sc.nextInt();
				switch (select) {
				case 1:
					regMember();
					break;
				case 2:
					printMember();
					break;
				case 3:
					updateMember();
					break;
				case 4:
					deleteMember();
					break;
				case 5:
					printMembers();
					break;
				case 0:
					System.out.println("종료");
					return;
				default:
					System.out.println("0~5 범위 안의 숫자만 가능합니다. ");
				}// switch();
			} catch (InputMismatchException e) {
				sc.nextLine();
				System.out.println("숫자 0~5 를 입력해주세요. ");
				continue;
			} // catch
		} // while();
	}// main();

	public void regMember() {

		System.out.println("\n========== 회원 정보 등록 ==========\n");
		while (true) {
			try {
				System.out.print("등록할 회원 등급 [silver/gold/vip] 입력 : ");
				String grade = sc.next();
				if (grade.equals("silver") || grade.equals("gold") || grade.equals("vip")) {

					System.out.print("등록할 회원 이름 입력 : ");
					String name = sc.next();
					System.out.print("등록할 회원 포인트 입력 : ");
					int point = sc.nextInt();
					switch (grade) {
					case "silver":
						Grade s = new Silver(grade, name, point);
						members.add(s);
						System.out.println("등록 완료");
						break;
					case "gold":
						Grade g = new Gold(grade, name, point);
						members.add(g);
						System.out.println("등록 완료");
						break;
					case "vip":
						Grade v = new Gold(grade, name, point);
						members.add(v);
						System.out.println("등록 완료");
						break;
					}
				} // if();
				else {
					System.out.println("[silver/gold/vip] 중 하나를 입력하세요.");
					continue;
				}
				break;
			} catch (InputMismatchException e) {
				System.out.println("Invalid input");
				continue;
			} // catch();
		} // while();
	}// regMember();

	public int searchMember(String name) {

		for (int i = 0; i < members.size(); i++) {
			Grade g = members.get(i);
			String searchName = g.getName();

			if (name.equals(searchName)) {
				return i;
			} // if();
		} // for();
		return -1;
	}//

	public void printMember() {
		System.out.println("========== 회원 정보 조회 ==========");
		System.out.print("조회할 회원 이름 입력 :");
		String name = sc.next();

		int searchIndex = searchMember(name);

		if (searchIndex == -1) {
			System.out.println("못 찾음.");
		} else {
			Grade g = members.get(searchIndex);
			System.out.println("등급 : " + g.getGrade());
			System.out.println("이름: " + g.getName());
			System.out.println("포인트 : " + g.getPoint());
			System.out.println("보너스 : " + g.getBonusPoint());
		}
	}// printMember();

	public void updateMember() {
		System.out.println("\n========== 회원 정보 수정==========\n");
		System.out.print("수정하고싶은 회원 이름 입력 : ");
		String searchName = sc.next();

		System.out.print("수정할 회원 등급 [silver/gold/vip] 입력 : ");
		String grade = sc.next();
		System.out.print("수정할 회원 이름 입력 : ");
		String name = sc.next();
		System.out.print("수정할 회원 포인트 입력 : ");
		int point = sc.nextInt();

		int searchIndex = searchMember(searchName);

		if (searchIndex == -1) {
			System.out.println("못 찾음.");
		} else {
			switch (grade) {
			case "silver":
				Grade s = new Silver(grade, name, point);
				members.set(searchIndex, s);
				System.out.println("수정 완료");
				break;
			case "gold":
				Grade g = new Gold(grade, name, point);
				members.set(searchIndex, g);
				System.out.println("수정 완료");
				break;
			case "vip":
				Grade v = new Gold(grade, name, point);
				members.set(searchIndex, v);
				System.out.println("수정 완료");
				break;
			default:
				System.out.println("Invalid input");
			}// switch();
		} // else();

	}// updateMember();

	public void deleteMember() {
		System.out.println("\n========== 회원 정보 수정==========\n");
		System.out.print("삭제하고싶은 회원 이름 입력 : ");
		String searchName = sc.next();

		int searchIndex = searchMember(searchName);

		if (searchIndex == -1) {
			System.out.println("못 찾음.");
		} else {
			members.remove(searchIndex);
			System.out.println("삭제 완료");
		} // else();

	}// deleteMember();

	public void printMembers() {
		System.out.println("\n========== 전체 학생 출력 ==========\n");
		System.out.println("등급\t이름\t포인트\t보너스");
		System.out.println("==================================");
		for (Grade g : members) {
			System.out.println(g.getGrade() + "\t" + g.getName() + "\t" + g.getPoint() + "\t" + g.getBonusPoint());
		}
	}
}// class();
