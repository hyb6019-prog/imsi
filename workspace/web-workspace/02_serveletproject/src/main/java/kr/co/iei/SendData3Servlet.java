package kr.co.iei;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendData3Servlet
 */
@WebServlet("/sendData3")
public class SendData3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendData3Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인코딩
		request.setCharacterEncoding("utf-8");
		
		//문자열
		String str = request.getParameter("str");
		//정수
		// -> 클라이언트에서 input을 통해서 보낸데이터는 무조건 문자열
		// -> 숫자로 사용하고 싶으면 -> 형변환 -> wrapper 클래스 (boolean -> Boolean, int -> integer)
		String numString = request.getParameter("num");
		int num = Integer.parseInt(numString);
		//radio : 라디오 중 선택된 라디오의 value가 전송
		String gender = request.getParameter("gender");
		//checkbox : 선택한 checkbox의 value가 전송
		//			-> 동일한 name으로 여러개가 선택 가능 -> 동일한 name으로 전송되는 문자열이 여러개 -> String[]
		//			-> request.getParameter("name") -> 리턴이 String
		//			-> request.getParameterValues("name") -> 문자열 배열 리턴
		String[] hobby = request.getParameterValues("hobby");
		//select : select태그의 name으로 선택한 option의 value가 전송
		String age = request.getParameter("age");
		//textarea : 서버에서는 input과 차이가 없음
		String comment = request.getParameter("comment");
		//hidden : html에서 노출이 안될 뿐 name=value 형태 동일
		String hidden = request.getParameter("hiddenData");
		//readonly : html에서 수정이 안될 뿐 name=value 형태 동일
		String readonly = request.getParameter("input1");
		//disabled : html화면에 노출될 뿐 데이터 전송에서 제외
		String disabled = request.getParameter("input2");
		//div : input,select,textarea 태그가 아니면 데이터 전송을 못함
		String div = request.getParameter("div");
		
		System.out.println("str : "+str);
		System.out.println("num : "+num);
		System.out.println("gender : "+gender);
		for(int i=0; i<hobby.length; i++) {
			System.out.println("hobby " + hobby[i]);
		}
		System.out.println("age : "+age);
		System.out.println("comment : "+ comment);
		System.out.println("hidden : "+hidden);
		System.out.println("readonly : "+readonly);
		System.out.println("disabled : "+disabled);
		System.out.println("div : "+div);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
