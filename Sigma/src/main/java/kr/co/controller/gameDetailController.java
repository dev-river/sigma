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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/inform/list", method = RequestMethod.GET)
	public void gameDetaillist(Model model, String category) {
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
		//Session 정보 가져오기
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		String id = obj.getId();
		String author = obj.getAuthor();
		model.addAttribute("id", id);
		model.addAttribute("author", author);
		
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
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewinsert", method = RequestMethod.POST)
	public void reviewinsert(int gdnum, String reviewContent, String likeselect, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		String id = obj.getId();
		
		gservice.reviewinsert(gdnum, reviewContent, likeselect, id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewupdate", method = RequestMethod.GET)
	public void reviewupdate(int num) {
		
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
	
	@RequestMapping(value = "/inform/update", method = RequestMethod.GET)
	public void update(Model model, int num) {
		gameVO vo = gservice.read(num);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/inform/update", method = RequestMethod.POST)
	public String update(gameVO vo) {
		gservice.update(vo);
		return "redirect:/gameDetail/inform/read?num="+vo.getNum();
	}
	
	@RequestMapping(value = "/inform/reviewadd")
	@ResponseBody
	public String reviewadd(int num, String assist) {
		gservice.reviewadd(num, assist);
		return "success";
	}
}