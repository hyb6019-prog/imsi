package kr.co.iei.qna.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.iei.qna.model.service.QnaService;

@Controller
@RequestMapping(value = "/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@GetMapping(value = "/searchWriter")
	public String search(String qnaWriter, Model model) {
		List list = qnaService.searchQna(qnaWriter);
		model.addAttribute("qnaList", list);
		return "qna/search";
	}

}