package kr.co.iei;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendData1Servlet
 */
@WebServlet("/sendData1")
public class SendData1Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendData1Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서버 호출 완료 333");
		//사용자 측에서 servlet으로 데이터를 보내면 request에 포함되어 있음 -> request에서 꺼내야함
		//한글이 있는경우 인코딩을 수행
		request.setCharacterEncoding("utf-8");
		//요청 정보중에 전달된 데이터를 추출  / ?-> 파라미터 구분자
		String data1 = request.getParameter("name");
		String data2 = request.getParameter("test");
		System.out.println("data1 : "+data1);
		System.out.println("data2 : "+data2);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
