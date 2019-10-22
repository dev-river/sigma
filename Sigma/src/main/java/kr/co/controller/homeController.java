package kr.co.controller;

import java.util.ArrayList;
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
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;
import kr.co.service.boardService;
import kr.co.service.gameDetailService;
import kr.co.service.replyService;

@Controller
@RequestMapping("/")
public class homeController {
	
	@Autowired
	private replyService rservice;
	@Inject
	private boardService bservice;
	@Inject
	private gameDetailService gservice;
	
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
	
	//======================================gameDetail============================================
	@RequestMapping(value = "/maincategory", method = RequestMethod.GET)
	public void gameDetaillist(Model model, String category) {
		//list 페이지 파라미터로 category
		if(category.equalsIgnoreCase("all")) {
			category = "%";
		}
		List<gameVO> vo = new ArrayList<gameVO>();
		vo = gservice.list(category);
		
		model.addAttribute("vo", vo);
	}
	@RequestMapping(value = "/maincategoryread", method = RequestMethod.GET)
	public void gameDetailread(Model model, int num) {
		//num으로 gameVO 상세정보 부르기 from gameDetail
		gameVO vo = gservice.read(num);
		
		//해당 num에 걸려있는 이미지 파일 가져오기  from gameDetailFile
		List<String> filepath = gservice.filepath(num);
		String firstfilepath = filepath.get(1);
		filepath.remove(0);
		filepath.remove(0);
		
		//할인정보 가져오기
		gameDetailDcVO dcvo = null;
		dcvo = gservice.dccheck(num);
		
		//최다 리뷰글 가져오기
		reviewVO maxYesReview = gservice.maxYesReview(num);
		reviewVO maxNoReview= gservice.maxNoReview(num);
		
		//전체 리뷰글 가져오기
		List<reviewVO> reviewlist = gservice.reviewlist(num);
		
		
		model.addAttribute("vo", vo);
		model.addAttribute("firstfilepath", firstfilepath);
		model.addAttribute("filepath", filepath);
		model.addAttribute("dcvo", dcvo);
		model.addAttribute("maxYesReview", maxYesReview);
		model.addAttribute("maxNoReview", maxNoReview);
		model.addAttribute("reviewlist", reviewlist);
	}
	@RequestMapping(value = "/maincategoryupdate", method = RequestMethod.GET)
	public void update(Model model, int num) {
		gameVO vo = gservice.read(num);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/maincategoryupdate", method = RequestMethod.POST)
	public String update(gameVO vo) {
		gservice.update(vo);
		return "redirect:/maincategoryread?num="+vo.getNum();
	}
	//======================================gameDetail END============================================
}
