package kr.co.iei.memo.model.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Alias(value="memo")
public class Memo {
	private int memoId;
	private String memoTitle;
	private String memoContent;
	private String memoWriter;
	private String writeDate;
}
