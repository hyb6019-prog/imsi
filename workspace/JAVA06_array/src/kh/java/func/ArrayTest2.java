package kh.java.func;

import java.util.Scanner;

public class ArrayTest2 {
	public void test1() {
		// 객체의 기본기
		int num1 = 100;
		System.out.println("num 1 : " + num1); // 100
		int num2 = num1;
		System.out.println("num 2 : " + num2); // 100

		num2 = 200;
		System.out.println("num 2 : " + num2); // 200
		System.out.println("num 1 : " + num1); // 100

		int[] arr1 = { 1, 2, 3, 4, 5 };
		System.out.println("arr1 출력 : ");
		for (int i = 0; i < arr1.length; i++) {
			System.out.println(arr1[i] + "");
		}
		System.out.println();

		int[] arr2 = arr1;
		System.out.println("arr2 출력 : ");
		for (int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + "");
		}
		System.out.println();

		arr1[2] = 300;
		System.out.println("arr1 출력 : ");
		for (int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + "");
		}
		System.out.println();

		System.out.println("arr2 출력 : ");
		for (int i = 0; i < arr2.length; i++) {
			System.out.print(arr1[i] + "");
		}
		System.out.println();
	}

	public void test2() {

		// 깊은 복사
		int[] arr1 = { 1, 2, 3, 4, 5 };
		// 1) 개발자가 직접 복사
		int[] arr2 = new int[arr1.length]; // 복사할 원본 배열과 같은 길이 & 같은 자료형의 새로운 배열 생성

		for (int i = 0; i < arr1.length; i++) {
			arr2[i] = arr1[i];
		}
		// for 문 이용한 깊은 복사
		System.out.println("arr1 출력");
		for (int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		arr2[3] = 1000;
		System.out.println("arr2 출력");
		for (int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		System.out.println();
	}

	public void test3() {
		int[] arr1 = { 1, 2, 3, 4, 5 };
		// 2) System.arraycopy 사용 (배열의 일부만 복사하고 싶을 때 주로 사용)
		int[] arr2 = new int[arr1.length]; // 복사할 배열을 새로 선언()
//		System.arraycopy(5개 데이터 전달);
		/*
		 * 1. 복사할 원본 배열 주소 2. 원본 배열 중 복사를 시작하고 싶은 인덱스 번호 3. 깊은 복사로 데이터가 들어갈 배열의 주소 
		 * 4. 깊은복사로 데이터가 들어갈 시작 인덱스 번호 5. 복사할 데이터의 길이
		 */
		System.arraycopy(arr1, 1, arr2, 2, 3);
		System.out.println("arr1 출력 : ");
		for (int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + " ");
		}
		System.out.println();
		System.out.println("arr2 출력 : ");
		for (int i = 0; i < arr2.length; i++) {
			System.out.print(arr2[i] + " ");
		}
		System.out.println();
		// 3) clone() : 복제 -> 같은 길이와 같은 데이터로 전체를 깊은 복사
		int[] arr3 = arr1.clone();
		System.out.println("arr3 출력 : ");
		for (int i = 0; i < arr3.length; i++) {
			System.out.print(arr3[i] + " ");
		}
		System.out.println();
	}
	
	
	public void test4() {
		//2차원 배열 -> 배열들의 배열
		//2차원 배열 -> 배열 내부 자료형이 배열인 형태의 데이터
		//2차원 배열 선언 -> 자료형[][] 변수 이름 = new 자료형[행의 길이][열의 길이];
		
		//2차원 배열일 때 Heap 에서 생성되는 배열의 갯수는 행 + 1 개
		
		//문자열 배열일 때 데이터를 불러오는 구조는 2차원 배열과 같으나,
		//인덱싱을 하지 않는다는 점에서 차이가 있음.
		int[][] arr = new int [1][3];
		arr[0][0] = 100;
		arr[0][1] = 200;
		arr[0][2] = 300;
		arr[1][0] = 400;
		arr[1][1] = 500;
		arr[1][2] = 600;
		
		for(int i=0;i<arr.length;i++) {//arr.length -> 행 길이를 구함.
			for(int j=0;j<arr[i].length;j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
		
	}	public void test5() {
//		가변배열 -> 2차원 배열의 한 종류
//				-> 일반 2차원 배열과의 차이점은 각 행별로 사용할 수 있는 열 의 수가 다름.
//				-> 2차원 배열은 배열들을 배열로 관리하는 형태 -> 관리되는 각 배열의 길이가 다른 상태
//		가변배열 생성 방법은 최초 배열 생성 시 행의 길이만 입력하고 열의 길이는 입력 안함.
		int[][] arr = new int[3][]; //가변 배열
		//실제로 배ㅐ열 사용시에는 각 행별로 배열을 할당하고 사용해야함.
		arr[0] = new int[5];
		arr[1] = new int[3];
		arr[2] = new int[1];
		arr[0][0] = 1;
		arr[0][1] = 2;
		arr[0][2] = 3;
		arr[0][3] = 4;
		arr[0][4] = 5;
		arr[1][0] = 1;
		arr[1][1] = 2;
		arr[1][2] = 3;
		arr[2][0] = 1;
		
		for(int i=0;i<arr.length;i++) {//arr.length -> 행 길이를 구함.
			for(int j=0;j<arr[i].length;j++) {
				System.out.print(arr[i][j]+"\t");
			}
			System.out.println();
		}
	}
	
	public void test6() {
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력 : ");
		String str1 = sc.next();
		System.out.print("문자열 입력 : ");
		String str2 = sc.next();
		//문자열은 비교 연산자로는 같은지 체크 불가능
		//같은지 체크하는 방법은 문자열1.equals(문자열2) -> boolean 형으로 결과를 제공받음.
//		(true면 같은 문자열, false 면 다른 문자열)
		if(str1.equals(str2)) {
			System.out.print("입력한 두 문자열이 같습니다.");
		} else {
			System.out.print("입력한 두 문자열이 다릅니다.");
		}
	} public void arraytest() {
		int num[] = new int[5];
		
		//
		for (int i=0; i<num.length; i++) {
			num[i] = i+5;
			System.out.println(num[i]+"\t");
			for (int j=0;j<num.length;j++) {
				num[j] = i-j;
				System.out.print(num[j]+"\t");
			}
			
		}System.out.println();
		}
}

