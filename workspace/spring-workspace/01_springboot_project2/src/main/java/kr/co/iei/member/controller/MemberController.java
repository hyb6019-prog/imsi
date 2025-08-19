package kr.co.iei.member.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iei.member.model.service.MemberService;
import kr.co.iei.member.model.vo.Member;

//spring에게 컨트롤러 객체 생성하라고 알려주는 어노테이션
@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired //스프링이 서버 시작 시 생성한 객체들 중 일치하는 타입의 객체 주소를 넣어둠
	private MemberService memberService; //어노테이션으로 만들어둔 객체를 전역변수로 선언. 초기값 null
	
	//컨트롤러가 필요한경우 -> @Controller 어노테이션이 작성되어있는 클래스에 메소드하나 생성
	//메소드는 리턴타입이 String
//	@GetMapping			: get 요청을 처리하는 경우
//	@PostMapping		: post 요청을 처리하는 경우
//	@RequestMapping		: get, post를 구분하지 않고 처리하는 경우 (권고사항 아님)
	@GetMapping(value="/allMember")
	public String allMember(Model model) {
		//1.인코딩
		//2.값추출
		//3.비즈니스로직
//		MemberService memberService = new MemberService(); //이미 어노테이션으로 미리 만들어둠
		List list = memberService.selectAllMember();
		System.out.println(list);
		model.addAttribute("list", list);
		return "member/allMember";
		//4.결과처리
		
	}
	
	@GetMapping(value="/joinFrm")
	public String joinFrm() {
		return "member/joinFrm";
	}
	
	@PostMapping(value="/join")
	public String join(Member m) {
		System.out.println(m);
		int result = memberService.insertMember(m);
		//회원 가입 성공하면 -> 전체회원 조회 페이지로 이동 -> 다른 컨트롤러 호출하는 방법
		return "redirect:/member/allMember";
	}
	
	@GetMapping(value="/searchIdFrm")
	public String searchIdFrm() {
		return "member/searchIdfrm";
	}
	
	@GetMapping(value="/searchId")
	public String searchId(String memberId, Model model) {
		Member m = memberService.selectOneMember(memberId);
		if(m == null) {
			return "member/searchFail";
		}else {
			model.addAttribute("m", m);
			return "member/searchSuccess";
		}
//		model.addAttribute("m", m);
//		return "member/searchResult";
	}
}





















