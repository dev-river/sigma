package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;
import kr.co.service.boardService;

@Controller
@RequestMapping("/board")
public class boardController {
	@Inject
	private boardService bservice;

	@RequestMapping(value = "/boardFR/list", method = RequestMethod.GET)
	public void boardFRList(PageTO to, Model model) {
		System.out.println(to.getCurPage());
		PageTO dbTO = bservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
		System.out.println(dbTO.getList());
	}
	
	@RequestMapping(value = "/boardFR/insert", method = RequestMethod.GET)
	public void boardFRinsertUI() {
	}
	
	@RequestMapping(value = "/boardFR/insert", method = RequestMethod.POST)
	public String boardFRinsert(boardVO vo) {
		bservice.boardFRinsert(vo);
		return "redirect:/board/boardFR/list";
	}
	
	@RequestMapping(value = "/boardFR/read")
	public void boardFRread(boardVO vo, Model model) {
		boardVO readvo  = bservice.boardFRread(vo);
		model.addAttribute("readvo", readvo);
	}


	@RequestMapping(value = "/boardFR/update")
	public void boardFRupdateUI(int num,Model model) {
		boardVO updatevo = bservice.boardFRupdateUI(num);
		model.addAttribute("updatevo", updatevo);
	}
	
	@RequestMapping(value = "/boardFR/update", method = RequestMethod.POST)
	public String boardFRupdate(boardVO vo) {
		bservice.boardFRupdate(vo);
		return "redirect:/board/boardFR/read?num=" + vo.getNum();
		
	}
	
	@RequestMapping(value = "/boardFR/delete", method = RequestMethod.GET)
	public String boardFRdelete(int num) {
		bservice.boardFRdelete(num);
		return "redirect:/board/boardFR/list";
		
	}
}