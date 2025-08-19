package kh.java.func;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.Scanner;

public class Client2 {
	public void client2() {
		Scanner sc = new Scanner(System.in);
		String serverIp = "1.220.236.74";	
		int serverPort = 18080;
		Socket socket = null;
		DataInputStream dis = null;
		DataOutputStream dos = null;
		
		try {
			socket = new Socket(serverIp, serverPort);
			System.out.println("서버 접속 성공");
			
			InputStream in = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			
			dis = new DataInputStream(in);
			dos = new DataOutputStream(out);
			
			while(true) {
				String msg = dis.readUTF();
				System.out.println(msg);
				if(msg.contains("?")) {
					break;					
				}
			}
			System.out.print("To.server : ");
			String msg2 = sc.nextLine();
			dos.writeUTF(msg2);
				
			while(true) {
				String msg = dis.readUTF();
				System.out.println(msg);
				if(msg.contains("?")) {
					break;					
				}
			}
			System.out.print("To.server : ");
			String msg3 = sc.nextLine();
			dos.writeUTF(msg3);
			
			while(true) {
				String msg = dis.readUTF();
				System.out.println(msg);
				if(msg.contains("?")) {
					break;					
				}
			}
			
			System.out.print("To.server : ");
			String str = sc.nextLine();
			
			
//			char ch = str.charAt(0);
			
			int num = 0;
			int sum = 0;
			
			//입력한 문자를 아스키코드로 변환하여 더한 값을 '자동으로 '내놓는 로직
			for(int i=0; i<str.length(); i++) {
				num = (int) str.charAt(i);
				sum += num;
			}
			Integer answer = sum;
			String abcd = answer.toString();
			dos.writeUTF(abcd);
			
			while(true) {
				String msg = dis.readUTF();
				System.out.println(msg);
				if(msg.contains("끝")) {
					break;					
				}
			}
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
