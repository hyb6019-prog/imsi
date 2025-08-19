package kh.java.func;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class UdpServer {
	public void client() {
		//1. 서버 포트번호 지정
		int serverPort = 8888;
		
		//자원반환할 객체 선언
		DatagramSocket socket = null;
		
		try {
			//2. DatagramSocket 객체 생성
			socket = new DatagramSocket();//클라이언트는 포트를 열고 요청을 기다리는게 아니므로 포트번호를 생성자에서 사용하지 않음
			//전송할 데이터
			String msg = "안녕 난 UDP 클라이언트야";
			byte[] outMsg = msg.getBytes();
			//서버 아이피 주소를 문자열이 아닌 InetAddress 형태로 생성
			InetAddress serverIp = InetAddress.getByName("127.0.0.1");
			DatagramPacket outPacket = new DatagramPacket(outMsg, outMsg.length, serverIp, serverPort);
			//서버로 데이터 전송
			socket.send(outPacket);
			System.out.println("데이터전송 완료");
			byte[] inMsg = new byte[1024];
			DatagramPacket inpacket = new DatagramPacket(inMsg, inMsg.length);
			socket.receive(inpacket);
			
			String serverMsg = new String(inMsg).trim();
			System.out.println(serverMsg);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			socket.close();
		}
	}
}




