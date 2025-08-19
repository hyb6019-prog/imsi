package kr.co.iei.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		request.setCharacterEncoding("utf-8");
		
		String memberId = request.getParameter("memberId");
		
		MemberService memberService = new MemberService();
		Member m = memberService.selectMemberId(memberId);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html><head><title>아이디로 회원조회</title></head><body>");
		if(m == null) {
			System.out.println("회원 정보를 찾을 수 없습니다.");
		}else {
			out.println("<ul>");
			out.println("<li>회원번호 : "+m.getMemberNO()+"</li>");
			out.println("<li>아이디 : "+m.getMemberId()+"</li>");
			out.println("<li>비밀번호 : "+m.getMemberPw()+"</li>");
			out.println("<li>이름 : "+m.getMemberName()+"</li>");
			out.println("<li>전화번호 : "+m.getMemberPhone()+"</li>");
			out.println("<li>주소 : "+m.getMemberAddr()+"</li>");
			out.println("<li>등급 : "+m.getMemberLevel()+"</li>");
			out.println("<li>가입일 : "+m.getEnrollDate()+"</li>");
			out.println("</ul>");
			
		}
		out.println("<a href='/'>메인페이지로</a>");
		out.println("<body></html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
