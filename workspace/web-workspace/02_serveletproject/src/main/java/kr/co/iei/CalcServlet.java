package kr.co.iei;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/calc")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		String su1String = request.getParameter("su1");
		String su2String = request.getParameter("su2");
		int su1 = Integer.parseInt(su1String);
		int su2 = Integer.parseInt(su2String);
		String oper = request.getParameter("oper");
		//3. 비즈니스로직
		int result = 0;
		String message = "";
		if(oper.equals("+")) {
			result = su1 + su2;
		}else if(oper.equals("-")) {
			result = su1 - su2;
		}else if(oper.equals("*")) {
			result = su1 * su2;
		}else if(oper.equals("/")) {
			if (su2 == 0) {
                message = "0으로 나눌 수 없습니다.";
            } else {
                result = su1 / su2;
            }
		}
		//4. 결과화면 처리
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><title>연산결과</title></head>");
		out.println("<body>");
		out.println("<h1>연산결과</h1><hr>");
		out.println("<h3>"+su1+oper+su2+"=<span style='color : red;'>"+result+"</span></h3>");
		out.println("</body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
