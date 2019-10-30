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
import kr.co.domain.boardVO;
import kr.co.service.boardService;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/board")
public class boardController {
	@Inject
	private boardService bservice;
	
	@Autowired
	private replyService rservice;
	
	@Autowired
	private sboardService sbService;
	
	@RequestMapping(value = "/main/list/boardlist", method = RequestMethod.GET)
	public void boardFRList(PageTO<boardVO> to, Model model) {
		
		PageTO<boardVO> dbTO = bservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	}
	
	@RequestMapping(value = "/main/list/boardinsert", method = RequestMethod.GET)
	public void boardFRinsertUI() {
	}
	
	@RequestMapping(value = "/main/list/boardinsert", method = RequestMethod.POST)
	public String boardFRinsert(boardVO vo) {
		bservice.boardFRinsert(vo);
		return "redirect:/board/main/list/boardlist";
	}
	
	@RequestMapping(value = "/main/list/boardread")
	public void boardFRread(boardVO vo, Model model , PageTO<boardVO> to) {
		boardVO readvo  = bservice.boardFRread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/list/boardupdate")
	public void boardFRupdateUI(int num,Model model,PageTO<boardVO> to) {
		boardVO updatevo = bservice.boardFRupdateUI(num);
		model.addAttribute("updatevo", updatevo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/list/boardupdate", method = RequestMethod.POST)
	public String boardFRupdate(boardVO vo , PageTO<boardVO> to) {
		bservice.boardFRupdate(vo);
		return "redirect:/board/main/list/boardread?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardFR/delete", method = RequestMethod.GET)
	public String boardFRdelete(int num , PageTO<boardVO> to) throws Exception {
		rservice.deleteAll(num);
		bservice.boardFRdelete(num);
		return "redirect:/board/main/list/boardlist?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardFR/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = bservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	//==========================================slist======================================================
	
	@RequestMapping("/main/slist/searchboardlist")
	public void list(SPageTO<boardVO> sto, Model model) {
		SPageTO<boardVO> dbSTO = sbService.list(sto);
		model.addAttribute("to", dbSTO); 
	}
	
	@RequestMapping(value = "/main/slist/searchboardread")
	public void read(Model model, int num, SPageTO<boardVO> sto) {
		boardVO svo = sbService.read(num);
		
		model.addAttribute("vo", svo);
		model.addAttribute("to", sto);
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchMainboardDel", method = RequestMethod.POST)
	public void delete(int num) {
		rservice.deleteAll(num);
	    sbService.del(num);
	}
	
	@RequestMapping(value="/main/slist/searchboardupdate", method = RequestMethod.GET) 
	public void	updateUI(Model model, SPageTO<boardVO> sto, int num) {
		boardVO vo = sbService.updateUI(num); 
		model.addAttribute("vo", vo);
		model.addAttribute("to", sto); 
	}

	@RequestMapping(value="/main/slist/searchboardupdate", method = RequestMethod.POST)
	public String update(boardVO vo, SPageTO<boardVO> sto) { 
		
		sbService.update(vo);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:/board/main/slist/searchboardread?num=");
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
//		return "redirect:/sboard/read?bno="+vo.getBno()+"&curPage="+sto.getCurPage()+"&perPage"+sto.getPerPage()+"&searchType="+sto.getSearchType()+"&keyword="+sto.getKeyword();
	}
}