package kr.co.iei.student.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Scanner;

import kr.co.iei.model.vo.Student;

public class StudentController {
	Scanner sc;
	// list 를 통해 Student 객체를 여러개 관리.
	// list 는 데이터가 있는 만큼만 사욯하기 때문에 index 관리를 변수가 필요 없음.

	ArrayList<Student> students;

	/*
	 * Student[] students; int index;
	 */
	public StudentController() {
		super();
		sc = new Scanner(System.in);
		students = new ArrayList<Student>();

		/*
		 * students = new Student[10]; index = 0;
		 */
		Student s1 = new Student("학생3", 20, "서울");
		Student s2 = new Student("학생5", 30, "인천");
		Student s3 = new Student("학생2", 40, "경기");
		students.add(s1);
		students.add(s2);
		students.add(s3);

	}

	public void main() {
		while (true) {
			System.out.println("\n---------- 학생 관리 프로그램 v3 ----------  ");
			System.out.println("1. 학생 정보 등록");
			System.out.println("2. 전체 학생 정보 출력");
			System.out.println("3. 학생 정보 조회");
			System.out.println("4. 학생 정보 수정");
			System.out.println("5. 학생 정보 삭제");
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > > ");
			int select = sc.nextInt();

			
			
			switch (select) {
			case 1:
				insertStudent();
				break;
			case 2:
				printAllStudnet();
				break;
			case 3:
				printOneStudent();
				break;
			case 4:
				modifyStudent();
				break;
			case 5:
				deleteStudent();
				break;
			case 0:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("잘못 입력하셨습니다.");
				break;

			}// switch();
		} // while();
	}// main();

	public void insertStudent() {
		System.out.println("\n---------- 학생 정보 등록 ----------\n");
		System.out.print("등록할 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("등록할 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("등록할 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();

		// 1) 빈 Student 만들고 setter 로 값 세팅
		/*
		 * Student s = new Student(); s.setName(name); s.setAge(age); s.setAddr(addr);
		 */
		// 2) 매개변수 있는 생성자로 Student 객체 만들면서 바로 값 대입
		Student s = new Student(name, age, addr);

		/*
		 * students[index] = s; index++;
		 */

		students.add(s);
		System.out.println("학생 정보 등록 완료");
	}// insertStudent();

	public void printAllStudnet() {
		System.out.println("\n---------- 전체 학생 출력 ----------");
		System.out.println("이름\t나이\t주소");
		System.out.println("----------------------------------------");

		// 배열
		/*
		 * for(int i=0; i<index; i++) { Student s = students[i]
		 * System.out.println(s.getName()+"\t"+s.getAge()+"\t"+s.getAddr());
		 */

		// List _ 1
		/*
		 * for(int i=0;i<students.size();i++) { Student s students.get(i);
		 * System.out.println(s.getName()+"\t"+s.getAge()+"\t"+s.getAddr());
		 */

		for (Student s : students) {
			System.out.println(s.getName() + "\t" + s.getAge() + "\t" + s.getAddr());
		} // for();
	}// printAllStudent();

	public void printOneStudent() {
		System.out.println("\n---------- 학생 정보 조회 ----------\n");
		System.out.print("조회할 학생 이름 입력 : ");
		String name = sc.next();
		
		int searchIndex = searchStudent(name);
		if(searchIndex == -1) {
			System.out.println("학생 정보를 찾을 수 없습니다.");
		}else {
			//Student s = students[searchIndex];
			Student s = students.get(searchIndex);
			System.out.println("이름 : "+s.getName());
			System.out.println("나이 : "+s.getAge());
			System.out.println("주소 : "+s.getAddr());
		}
		// 내부 필드가 같을 뿐 다른 객체이므로 불가능
//		int searchIndex = students.indexOf(name);

	}

	public int searchStudent(String name) {
		// 배열인 경우
		/*
		 * for (int i = 0; i<index; i++) { Student s = students[i]; String searchName =
		 * s.getName(); if(name.equals(searchName)) { return i; } }return -1;
		 */

		// list 인 경우
		for (int i = 0; i < students.size(); i++) {
			Student s = students.get(i);
			String searchName = s.getName();
			if (name.equals(searchName)) {
				return i;
			}
		}
		//for each : 불가능하진 않으나 비효율적.
		/*for (Student s : students) {
			String searchName = s.getName();
			if(name.equals(searchName)) {
				return i;
			}
			
		}*/
		return -1;
	}
	
	public void modifyStudent() {
		System.out.println("\n---------- 학생 정보 수정 ----------\n");
		System.out.print("수정할 학생 이름 입력 : ");
		String name = sc.next();
		
		System.out.print("수정할 학생 이름 입력 : ");
		String inputName = sc.next();
		System.out.print("수정할 학생 나이 입력 : ");
		int inputAge = sc.nextInt();
		System.out.print("수정할 학생 주소 입력 : ");
		sc.nextLine();
		String inputAddr = sc.nextLine();
		
		
		int searchIndex = searchStudent(name);
		if(searchIndex == -1) {
			System.out.println("학생 정보를 찾을 수 없습니다.");
		}else {
			/*기존 객체 내부 변수값을 변경
			 * Student s = students[searchIndex];
			 * Studen s = students.get(searchIndex);
			 * 
			 * 
			 */
			Student s = new Student(inputName,inputAge,inputAddr);
			students.set(searchIndex, s);
			System.out.println("학생 정보 수정 완료");
			
			
		}//else
	}//();
	
	public void deleteStudent() {
		System.out.println("\n---------- 학생 정보 삭제 ----------\n");
		System.out.print("삭제할 학생 이름 입력 : ");
		String name = sc.next();
		
		
		
		
		int searchIndex = searchStudent(name);
		if(searchIndex == -1) {
			System.out.println("학생 정보를 찾을 수 없습니다.");
		}else {
			students.remove(searchIndex);
			System.out.println("학생 정보 삭제 완료");
		}//else
	}//delete
	
	/*public void sort() {
		Collections.sort(students, new Comparator<Student>()) {
            @Override
            public int compare(Student s1, Student s2) {
                return s1.getAge() - s2.getAge(); // 나이 오름차순
	}*/
}
