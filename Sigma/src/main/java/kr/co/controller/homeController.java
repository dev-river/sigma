package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;
import kr.co.service.boardService;
import kr.co.service.gameDetailService;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/")
public class homeController {
	
	@Autowired
	private replyService rservice;
	@Inject
	private boardService bservice;

  @Inject
	private gameDetailService gservice;

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

	public Map<String, Object> sessionInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//Session 정보 가져오기
		String id = null;
		String author = null;
		HttpSession session = request.getSession();
		
		if(session.getValue("login") != null) {
			memberVO obj = (memberVO) session.getValue("login");
			if (obj.getId() != null) {
				id = obj.getId();
			}
			if (obj.getAuthor() != null) {
				author = obj.getAuthor();
			}

			map.put("id", id);
			map.put("author", author);
		}

		return map;
	}
	
	@RequestMapping(value = "/inform/list", method = RequestMethod.GET)
	public void gameDetaillist(Model model, String category, HttpServletRequest request) {
		//list 페이지 파라미터로 category
		if(category.equalsIgnoreCase("all")) {
			category = "%";
		}
		List<gameVO> vo = new ArrayList<gameVO>();
		vo = gservice.list(category);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/inform/read", method = RequestMethod.GET)
	public void gameDetailread(Model model, int num, HttpServletRequest request) {
		String id = null; String author = null;
		Map<String, Object> sessioninfo = sessionInfo(request);
		id = (String) sessioninfo.get("id");
		author = (String) sessioninfo.get("author");
		
		//num으로 gameVO 상세정보 부르기 from gameDetail
		gameVO vo = gservice.read(num);
		
		//해당 num에 걸려있는 이미지 파일 가져오기  from gameDetailFile
		List<String> filepath = gservice.filepath(num);
		if(filepath.size() == 0) {
	         filepath.add("noimage.png");
	         filepath.add("noimage.png");
	      }
	      if(filepath.size() == 1) {
	         filepath.add("noimage.png");
	      }
		String firstfilepath = filepath.get(1);
		filepath.remove(0);
		filepath.remove(0);
		
		//할인정보 가져오기
		gameDetailDcVO dcvo = null;
		dcvo = gservice.dccheck(num);
		dcvo.setRqstartdate(dcvo.getRqstartdate().substring(0, 10));
		dcvo.setRqenddate(dcvo.getRqenddate().substring(0, 10));
		dcvo.setDcstartdate(dcvo.getDcstartdate().substring(0, 10));
		dcvo.setDcenddate(dcvo.getDcenddate().substring(0, 10));
		
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
		model.addAttribute("id", id);
		model.addAttribute("author", author);
	}
	
	@RequestMapping(value = "/inform/DCRqSet", method = RequestMethod.GET)
	public void DCRqSet(int num, String title, Model model) {
		List<gameDetailDcVO> list = gservice.dcrqlist(num);
		gameDetailDcVO lastvo = list.get(list.size()-1);
		lastvo.setRqstartdate(lastvo.getRqstartdate().substring(0,10));
		lastvo.setRqenddate(lastvo.getRqenddate().substring(0,10));
		lastvo.setDcstartdate(lastvo.getDcstartdate().substring(0,10));
		lastvo.setDcenddate(lastvo.getDcenddate().substring(0,10));
		
		model.addAttribute("list", list);
		model.addAttribute("lastvo", lastvo);
		model.addAttribute("title", title);
		model.addAttribute("num", num);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/DCRqSet", method = RequestMethod.POST)
	public void DCRqSet(gameDetailDcVO vo) {
		gservice.DCRqSet(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewinsert", method = RequestMethod.POST)
	public void reviewinsert(int gdnum, String reviewContent, String likeselect, HttpServletRequest request) {
		String id = null;
		Map<String, Object> sessioninfo = sessionInfo(request);
		id = (String) sessioninfo.get("id");
		
		gservice.reviewinsert(gdnum, reviewContent, likeselect, id);
	}
	
	@RequestMapping(value = "/inform/reviewupdate", method = RequestMethod.GET)
	public void reviewupdate(int num, Model model) {
		reviewVO vo = gservice.reviewselect(num);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewupdate", method = RequestMethod.POST)
	public void reviewupdate(reviewVO vo) {
		gservice.reviewupdate(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewdelete", method = RequestMethod.GET)
	public void reviewdelete(int num) {
		gservice.reviewdelete(num);
	}
	
	@RequestMapping(value = "/inform/dcCountAdd", method = RequestMethod.GET)
	public String gameDetailDCcountAdd(Model model, int num) {
		gservice.dcadd(num);
		return "redirect:/gameDetail/inform/read?num="+num;
	}
	

	@RequestMapping(value = "/inform/reviewadd")
	@ResponseBody
	public String reviewadd(int num, String assist) {
		gservice.reviewadd(num, assist);
		return "success";
	}

	//======================================gameDetail END============================================
}
