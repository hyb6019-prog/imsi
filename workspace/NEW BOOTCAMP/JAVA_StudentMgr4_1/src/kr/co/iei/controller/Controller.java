package kr.co.iei.controller;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kr.co.iei.model.vo.Student;

public class Controller {

	Scanner sc;
	//학생 정보를 HashMap 으로 관리
	//관리하고 싶은 학생 정보는 ( 이름 / 나이 / 주소 ) -> Student -> HashMap 에서 Student 가 Value.
	
	//학생을 관리하고 싶은 key 는 절대 중복되면 안됨 -> 이름을 Key -> Key 자료형 String
	
	
	HashMap<String, Student> students;
	
	
	public Controller() {
		super();
		sc = new Scanner(System.in);
		students = new HashMap<String, Student>();
		
		//test
		Student s1 = new Student("학생1", 20, "서울"); 
		Student s2 = new Student("학생2", 30, "경기"); 
		Student s3 = new Student("학생3", 40, "부산"); 
		Student s4 = new Student("학생4", 50, "인천"); 
		Student s5 = new Student("학생5", 1060, "안드로메다");
		
		students.put("학생1", s1);
		students.put(s2.getName(), s2);
		students.put(s3.getName(), s3);
		students.put(s4.getName(), s4);
		students.put(s5.getName(), s5);
	}
	
	public void main() {
		while(true) {
			System.out.println("\n------------ 학생관리 프로그램v4 ------------\n");
			System.out.println("1.학생 정보 등록");
			System.out.println("2.학생 전체 출력");
			System.out.println("3.학생 정보 조회");
			System.out.println("4.학생 정보 수정");
			System.out.println("5.학생 정보 삭제");
			System.out.println("0.종료");
			System.out.print("선택 > > ");
			int select = sc.nextInt();
			
			switch (select) {
			case 1:
				insertStudent();
				break;
			case 2:
				printAllStudent();
				break;
			case 3:
				printOneStudent();
				break;
			case 4:
				updateStudent();
			case 5:
				deleteStudent();
				break;
			case 0:
				return;
			default :
				System.out.println("Invalid input");	
				break;
			}//switch
		}//while
	}//main
	
	public void insertStudent() {
		System.out.println("\n------------ 학생 정보 등록 ------------\n");
		System.out.print("등록 할 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("등록 할 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("등록 할 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		Student s = new Student(name,age,addr);
		//map 에 추가 ->put
		students.put(name, s); //입력받은 이름을 key, 학생 객체를 value 로 사
		
		System.out.println("등록 완료");
		System.out.println(students);
	}//insertStudent()

	public void printAllStudent() {
		System.out.println("\n------------ 학생 정보 출력 ------------\n");
		System.out.println("이름\t나이\t주소");
		//map 에 있는 모든 정보를 출력 -> 모든 키 값을 알아야함 -> keySet();
		Set<String> names = students.keySet();
		for (String name : names) {
			Student s = students.get(name);
			System.out.println(s.getName()+"\t"+s.getAge()+"\t"+s.getAddr());
		}
	}
	
	public void printOneStudent() {
		System.out.println("\n------------ 학생 정보 조회 ------------\n");
		System.out.print("조회 할 학생 이름 입력 : ");
		String name = sc.next();
		Student s = students.get(name);
		if(s == null) {
			System.out.println("학생 정보를 조회할 수 없습니다.");
		}else {
			System.out.println("학생 이름 : " +s.getName());
			System.out.println("학생 나이 : " +s.getAge());
			System.out.println("학생 주소 : " +s.getAddr());
		}
	}
	
	public void updateStudent() {
		System.out.println("\n------------ 학생 정보 수정 ------------\n");
		System.out.print("조회 할 학생 이름 입력 : ");
		String name = sc.next();
		boolean result = students.containsKey(name);
		
		if(result) {
			Student s = students.get(name);
			System.out.println("스정할 학생 나이 : " );
			int age = sc.nextInt();
			System.out.println("수정할 학생 주소 : " );
			sc.nextLine();
			String addr = sc.nextLine();
			s.setAge(age);
			s.setAddr(addr);
			System.out.println("정보 수정 완료 !");
		}else {
			System.out.println("학생 정보를 조회할 수 없습니다.");
		}
	}
	
	public void deleteStudent() {
		System.out.println("\n------------ 학생 정보 삭제 ------------\n");
		System.out.print("삭제 할 학생 이름 입력 : ");
		String name = sc.next();
		
		if(students.containsKey(name)) {
			students.remove(name);
			System.out.println("지웠어");
		}else {
			System.out.println("학생 정보를 조회할 수 없습니다.");
		}
	}

}
