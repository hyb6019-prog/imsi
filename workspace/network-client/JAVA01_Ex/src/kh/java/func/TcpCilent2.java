package kh.java.func;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class TcpCilent2 {
	
	
	public void clientTest() {
		Scanner sc = new Scanner(System.in);
		//1. 서버 아이피, 서버 포트번호 지정
		String serverIp = "192.168.10.50"; //127.0.0.1 루프백 -> 내컴퓨터를 호출하는 아이피(localhost)
		int serverPort = 7878;
		//자원반환에 필요한 객체 선언
		Socket sk = null;
		DataOutputStream dos = null;
		DataInputStream dis = null;
		
		try {
			//2. 지정한 아이피와 포트로 소켓객체 생성 -> 서버에 접속 요청
			sk = new Socket(serverIp, serverPort);
			//3. 소켓에서 스트림 추출
			InputStream in = sk.getInputStream();
			OutputStream out = sk.getOutputStream();
			//4. 보조스트림 연결
			dos = new DataOutputStream(out);
			dis = new DataInputStream(in);
			
			System.out.print("알고싶은 도메인 주소를 입력하세요 : ");
			String domain = sc.nextLine();
			dos.writeUTF(domain);
			
			String result = dis.readUTF();
			System.out.println(result);
			
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				sk.close();
				dis.close();
				dos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
			
	}
	
	
}
