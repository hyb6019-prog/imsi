package kr.co.iei.memo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iei.memo.model.service.MemoService;
import kr.co.iei.memo.model.vo.Memo;

@Controller
@RequestMapping(value="/memo")
public class MemoController {
	
	@Autowired
	private MemoService memoService;
	
	@GetMapping(value="/memoList")
	public String memoList(Model model) {
		List list = memoService.selectAllMemo();
		model.addAttribute("allList", list);
		return "memo/memoList";
	}
	
	@GetMapping(value="/writeFrm")
	public String writeFrm() {
		return "memo/writeFrm";
	}
	
	@PostMapping(value="/memoWrite")
	public String memoWrite(Memo m) {
		int result = memoService.insertMemo(m);
		return "redirect:/memo/memoList";
	}
	
	@GetMapping(value="/searchWriter")
	public String searchWriter(String memoWriter, Model model) {
		List list = memoService.searchWriter(memoWriter);
		System.out.println(list);
		if(!list.isEmpty()) {
			model.addAttribute("allList", list);
			return "memo/memoList";
		}else {
			return"#";
		}
	}
	
	@GetMapping(value="/getMemo")
	public String getMemo(int memoId, Model model) {
		Memo m = memoService.getMemo(memoId);
		if(m != null) {
			model.addAttribute("m", m);
			return "memo/getMemo";
		}else {
			return "#";
		}
	}
	
	@GetMapping(value="/modifyFrm")
	public String modifyFrm(int memoId, Model model) {
		Memo m = memoService.selectOneMemo(memoId);
		if(m != null) {
			model.addAttribute("m", m);
			return "memo/modifyFrm";
		}else {
			return "#";
		}
	}
	
	@PostMapping(value="/memoUpdate")
	public String memoUpdate(Memo m) {
		System.out.println("memoId=" + m.getMemoId());
		System.out.println("memoTitle=" + m.getMemoTitle());
		System.out.println("memoContent=" + m.getMemoContent());
		int result = memoService.memoUpdate(m);
		if(result > 0) {
			return "redirect:/memo/memoList";
		}else {
			return "#";
		}
	}
	
	@GetMapping(value="/deleteMemo")
	public String deleteMemo(int memoId) {
		int result = memoService.deleteMemo(memoId);
		if(result > 0) {
			return "redirect:/memo/memoList";
		}
		return "#";
	}
}













