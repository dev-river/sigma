package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;
import kr.co.domain.memberVO;
import kr.co.service.gameDetailService;

@Controller
@RequestMapping("/gameDetail")
public class gameDetailController {
	@Inject
	private gameDetailService gservice;
	
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
	
	@RequestMapping(value = "/main/maincategory", method = RequestMethod.GET)
    public void gameDetaillist(Model model, String category, HttpServletRequest request, gPageTO<gameVO> to) {
		List<gameVO> vo = new ArrayList<gameVO>();
		to = gservice.list(to, category);
		
		model.addAttribute("vo", to);
		model.addAttribute("category", category);
}
	@RequestMapping(value = "/main/maincategoryread", method = RequestMethod.GET)
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
		gameDetailDcVO lastvo = null; 
		if(lastvo != null) {
			lastvo = list.get(list.size()-1);
			lastvo.setRqstartdate(lastvo.getRqstartdate().substring(0,10));
			lastvo.setRqenddate(lastvo.getRqenddate().substring(0,10));
			lastvo.setDcstartdate(lastvo.getDcstartdate().substring(0,10));
			lastvo.setDcenddate(lastvo.getDcenddate().substring(0,10));
		}
		
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
	
	@RequestMapping(value = "/inform/gameStatus")
	public String gameStatus(int num, String status) {
		if(status.equalsIgnoreCase("o")) {
			status = "x";
		}else {
			status = "o";
		}
		gservice.gameStatus(num, status);
		
		return "redirect:/main/maincategoryread?num=" + num;
	}
	
	@RequestMapping(value = "/main/maincategoryreviewupdate", method = RequestMethod.GET)
	public void reviewupdate(int num, Model model) {
		reviewVO vo = gservice.reviewselect(num);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/maincategoryreviewupdate", method = RequestMethod.POST)
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
		return "redirect:/gameDetail/main/maincategoryread?num="+num;
	}
	
	@RequestMapping(value = "/main/maincategoryupdate", method = RequestMethod.GET)
	public void update(Model model, int num) {
		gameVO vo = gservice.read(num);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/main/maincategoryupdate", method = RequestMethod.POST)
	public String update(gameVO vo) {
		gservice.update(vo);
		return "redirect:/main/maincategoryread?num="+vo.getNum();
	}
	
	@RequestMapping(value = "/inform/reviewadd")
	@ResponseBody
	public String reviewadd(int num, String assist) {
		gservice.reviewadd(num, assist);
		return "success";
	}
}