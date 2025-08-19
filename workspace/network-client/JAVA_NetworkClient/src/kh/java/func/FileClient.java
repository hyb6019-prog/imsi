package kh.java.func;

import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

public class FileClient {
	public void client() {
		Scanner sc = new Scanner(System.in);
		
		String serverIp = "192.168.10.47";
		int serverPort = 9090;
		
		Socket socket = null;
		DataInputStream  dis = null;
		DataOutputStream dos = null;
		BufferedOutputStream bos = null; //파일을 저장하기위한 보조스트림
		
		try {
			socket = new Socket(serverIp, serverPort);
			System.out.println("파일 서버 접속 완료");
			
			InputStream in  = socket.getInputStream();
			OutputStream out = socket.getOutputStream();
			dis = new DataInputStream(in);
			dos = new DataOutputStream(out);
			
			//파일 갯수를 먼저 수신
			int fileLength = dis.readInt();
			//파일 갯수만큼 파일이름을 받아서 출력
			for(int i=0; i<fileLength; i++) {
				String filename = dis.readUTF();
				System.out.println(filename);
			}
			System.out.print("다운로드 할 파일명 입력 : ");
			String filename = sc.nextLine();
			dos.writeUTF(filename);//다운받을 파일 이름을 서버쪽에 전송해서 파일요청
			
			//서버가 파일 크기를 전송한걸 먼저 받음
			int fileSize = dis.readInt();
			//다운로드한 파일 크기만큼 메모리공간 확보
			byte[] fileContent = new byte[fileSize];
			
			dis.readFully(fileContent);//한번에 다 받아오기
			
			FileOutputStream fos = new FileOutputStream(filename);
			bos = new BufferedOutputStream(fos);
			bos.write(fileContent);
			bos.flush();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				socket.close();
				dis.close();
				dos.close();
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
}
