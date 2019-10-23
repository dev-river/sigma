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
import kr.co.domain.boardNGVO;
import kr.co.service.boardNGService;
import kr.co.service.boardService;
import kr.co.service.replyService;

@Controller
@RequestMapping("/board")
public class boardNGController {
	@Inject
	private boardNGService ngservice;
	
	@Autowired
	private replyService rservice;

	@RequestMapping(value = "boardNG/list", method = RequestMethod.GET)
	public void boardNGList(PageTO<boardNGVO> to, Model model) {
		
		PageTO<boardNGVO> dbTO = ngservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	}
	
	@RequestMapping(value = "/boardNG/insert", method = RequestMethod.GET)
	public void boardNGinsertUI() {
	}
	
	@RequestMapping(value = "/boardNG/insert", method = RequestMethod.POST)
	public String boardNGinsert(boardNGVO vo) {
		ngservice.boardNGinsert(vo);
		return "redirect:/NewGame";
	}
	
	@RequestMapping(value = "/boardNG/read")
	public void boardNGread(boardNGVO vo, Model model , PageTO<boardNGVO> to) {
		boardNGVO readvo  = ngservice.boardNGread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardNG/update")
	public void boardNGupdateUI(int num,Model model,PageTO<boardNGVO> to) {
		boardNGVO updatevo = ngservice.boardNGupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/boardNG/update", method = RequestMethod.POST)
	public String boardNGupdate(boardNGVO vo , PageTO<boardNGVO> to) {
		ngservice.boardNGupdate(vo);
		return "redirect:/board/boardNG/read?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardNG/delete", method = RequestMethod.GET)
	public String boardNGdelete(int num , PageTO<boardNGVO> to) throws Exception {
		rservice.deleteAll(num);
		ngservice.boardNGdelete(num);
		return "redirect:/NewGame?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardNG/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = ngservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	/*
	 * @RequestMapping(value = "/board/mainboard", method = RequestMethod.GET)
	 * public void mainboard(PageTO<boardNGVO> to, Model model) {
	 * 
	 * PageTO<boardNGVO> dbTO = ngservice.pageList(to); model.addAttribute("dbTO",
	 * dbTO);
	 * 
	 * }
	 */
}