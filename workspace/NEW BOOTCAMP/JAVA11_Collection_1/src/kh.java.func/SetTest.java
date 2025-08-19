package kh.java.func;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

public class SetTest {

	public void test1() {
		HashSet<Integer> set = new HashSet<Integer>();
		System.out.println("set 내부의 데이터 수 : "+set.size());
		
		//add(param) : 파라미터로 받은 데이터를 set에 추가하고 그 결과를 boolean 형으로 리턴
		//->중복체크를 위함
		
		boolean b1 = set.add(100);
		System.out.println(b1);;
		System.out.println("set 내부의 데이터 수 : "+set.size());
		System.out.println(set); //toString 이 오버라이딩 되어있어서 내부데이터 확인 가능
		boolean b2 = set.add(100);
		System.out.println(b2);;
		System.out.println("set 내부의 데이터 수 : "+set.size());
		b1 = set.add(200);
		System.out.println(b1);;
		System.out.println(set); //toString 이 오버라이딩 되어있어서 내부데이터 확인 가능
		
		set.add(150);
		set.add(230);
		set.add(10);
		set.add(1500);
		System.out.println(set);
		b1 = set.add(1500);
		System.out.println(set);
		System.out.println(b1);

		//remove(param) : 파라미터로 받은 데이터를 set에서 삭제하고, 그 결과를 되돌려줌
		b1 = set.remove(10);
		System.out.println(b1);
		System.out.println(set);
		b1 = set.remove(4710);
		System.out.println(b1);
		System.out.println(set);
		
		//set 은 index 로 데이터를 관리하지 않음
		// 여러 데이터 중 특정 데이터에 접근할 방법이 없음.
		// -> 수정이 필ㅇ하면 -> 삭제하고 다시 추가함.
		
		set.remove(1000);
		set.add(2000);
		System.out.println(set);
		
		//set에 있는 데이터를 꺼내는 방법
		//1)반복자(iterator)를 이용한 방법
		Iterator<Integer> iter = set.iterator(); 
		
		//next() : 값 하나 꺼내옴
		//hasNext() : 꺼내올 값이 남아있으면 true / 없으면 false 를 리턴
		
		while(iter.hasNext()) {
			Integer num = iter.next();
			System.out.println(num);
		} // 제일 안 씀..........
System.out.println("=======================");		
		//2)foreach
		for (Integer num : set) {
			System.out.println(num);
		}
		
		
		//3) HashSet 을 ArrayList 로 변환 : ArrayList 객체 생성시 생성자의 매개변수로 Set을 넣으면 변환
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		System.out.println(list);
		System.out.println(set);
		set.add(2201); //어디 들어갈지 모름.
		list.add(2201);
		System.out.println(set);
		System.out.println(list);
	}
	
	public void test2() {
		HashSet<TestClass> set = new HashSet<TestClass>();
		TestClass tc1 = new TestClass(10, "hi");
		boolean b1 = set.add(tc1);
		TestClass tc2 = new TestClass(20,"bye");
		boolean b2 = set.add(tc2);
		TestClass tc3 = new TestClass(10, "hi"); //필드가 같을 뿐 객체가 다른 것을 인식히야함 (true)
		boolean b3 = set.add(tc3);
		System.out.println(b1);
		System.out.println(b2);
		System.out.println(b3);
		System.out.println(set);
		TestClass tc4 = tc2;
		boolean b4 = set.add(tc4);
		System.out.println(b4);
	}
}
