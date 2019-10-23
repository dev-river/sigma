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
import kr.co.domain.boardEVVO;
import kr.co.service.boardEVService;
import kr.co.service.boardService;
import kr.co.service.replyService;

@Controller
@RequestMapping("/board")
public class boardEVController {
	@Inject
	private boardEVService evservice;
	
	@Autowired
	private replyService rservice;

	@RequestMapping(value = "boardEV/list", method = RequestMethod.GET)
	public void boardEVList(PageTO<boardEVVO> to, Model model) {
		
		PageTO<boardEVVO> dbTO = evservice.pageList(to);
		model.addAttribute("dbevTO", dbTO);
	}
	
	@RequestMapping(value = "/boardEV/insert", method = RequestMethod.GET)
	public void boardEVinsertUI() {
	}
	
	@RequestMapping(value = "/boardEV/insert", method = RequestMethod.POST)
	public String boardEVinsert(boardEVVO vo) {
		evservice.boardEVinsert(vo);
		return "redirect:/NewGame";
	}
	
	@RequestMapping(value = "/boardEV/read")
	public void boardEVread(boardEVVO vo, Model model , PageTO<boardEVVO> to) {
		boardEVVO readvo  = evservice.boardEVread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardEV/update")
	public void boardEVupdateUI(int num,Model model,PageTO<boardEVVO> to) {
		boardEVVO updatevo = evservice.boardEVupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardEV/update", method = RequestMethod.POST)
	public String boardEVupdate(boardEVVO vo , PageTO<boardEVVO> to) {
		evservice.boardEVupdate(vo);
		return "redirect:/board/boardEV/read?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardEV/delete", method = RequestMethod.GET)
	public String boardEVdelete(int num , PageTO<boardEVVO> to) throws Exception {
		rservice.deleteAll(num);
		evservice.boardEVdelete(num);
		return "redirect:/NewGame?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardEV/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = evservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	/*
	 * @RequestMapping(value = "/board/mainboard", method = RequestMethod.GET)
	 * public void mainboard(PageTO<boardEVVO> to, Model model) {
	 * 
	 * PageTO<boardEVVO> dbTO = evservice.pageList(to); model.addAttribute("dbTO",
	 * dbTO);
	 * 
	 * }
	 */
}