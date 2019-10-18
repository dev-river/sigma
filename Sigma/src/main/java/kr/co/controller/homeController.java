package kr.co.controller;

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
@RequestMapping("/")
public class homeController {
	
	@Autowired
	private replyService rservice;
	@Inject
	private boardService bservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
  
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String event(Locale locale, Model model) {
		return "event";
	}
	
	//======================================board==================================================
	@RequestMapping(value = "/mainboard", method = RequestMethod.GET)
	public void mainboard(PageTO to, Model model) {
		
		PageTO dbTO = bservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
		
	}
	@RequestMapping(value = "/mainboardinsert", method = RequestMethod.GET)
	public void boardFRmaininsertUI() {
	}
	
	@RequestMapping(value = "/mainboardinsert", method = RequestMethod.POST)
	public String boardFRmaininsert(boardVO vo) {
		bservice.boardFRinsert(vo);
		return "redirect:/mainboard";
	}
	@RequestMapping(value = "/mainboardread")
	public void boardFRmainread(boardVO vo, Model model , PageTO to) {
		boardVO readvo  = bservice.boardFRread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	@RequestMapping(value = "/mainboardupdate")
	public void boardFRupdateUI(int num,Model model,PageTO to) {
		boardVO updatevo = bservice.boardFRupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/mainboardupdate", method = RequestMethod.POST)
	public String boardFRupdate(boardVO vo , PageTO to) {
		bservice.boardFRupdate(vo);
		return "redirect:/mainboardread?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardFR/delete", method = RequestMethod.GET)
	public String boardFRdelete(int num , PageTO to) throws Exception {
		bservice.boardFRdelete(num);
		return "redirect:/mainboard?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = bservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	//======================================board END============================================
	
}
