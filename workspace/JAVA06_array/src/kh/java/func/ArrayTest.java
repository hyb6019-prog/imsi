package kh.java.func;

import java.util.Random;
import java.util.Scanner;

public class ArrayTest {
	public void test1() {
		// 1,2,3,4,5 라는 5개 데이터를 각각 저장하고 출력
		// 1) 변수를 이용한 처리 -> 데이터가 5개면 변수도 5개

		/*
		 * int num0 = 1; int num1 = 2; int num2 = 3; int num3 = 4; int num4 = 5;
		 * 
		 * System.out.println("변수를 이용한 출력"); System.out.println(num0);
		 * System.out.println(num1); System.out.println(num2); System.out.println(num3);
		 * System.out.println(num4);
		 */

		// 2) 배열을 이용한 처리
		// 배열 -> 동일한 자료형 여러개를 하나로 묶어서 인덱스로 관리
		// 정수 5개를 저장할 배열

		// 배열 생성 방법 -> 자료형[] 변수명 = new 자료형[길이];

		int[] arr = new int[5];
		arr[0] = 1;
		arr[1] = 2;
		arr[2] = 3;
		arr[3] = 4;
		arr[4] = 5;
		/*
		 * System.out.println("배열을 이용한 값 출력"); // System.out.println(arr[0]); //
		 * System.out.println(arr[1]); System.out.println(arr[2]);
		 * System.out.println(arr[3]); System.out.println(arr[4]);
		 */

		// for 문을 이요한 출력
		System.out.println("for 문을 이용한 출력");
		for (int i = 0; i < 5; i++) {
			System.out.println(arr[i]);
		}
	}// method

	public void test2() {
		Scanner sc = new Scanner(System.in);
		// 길이가 5인 정수형 배열을 선언해서 순서대로 1,2,3,4,5를 저장한 후 출력

		// 1) 기본 형태
		int arr1[]; // 정수형 배열의 주소를 저장할 변수 선언(참조형)
		arr1 = new int[5]; // 배열에 길이를 지정하는 행위 -> 할당
		// 배열은 할당하면 기본값으로 데이터가 초기화 되어있음
		// 기본값 : 정수(0), 실수(0,0), 문자(' '), 논리형 (false), 참조형 (null -> 주소값이 비어있음.)
		for (int i = 0; i < 5; i++) {
			System.out.println(i + " : " + arr1[i]);
		}
		System.out.println("----------------------------");
		// 기본 형태의 값 저장 방법
		/*
		 * arr1[0] = 1; arr1[1] = 2; arr1[2] = 3; arr1[3] = 4; arr1[4] = 5; for(int i =
		 * 0; i<5; i++) { System.out.println(i + " : " + arr1[i]); }
		 */

		// for 문을 이용한 대입
		for (int i = 0; i < 5; i++) {
			arr1[i] = (i + 1);
			System.out.println(i + " : " + arr1[i]);
		}
		System.out.println("----------------------------------");
		// 길이가 5인 정수형 배열을 선언해서 순서대로 데이터를 대입.
		int[] arr2 = { 1, 2, 3, 4, 5 }; // index 0~4
		for (int i = 0; i < 5; i++) {
			System.out.println(i + " : " + arr2[i]);
		}
		System.out.println("----------------------------------");
		// 길이가 3인 문자열 배열을 만들어서 "hello", "hi", "bye" 를 대입 후 출력

		String[] arr3 = new String[3];
		arr3[0] = "hello";
		arr3[1] = "hi";
		arr3[2] = "bye";
		for (int i = 0; i < 3; i++) {
			System.out.println(i + " : " + arr3[i]);
		}
		System.out.println("--------------------------------");

		String[] arr4 = { "hello", "hi", "bye}" };
		for (int i = 0; i < 3; i++) {
			System.out.println(i + " : " + arr4[i]);
		}

		// ** for 문을 0부터 시작하면 편한 이유 : 배열 index 가 0부터 시작하기 때문.
	}// method test 2()

	public void exam1() {
		/*
		 * String fruit[] = new String[5]; fruit[0] = "딸기"; fruit[1] = "복숭아"; fruit[2] =
		 * "키위"; fruit[3] = "사과"; fruit[4] = "바나나";
		 */

		String[] fruit = { "딸기", "복숭아", "키위", "사과", "바나나" };
		System.out.println("1-1 : " + fruit[4]);
		System.out.println("1-2 : " + fruit[0] + fruit[1] + fruit[2] + fruit[3] + fruit[4]);
		System.out.println("1-3 : ");
		for (int i = 0; i < 5; i++) {
			System.out.println(i + " : " + fruit[i]);
		} // for
	}// method exam1

	public void exam2() {
		int num[] = new int[100];
		for (int i = 0; i < 100; i++) {
			num[i] = i + 1;
			System.out.println(num[i]);
		}
	}// method exam2

	public void exam3() {
		Scanner sc = new Scanner(System.in);
		int score[] = new int[4];
		System.out.print("국어 점수를 입력하세요 : ");
		score[0] = sc.nextInt();
		System.out.print("영어 점수를 입력하세요 : ");
		score[1] = sc.nextInt();
		System.out.print("수학 점수를 입력하세요 : ");
		score[2] = sc.nextInt();
		score[3] = score[0] + score[1] + score[2];
		System.out.println("합계 : " + score[3]);
		double avgScore = (double) (score[3] / 3.00);
		System.out.printf("평균 : %.2f", avgScore);
	}// method exam3

	public void exam3_1() {
		// for 문 활용
		Scanner sc = new Scanner(System.in);
		int score[] = new int[4];
		String subject[] = { "국어", "영어", "수학" };
		for (int i = 0; i < 3; i++) {
			System.out.print(subject[i] + " 점수를 입력하세요 : ");
			score[i] = sc.nextInt();
			score[3] += score[i];
		} // for
		double avgScore = (double) (score[3] / 3.00);
		System.out.printf("합계는 %d점, 평균은 %.2f점 입니다.", score[3], avgScore);
	}// method exam3_1

	public void motel() {
		Scanner sc = new Scanner(System.in);
		// 방을 관리할 배열 -> 방은 총 10개 -> 길이가 10인 배열 생성
		// 난이도 하 : 정수 -> 0이면 빈 방, 1이면 손님이 있는 방
		// 난이도 상 : 논리형 -> false 빈방, true 손님 있는 방
//		int[] rooms = new int[10]; // 배열을 할당하면 기본값으로 세팅 (정수 -> 0 -> 모두 빈 방인 상태로 세팅)
		boolean power = true;
		int room[] = new int[10];

		while (power) {

			System.out.println("\n----------- 모텔 관리 프로그램 -----------");
			System.out.println("1. 입실");
			System.out.println("2. 퇴실");
			System.out.println("3. 방 보기");
			System.out.println("4. 종료");
			System.out.print("선택 > ");
			int select = sc.nextInt();
			switch (select) {
			case 1:
				// 구현 순서 2
				System.out.print("몇번 방에 입실하시겠습니까 ? : ");
				int inputRoom = sc.nextInt();
				if (room[inputRoom - 1] == 0) {
					room[inputRoom - 1] = 1;
					System.out.printf("%d번 방에 입실했습니다.", inputRoom);
					break;
				} else {
					System.out.printf("%d번 방에는 손님이 있습니다.", inputRoom);
					break;
				}

			case 2:
				// 구현 순서 3
				System.out.print("몇번 방에 퇴실하시겠습니까 ? : ");
				int inputRoom2 = sc.nextInt();
				if (room[inputRoom2 - 1] == 1) {
					room[inputRoom2 - 1] = 0;
					System.out.printf("%d번 방에 퇴실했습니다.", inputRoom2);
					break;
				} else {
					System.out.printf("%d번 방에는 손님이 없습니다.", inputRoom2);
					break;

				}
			case 3:
				// 구현 순서 : 1 우선 (테스트를 위함)
				for (int i = 0; i < 10; i++) {
					int roomNum = i + 1;
					System.out.print(roomNum + "번방은 ");
					if (room[i] == 0) {
						System.out.println("빈 방입니다.");
					}
					if (room[i] == 1) {
						System.out.println("손님이 있습니다.");
					}
				}

				break;
			case 4:
				power = false;
				break;

			default:
				System.out.println("잘못된 입력입니다.");
				break;
			}
		}

	}// method motel

	public void motel_1() {
		Scanner sc = new Scanner(System.in);

		boolean rooms[] = new boolean[10];
		boolean power = true;
		// rooms 가 true, false 가 되도록.
		while (power) {
			System.out.println("---------- 모텔 관리 프로그램 ----------");
			System.out.println();
			System.out.println("1 . 입실");
			System.out.println("2 . 퇴실");
			System.out.println("3 . 방 보기");
			System.out.println("4 . 종료");
			System.out.print("선택 >> ");
			int select = sc.nextInt();

			switch (select) {
			case 1:
				System.out.print("몇번 방에 입실하시겠습니까? : ");
				int inRoom = sc.nextInt();
				if (rooms[inRoom - 1]) {
					System.out.printf("%번 방엔 손님이 있습니다.\n", inRoom);
					break;
				} else {
					System.out.printf("%d번 방에 입실하였습니다.\n", inRoom);
					rooms[inRoom - 1] = true;
				}
				break;
			case 2:
				System.out.print("몇번 방에 퇴실하시겠습니까? : ");
				int outRoom = sc.nextInt();
				if (rooms[outRoom - 1]) {
					System.out.printf("%d번 방에서 퇴실하였습니다.\n", outRoom);
					break;
				} else {
					System.out.printf("%d번 방에는 손님이 없습니다.\n", outRoom);
				}
				break;
			case 3:
				for (int i = 0; i < 10; i++) {
					int roomNum = i + 1;
					System.out.printf("%d번 방은 ", roomNum);
					if (rooms[i]) {
						System.out.println("손님이 있습니다.");
					} else {
						System.out.println("빈 방입니다.");
					}
				} // for
				break;
			case 4:
				power = false;
				break;
			default:
				System.out.println("잘못된 입력입니다.");
				break;

			}// switch

		} // while
	}// motel_1 method

	public void exam4() { // sorting ; 오름차순 ; 버블 정렬
		Scanner sc = new Scanner(System.in);
//		System.out.println(1번째 숫자입력);
//		num[0] = sc.nextInt();
//		.,,, 반복 

		/*
		 * int num[] = new int[5]; for (int i=0;i<5;i++) {
		 * System.out.printf("%d번째 숫자 입력 : ",i+1); num[i] = sc.nextInt(); }
		 */

		// ** 배열 0번 인덱스에 있는 수와, 배열 1번 인덱스에 있는 수를 비교해서 0번 인덱스의 수가 더 크면 자리를 바꾸는 코드
//		arr.length -> 현재 배열의 길이를 정수형태로 가지고 옴.

		/*
		 * 예시 : for(int i=0;i<4;i++) { if(num[i] > num) { int tmp = num[i+1]; num[i+1] =
		 * num[i] num[i+1] = tmp; } } if(num[0] > num[1]) { int tmp = num[0]; num[0] =
		 * num[1]; num[1] = tmp;
		 */

		int num[] = { 5, 4, 1, 2, 3 };

		for (int i = 0; i < 4; i++) {
			for (int j = 0; j < 4 - i; j++) {
				if (num[j] > num[j + 1]) {
					int tmp = num[j];
					num[j] = num[j + 1];
					num[j + 1] = tmp;
				} // if j
			} // for j
		} // for i
	}// method

	public void sorting() {
		Scanner sc = new Scanner(System.in);

		int[] arr = new int[7];

//		arr.length -> 현재 배열의 길이를 정수형태로 가지고 옴.
		for (int i = 0; i < arr.length; i++) {
			System.out.printf("%d번째 숫자 입력 : ", i + 1);
			arr[i] = sc.nextInt();
		} // for i
//배열 0번 인덱스에 있는 수와, 배열 1번 인덱스에 있는 수를 비교해서 0번 인덱스의 수가 더 크면 자리를 바꾸는 코드
		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = 0; j < arr.length - 1; j++) {
				if (arr[j] > arr[j + 1]) {
					int tmp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = tmp;
				}

			}
		}

	}// method

	public void lotto() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		
		boolean power = true;
		int num[] = new int[6];
		int cNum[] = new int[6];
		int score = 0;
//		while()
		while (power) {
		System.out.println("====== 로또 프로그램 ======");
		for (int i = 0; i < num.length; i++) {
			System.out.printf("%d번쨰 번호 입력 (1~45)  :  ", i + 1);
			num[i] = sc.nextInt();
			cNum[i] = r.nextInt(45) + 1;
			// 로또 번호 입력값 제약 조건
//			1)입력한 숫자가 1~45의 숫자여야함
//			2) 입력 숫자는 중복X
			// 두 조건 중 입력한 숫자가 정상범위여야 중복체크 진행하는 순서로 작업
			// -> 입력한 숫자가 정상범위가 아니면 중복체크가 의미 없음 -> 무조건 중복이 아니라고 나옴.
			if (1 <= cNum[i] && cNum[i] <= 45) {
				for (int j = 0; j < i; j++) {
					if (cNum[i] == cNum[j]) {
						i--;
						break;
					}
				}
			}
			if (1 <= num[i] && num[i] <= 45) {
				for (int j = 0; j < i; j++) {
					if (num[i] == num[j]) {
						System.out.println("이미 중복된 번호입니다. 다시 입력해주세요.");
						i--;
						break;
					}
				}
			} else {
				System.out.println("잘못 입력하셨습니다. 1~ 45 범위의 숫자를 입력하세요.");
				i--;
			}
		}
		System.out.println("사용자 번호 :");
		sort(num);
//		for (int i = 0; i < num.length - 1; i++) {
//			for (int j = 0; j < num.length - 1 - i; j++) {
//				if (num[j] > num[j + 1]) {
//					int temp = num[j];
//					num[j] = num[j + 1];
//					num[j + 1] = temp;
//				}
//			} // 상위 for 문
//		}
		for (int i = 0; i < num.length; i++) {
			System.out.print(num[i] + "\t");
		}

		System.out.println("\n컴퓨터 번호 :");
		sort(cNum);
//		for (int i = 0; i < cNum.length - 1; i++) {
//			for (int j = 0; j < cNum.length - 1 - i; j++) {
//				if (cNum[j] > cNum[j + 1]) {
//					int temp = cNum[j];
//					cNum[j] = cNum[j + 1];
//					cNum[j + 1] = temp;
//				}
//			}
//		}
		for (int i = 0; i < cNum.length; i++) {
			System.out.print(cNum[i] + "\t");
		} // for
		
		for (int i = 0; i < num.length; i++) {
			for (int j = 0; j < cNum.length; j++) {
				if (num[i]==cNum[j]) {
					score++;
					break;
				}
			}
		}
		System.out.println("맞은 개수 : "+score);
		switch (score) {
		case 6 : System.out.println("1등 ! !");
		break;
		case 5 : System.out.println("2등 ! !");
		break;
		case 4 : System.out.println("3등 ! !");
		break;
		default : System.out.println("꽝 !");
		break;
		}
		System.out.print("한번 더 하시겠습니까? (1. yes 2.no ) : ");
		int select = sc.nextInt();
		switch (select) {
		case 1 : power = true;
			break;
		case 2 : power = false;
			break;
		default : System.out.println("잘못된 입력입니다.1 , 2 중 하나의 정수를 입력해주세요.");
		}
	}
	}
	public void sort(int[] arr) {
		for(int i=0;i<arr.length-1;i++) {
			for(int j=0;j<arr.length-1-i;j++) {
				if(arr[j] > arr[j+1]) {
					int tmp = arr[j];
					arr[j] = arr[j+1];
					arr[j+1] = tmp;
				}
			}
		}
	}
}


















