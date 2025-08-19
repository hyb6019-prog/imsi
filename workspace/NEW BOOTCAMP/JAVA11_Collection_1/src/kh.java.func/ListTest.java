package kh.java.func;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class ListTest {

	public void test1() {
		// 길이가 3인 문자열을
		String[] arr = new String[3]; // 배열은 객체 생성시 길이를 지정해주어야함.
		// 문자열을 관리할 리스트 생성
		// 리스트로 관리할 데이터의 타입을 제네릭으로 설정.
		// 리스트는 생성시 길이지정 하지 않음. (사용한 만큼 길이를 갖고있음)
		ArrayList<String> list = new ArrayList<String>();

		System.out.println("배열의 길이 : " + arr.length);
		arr[0] = "hello";
		arr[1] = "hi";
//			arr[2] = "안녕";
		// arr[3] = "추가"; //배열은 지정한 길이를 초과해서 넣을 수 없음
		System.out.println("배열의 길이 : " + arr.length);

		System.out.println("리스트의 길이 : " + list.size());
		// add(data) : data를 리스트의 가장 마지막에 추가
		list.add("Hello");
		System.out.println("리스트의 길이 : " + list.size());
		list.add("Hi");
		System.out.println("리스트의 길이 : " + list.size());
//			list.add("안녕");
		System.out.println("리스트의 길이 : " + list.size());

//			list.add(10,"추가"); -> ERROR; 10X2 
		System.out.println("리스트의 길이 : " + list.size());

		// 배열에서 데이터 가져오는 방법 : 배열이름[인덱스 번호]
		System.out.println(arr[1]);

		// 리스트에서 데이터 가져오는 방법 : 리스트이름.get(index)
		System.out.println(list.get(1));

		// 반복문을 이용한 출력(배열)
		for (int i = 0; i < arr.length; i++) {
			String str = arr[i];
			System.out.println(i + " : " + str);
		} //

		// 반복문을 이용한 출력(리스트)
		for (int i = 0; i < list.size(); i++) {
			String str = list.get(i);
			System.out.println(i + " : " + str);
		}

	}

	public void test2() {
		Scanner sc = new Scanner(System.in);

		// 정수를 입력받는 List 생성
		ArrayList<Integer> list = new ArrayList<Integer>();
		while (true) {
			System.out.print("정수를 입력하세요 : ");
			int num = sc.nextInt();
			list.add(num);
			System.out.println("한번 더 입력하시겠습니까? [y/n]");
			String select = sc.next();
			if (select.toLowerCase().equals("n")) {
				break;
			}
		}//while();
		/*
		 * for(int i=0;i<list.size();i++) { Integer num = list.get(i);
		 * System.out.println(num); }
		 */

		// foreach : 컬렉션 전체 순회하는 반복문
		// 사용 조건
		// 1. 컬렉션 내부의 처음부터 끝까지 모든 값을 다 꺼내올 떄
		// 2. i값이 데이터를 꺼내오는 목적외에 사용되지 않을 때
		for(Integer num :list) {
			System.out.println(num);
		}
	}//
	
	public void test3() {
		//정수를 저장할 리스트
		
		//List 의 가장 큰 특징 기억할 것.
		//순서를 기억함, 중복데이터 가능함. <- 배열의 특징과 닮아있음.
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(10);
		list.add(100);
		list.add(50);
		list.add(20);
		list.add(840);
		System.out.println(list.size());
		//ArrayList 는 기본적으로 toString()을 오버라이딩해서 내부 데이터를 출력하는 형태로 변경해두었다.
		System.out.println(list);
		//get(index) : 매개변수로 전달한 정수의 위치에 있는 객체를 가져옴.
		System.out.println(list.get(2));
		//add(parma1) ; 매개변수로 전달된 값을 리스트 가장 뒤에 추가
		list.add(100);
		System.out.println(list);
		//add(param1,param2) : 첫번째 매개변수 위치에 두번째 매개변수 값을 추가함.
		list.add(3, 200);
		System.out.println(list);
		//set(param1,param2) : 첫번째 매개변수 위치의 데이터를 두번째 매개변수 값으로 수정함.
		list.set(3, 1000);
		System.out.println(list);
		//remove(param1) : 매개변수 위치의 데이터를 삭제 -> 삭제된 인덱스를 기준으로 데이터들이 1칸씩 당겨짐.
		Integer data = list.remove(3); //데이터를 삭제하면서 리턴함. !!!
		System.out.println(list);
		System.out.println(data);
		
		
		//contains(param1) : 매개변수로 전달한 값이 리스트에 있는지 확인해서 논리형으로 리턴함.
		boolean bool1 = list.contains(100);
		boolean bool2 = list.contains(1000);
		boolean bool3 = list.contains("안녕");
		System.out.println("bool1 : "+bool1);
		System.out.println("bool2 : "+bool2);
		
		//indexOf(param) : 매개변수로 전달한 값이 리스트에 몇번째 있는지 확인해서 인덱스 번호를 리턴.
		int num1 = list.indexOf(100);
		int num2 = list.indexOf(1000);
		System.out.println("num1 :"+num1);
		System.out.println("num2 :"+num2); //존재하지 않으면 -1.
		
		//정렬 SORT : Collections.sort(리스트) : 매개변수로 전달한 리스트를 정려
		Collections.sort(list); //<- 오름차순
		System.out.println(list); 
		
		//내림차순은 지원하지 않지만, 순서 반전이 가능함.
		
		//순서반전 : Collections.reverse(리스트) : 매개변수로 전달한 리스트의 순서를 반전
		Collections.reverse(list);
		System.out.println(list);
		
		System.out.println(list.size() == 0);
		
		//isEmpty() -> getter 처럼 논리형을 return. : list.size() == 0 결과를 리턴 -> 리스트에 데이터가 있는지 논리형으로 반환
		System.out.println(list.isEmpty());
		//clear() : 리스트 내부의 모든 데이터를 삭제
		list.clear();
		System.out.println(list);
		System.out.println(list.isEmpty());
	}
}
