package kr.co.iei.member.model.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor	//매개변수 없는 생성자
@AllArgsConstructor	//모든 매개변수 있는 생성자
@Data				//getter/setter/toSting 구현
@Alias(value="Member")	//Mybatis에게 이 데이터타입을 인식시킬 별명 설정
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private String memberAddr;
	private int memberLevel;
	private String enrollDate;
	
}
