package kr.co.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;
import kr.co.service.boardService;
import kr.co.service.replyService;

@Controller
@RequestMapping("/board")
public class boardController {
	@Inject
	private boardService bservice;
	
	@Autowired
	private replyService rservice;

	@RequestMapping(value = "boardFR/list", method = RequestMethod.GET)
	public void boardFRList(PageTO<boardVO> to, Model model) {
		
		PageTO<boardVO> dbTO = bservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	}
	
	@RequestMapping(value = "/boardFR/insert", method = RequestMethod.GET)
	public void boardFRinsertUI() {
	}
	
	@RequestMapping(value = "/boardFR/insert", method = RequestMethod.POST)
	public String boardFRinsert(boardVO vo) {
		bservice.boardFRinsert(vo);
		return "redirect:/mainboard";
	}
	
	@RequestMapping(value = "/boardFR/read")
	public void boardFRread(boardVO vo, Model model , PageTO<boardVO> to) {
		boardVO readvo  = bservice.boardFRread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardFR/update")
	public void boardFRupdateUI(int num,Model model,PageTO<boardVO> to) {
		boardVO updatevo = bservice.boardFRupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardFR/update", method = RequestMethod.POST)
	public String boardFRupdate(boardVO vo , PageTO<boardVO> to) {
		bservice.boardFRupdate(vo);
		return "redirect:/board/boardFR/read?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardFR/delete", method = RequestMethod.GET)
	public String boardFRdelete(int num , PageTO<boardVO> to) throws Exception {
		rservice.deleteAll(num);
		bservice.boardFRdelete(num);
		return "redirect:/mainboard?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardFR/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = bservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	@RequestMapping(value = "/boardFR/mainboard", method = RequestMethod.GET)
	public void mainboard(PageTO<boardVO> to, Model model) {
		
		PageTO<boardVO> dbTO = bservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
		
	}
}