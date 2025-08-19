package kh.java.Exam;

import java.net.Socket;
import java.util.Scanner;

public class testB {
	
	
	public void test1() {
		Scanner sc = new Scanner(System.in);
		
			
		
		for(int i=0; i<3; i++) {
			System.out.print(i+"번째 숫자 입력: ");
			int num = sc.nextInt();
			System.out.println(num);
		}
		
	}
}
