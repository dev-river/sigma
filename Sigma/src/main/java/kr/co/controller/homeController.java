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
import kr.co.domain.SPageTO;
import kr.co.domain.boardVO;
import kr.co.service.boardService;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/")
public class homeController {
	
	@Autowired
	private replyService rservice;
	@Inject
	private boardService bservice;
	@Autowired
	private sboardService sbService;
	
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
	
	@RequestMapping("/searchMainboard")
	public void list(SPageTO sto, Model model) {
		SPageTO dbSTO = sbService.list(sto);
		model.addAttribute("to", dbSTO); 
	}
	
	@RequestMapping(value = "/searchMainboardread")
	public void read(Model model, int num, SPageTO sto) {
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
	
	@RequestMapping(value="/searchMainboardupdate", method = RequestMethod.GET) 
	public void	updateUI(Model model, SPageTO sto, int num) {
		boardVO vo = sbService.updateUI(num); 
		model.addAttribute("vo", vo);
		model.addAttribute("to", sto); 
	}

	@RequestMapping(value="/searchMainboardupdate", method = RequestMethod.POST)
	public String update(boardVO vo, SPageTO sto) { 
		
		sbService.update(vo);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:/searchMainboardread?num=");
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
	//======================================board END============================================
	
}
