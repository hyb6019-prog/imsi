package lotto.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

public class Main {
	Scanner sc;
	Random r;
	ArrayList<Integer> list;
	ArrayList<Integer> cList;
	HashSet<Integer> num;
	HashSet<Integer> cNum;
	boolean power;

	public Main() {
		super();
		sc = new Scanner(System.in);
		r = new Random();
		num = new HashSet<Integer>();
		cNum = new HashSet<Integer>();

		list = new ArrayList<Integer>();
		cList = new ArrayList<Integer>();
		power = true;
	}

	public void main() {
		while (power) {
			System.out.println("========== 로또 프로그램 ==========");
			
			for (int i = num.size(); i < 6; i++) {
				try {
					System.out.println(i + 1 + "번째 번호 입력 (1~45) : ");
					int inputNum = sc.nextInt();
				if (!num.add(inputNum)) {
					System.out.println("이미 중복된 번호입니다. 다시 입력해 주세요.");
					--i;
				} else if (inputNum < 1 || inputNum > 45) {
					System.out.println("잘못 입력하셨습니다. 1~45 중 하나의 숫자를 입력하세요.");
					--i;
				} 
				}catch(InputMismatchException e){
					System.out.println("숫자를 입력하세요. (1~45)");
					sc.nextLine();
					--i;
					continue;
				}
			} // for
			
			// 컴퓨터
			for (int j = cNum.size(); j < 6; j++) {
				int comNum = r.nextInt(45) + 1;
				if (!cNum.add(comNum)) {
					--j;
				} 
			} // for

			list = new ArrayList<Integer>(num);
			System.out.println("사용자 번호");
			Collections.sort(list);
			System.out.println(list);

			cList = new ArrayList<Integer>(cNum);
			System.out.println("컴퓨터 번호");
			Collections.sort(cList);
			System.out.println(cList);

			
			int result = 0;
			// 검사 - 구식
			/*
			for (int i =0 ; i < list.size();  i++) {
				for (int j = 0; j < cList.size();  j++) {
					if (list.get(i) == cList.get(j)) {
						result += 1;
					} // if
				} // for
			} // for
			*/
			
			//NEW 검사 
			for(Integer num : list) { // ArrayList 가 아니라 set 이어도 상관 없음. 
//				<- 일반 for문은 list 만 가능. 
				for(Integer cNum : cList) {
					if(num == cNum) {
						result++;
						break;
					}
				}
			}
			
			
			//참고할만한 검사 방법들
			
			
			/*for(Integer num : userSet) {
				boolean bool = comSet.add(num);
				if(!bool) {
					count++;
				}
			}*/
			
			/*
			for(int i =0; i<num.size();i++) {
				int aNum = list.get(i);
				if(cList.indexOf(num) != -1) {
					result++;
				}
				
				if (cList.contains(cNum)) {
					result++;
				}
			}*/
			
			System.out.println("맞은 개수 : " + result);
			switch (result) {
			case 6:
				System.out.println("1등! ");
				break;
			case 5:
				System.out.println("2등! ");
				break;
			case 4:
				System.out.println("3등! ");
				break;
			default:
				System.out.println("꽝.. ");
				break;
			}

			while (true) {
				try {
				System.out.println("한번 더 하시겠습니까? [1. yes / 2. no]");
				int select = sc.nextInt();
				if (select == 1 ) {
					num.removeAll(list);
					cNum.removeAll(cList);
					break;
				}
				else if (select == 2) {
					power = false;
					System.out.println("종료");
					break;
				} else {
					System.out.println("Invalid input, please enter 1 or 2");
				}
				}catch (InputMismatchException e) {
					System.out.println("Invalid input, please enter 1 or 2");
					sc.nextLine();
					continue;
				}
			}//while
		}
	}
}
