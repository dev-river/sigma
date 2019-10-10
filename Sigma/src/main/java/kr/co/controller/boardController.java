package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.boardVO;
import kr.co.service.boardService;

@Controller
@RequestMapping("/board")
public class boardController {
	@Inject
	private boardService bservice;

	@RequestMapping(value = "/boardFR/list", method = RequestMethod.GET)
	public void boardFRList(Model model) {
		List<boardVO> vo = bservice.boardFRList();
		model.addAttribute("vo", vo);
	}
}
