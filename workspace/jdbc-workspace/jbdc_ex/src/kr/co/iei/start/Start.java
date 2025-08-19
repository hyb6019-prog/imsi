package kr.co.iei.start;

import jdbc.member.controller.MemberController;

public class Start {
	
	public static void main(String[] args) {
		MemberController ct = new MemberController();
		ct.searchId();
	}
}
