package kr.co.iei.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iei.member.model.service.MemberService;
import kr.co.iei.member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
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
		Member m = new Member();
		String memberId = request.getParameter("memberId");
		m.setMemberId(memberId);
		m.setMemberPw(request.getParameter("memberPw"));
		m.setMemberName(request.getParameter("memberName"));
		m.setMemberPhone(request.getParameter("memberPhone"));
		m.setMemberAddr(request.getParameter("memberAddr"));
		//3. 비즈니스로직
		MemberService memberService = new MemberService();
		int result = memberService.insertMember(m);
		//4. 결과처리
		//결과에 따른 화면처리를 jsp가 하는 경우
		//RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/joinResult.jsp");
		//request.setAttribute("result", result);
		//view.forward(request, response);
		
		//결과에 따라서 다른 jsp를 호출
		if(result > 0) {
//			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF//jsp/allMember.jsp");
//			ArrayList<Member> list = memberService.selectAllMember();
//			request.setAttribute("allMemberList", list);
//			view.forward(request, response);
			
			//회원 가입이 성공한 경우 직접 화면처리를 안하고 다른 컨트롤러를 호출하는 방법
			response.sendRedirect("/allMember"); //이렇게 보내야 주소창에 /allMember로 찍힘
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/joinFail.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}



















