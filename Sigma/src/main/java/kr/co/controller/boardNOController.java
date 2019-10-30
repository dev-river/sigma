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
import kr.co.domain.boardNOVO;
import kr.co.service.boardNOService;
import kr.co.service.replyService;

@Controller
@RequestMapping("/board")
public class boardNOController {
	
	@Inject
	private boardNOService noservice;
	
	@Autowired
	private replyService rservice;

	@RequestMapping(value = "/main/notice/boardNO", method = RequestMethod.GET)
	public void boardNOList(PageTO<boardNOVO> to, Model model) {
		
		PageTO<boardNOVO> dbTO = noservice.pageList(to);
		model.addAttribute("dbnoTO", dbTO);
		
		
	}
	
	@RequestMapping(value = "/main/notice/boardNOinsert", method = RequestMethod.GET)
	public void boardNOinsertUI() {
	}
	
	@RequestMapping(value = "/main/notice/boardNOinsert", method = RequestMethod.POST)
	public String boardNOinsert(boardNOVO vo) {
		noservice.boardNOinsert(vo);
		return "redirect:/board/main/notice/boardNO";
	}
	
	@RequestMapping(value = "/main/notice/boardNOread")
	public void boardNOread(boardNOVO vo, Model model , PageTO<boardNOVO> to) {
		boardNOVO readvo  = noservice.boardNOread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/notice/boardNOupdate")
	public void boardNOupdateUI(int num,Model model,PageTO<boardNOVO> to) {
		boardNOVO updateno = noservice.boardNOupdateUI(num);
		model.addAttribute("updateno", updateno);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/notice/boardNOupdate", method = RequestMethod.POST)
	public String boardNOupdate(boardNOVO vo , PageTO<boardNOVO> to) {
		noservice.boardNOupdate(vo);
		return "redirect:/board/main/notice/boardNOread?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardNO/delete", method = RequestMethod.GET)
	public String boardEVdelete(int num , PageTO<boardNOVO> to) throws Exception {
		rservice.deleteAll(num);
		noservice.boardNOdelete(num);
		return "redirect:/board/main/notice/boardNO?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardNO/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = noservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	/*
	 * @RequestMapping(value = "/board/mainboard", method = RequestMethod.GET)
	 * public void mainboard(PageTO<boardNOVO> to, Model model) {
	 * 
	 * PageTO<boardNOVO> dbTO = evservice.pageList(to); model.addAttribute("dbTO",
	 * dbTO);
	 * 
	 * }
	 */
}