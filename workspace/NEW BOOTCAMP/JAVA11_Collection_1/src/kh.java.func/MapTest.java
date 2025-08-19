package kh.java.func;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

public class MapTest {

	public void test1() {
		//인덱스 번호를 이용해서 문자열을 관리하는 ArrayLIst
		ArrayList<String> list = new ArrayList<String>();
		list.add("hi");
		list.add("hello");
		list.add("hi");
		list.add("hi");
		System.out.println(list);
		System.out.println(list.get(1));
		
		//리스트와 유사하게 번호를 통해 문자열을 관리하는 HashMap
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		map.put(0, "hi");
		map.put(1, "hello");
		map.put(-500, "몰라몰라몰라용");
		map.put(2, "hi");
		System.out.println(map);
		String str1 = map.get(-500); //-> return value ("몰라몰라몰라용")
		System.out.println(str1);
	}
	
	public void test2() {
		//문자열을 통해 문자열을 관리하는 Map
		HashMap<String, String> map = new	HashMap<String, String>();
		//put(K,V) : map 에 데이터를 추가
		
		map.put("WQASDWDEFEA", "qweasdwfd");
		map.put("영", "hi");
//		put method 사용시 이미 사용중인 key 인 경우
		map.put("영", "hi");	//덮어쓰기 -> 기존 데이터 사라짐
		map.put("1", "hello");
		//put method 사용시 value 가 겹치는 경우 (key 안 안겹치면 상관없음)
		map.put("3", "hello".toUpperCase());
		map.put("Three", "wassupi");
		System.out.println(map);
		//get(key) : map 에서 매개변수로 받은 key 에 해당하는 value를 저장함.
		String data = map.get("영");
		System.out.println(data);
		System.out.println(map.get("1"));
		System.out.println(map.get("3"));
		String data2 = map.get("없는 키 ");	//만약 없는 키를 요청하면 null 을 리턴함.
		System.out.println(data2);

		//삭제 
		//remove(K) : 키에 해당하는 데이터를 삭제하고 value 를 리턴
		String data3 = map.remove("3");
		System.out.println(map);
		System.out.println(data3);
		
		//수정은 풋!
		//containsKey(param) : 매개변수로 전달한 데이터가 키로 사용중이면 true / 사용중이지 않으면 false
		//containsValue(param) : 매개변수로 전달한 데이터가 value에 존재하면 true/ 존재하지 않으면 false
		
		boolean bool1 = map.containsKey("영");
		System.out.println(bool1);
		bool1 = map.containsKey("없는 키");
		System.out.println(bool1);
		
		System.out.println(map);
		bool1 = map.containsValue("hi");
		System.out.println(bool1);
		
		System.out.println(map);
		map.put("1", "hi");
		bool1 = map.containsValue("hi");
		System.out.println(bool1);
		
		///map 에 있는 데이터를 1개 가져올 때는 key 를 이용
		//map 에 있는 모든 데이터를 가지고 오려면 ? -> 모든 키를 알고 있어야함.
		
		//keySet() : 맵에 있는 모든 key 값을 Set(HashSet 과 유사한) 형태로 반환
		//Set -> interface.
		Set<String> keySet = map.keySet();
		System.out.println(keySet);
		for(String key : keySet) {
			System.out.println(map.get(key));
		}
	}//c
}
