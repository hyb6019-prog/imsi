package kh.java.Exam;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;


public class BaseballClient {
	public void Client() {
		Scanner sc = new Scanner(System.in);
		String serverIp = "192.168.10.91";
		int serverPort = 8282;
		
		Socket socket = null;
		DataInputStream dis = null;
		DataOutputStream dos = null;
		
		try {
			socket = new Socket(serverIp, serverPort);
			System.out.println("<<<< Baseball Game >>>>");
			System.out.println("<<<< Game >>>>");
			
			InputStream in = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			
			dis = new DataInputStream(in);
			dos = new DataOutputStream(out);
			
			int count = 0;
			while(true) {
				for(int i=0; i<3; i++) {
					System.out.print((count+1)+"번째 숫자 입력: ");
					int num = sc.nextInt();
					dos.writeInt(num);
				}
				count++;
				int strike = dis.readInt();
				int ball = dis.readInt();
				System.out.println(count+"회 ---->"+strike+"스트라이크"+ball+"볼");
				dos.writeInt(count);
				if(strike == 3) {
					System.out.println("축하합니다.");
					break;
				} else if (count >= 10) {
					dos.writeInt(count);
					int answer1 = dis.readInt();
					int answer2 = dis.readInt();
					int answer3 = dis.readInt();
					System.out.println(count+"회 ---->"+strike+"스트라이크"+ball+"볼 기회를 모두 사용하셨습니다. 정답은 "+"["+answer1+","+answer2+","+answer3);
					break;
				}
			}
			
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				socket.close();
				dis.close();
				dos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
