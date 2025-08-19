package kr.co.iei.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.iei.member.model.service.MemberService;
import kr.co.iei.member.model.vo.Member;

/**
 * Servlet implementation class SelectMemberIdServlet
 */
@WebServlet("/selectMemberId")
public class SelectMemberIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectMemberIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId = request.getParameter("memberId");
		//3.비즈니스로직
		MemberService memberService = new MemberService();
		Member m = memberService.selectMemberId(memberId);
		//4.결과처리
		if(m == null) {
//			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/selectMemberIdFrm.jsp");
//			view.forward(request, response);
			response.sendRedirect("/selectMemberIdFrm");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/jsp/selectMemberId.jsp");
			request.setAttribute("memberId", m);
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
