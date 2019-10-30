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
import kr.co.domain.SPageTO;
import kr.co.domain.boardNGVO;
import kr.co.domain.boardVO;
import kr.co.service.boardNGService;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/board")
public class boardNGController {
	@Inject
	private boardNGService ngservice;
	
	@Autowired
	private replyService rservice;
	
	@Autowired
	private sboardService sbService;

	@RequestMapping(value = "/main/newgame/NewGame", method = RequestMethod.GET)
	public void boardNGList(PageTO<boardNGVO> to, Model model) {
		
		PageTO<boardNGVO> dbTO = ngservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	}
	
	@RequestMapping(value = "/main/newgame/NewGameInsert", method = RequestMethod.GET)
	public void boardNGinsertUI() {
	}
	
	@RequestMapping(value = "/main/newgame/NewGameInsert", method = RequestMethod.POST)
	public String boardNGinsert(boardNGVO vo) {
		ngservice.boardNGinsert(vo);
		return "redirect:/board/main/newgame/NewGame";
	}
	
	@RequestMapping(value = "/main/newgame/NewGameRead")
	public void boardNGread(boardNGVO vo, Model model , PageTO<boardNGVO> to) {
		boardNGVO readvo  = ngservice.boardNGread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/newgame/NewGameUpdate")
	public void boardNGupdateUI(int num,Model model,PageTO<boardNGVO> to) {
		boardNGVO updatevo = ngservice.boardNGupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/newgame/NewGameUpdate", method = RequestMethod.POST)
	public String boardNGupdate(boardNGVO vo , PageTO<boardNGVO> to) {
		ngservice.boardNGupdate(vo);
		return "redirect:/board/main/newgame/NewGameRead?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardNG/delete", method = RequestMethod.GET)
	public String boardNGdelete(int num , PageTO<boardNGVO> to) throws Exception {
		rservice.deleteAll(num);
		ngservice.boardNGdelete(num);
		return "redirect:/board/main/newgame/NewGame?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardNG/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = ngservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	/* ============================================slist===========================	 */
	
	@RequestMapping("/main/slist/searchboardNGList")
	public void list(SPageTO<boardNGVO> sto, Model model) {
		SPageTO<boardNGVO> dbSTO = sbService.NGList(sto);
		model.addAttribute("to", dbSTO);
	}
	
	@RequestMapping(value = "/main/slist/searchboardNGRead")
	public void read(Model model, int num, SPageTO<boardNGVO> sto) {
		boardNGVO svo = sbService.NGRead(num);
		
		model.addAttribute("vo", svo);
		model.addAttribute("to", sto);
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchMainboardNGDel", method = RequestMethod.POST)
	public void NGDelete(int num) {
		rservice.deleteAll(num);
	    sbService.del(num);
	}
	
	@RequestMapping(value="/main/slist/searchboardNGUpdate", method = RequestMethod.GET) 
	public void	updateUI(Model model, SPageTO<boardNGVO> sto, int num) {
		boardNGVO vo = sbService.NGUpdateUI(num); 
		model.addAttribute("vo", vo);
		model.addAttribute("to", sto); 
	}

	@RequestMapping(value="/main/slist/searchboardNGUpdate", method = RequestMethod.POST)
	public String update(boardNGVO vo, SPageTO<boardNGVO> sto) { 
		
		sbService.NGUpdate(vo);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:/board/main/slist/searchboardNGRead?num=");
		sb.append(vo.getNum());
		sb.append("&CurPage=");
		sb.append(sto.getCurPage());
		sb.append("&perPage=");
		sb.append(sto.getPerPage());
		sb.append("&searchType=");
		sb.append(sto.getSearchType());
		sb.append("&keyword=");
		sb.append(sto.getKeyword());
		
		return sb.toString();

	
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
}