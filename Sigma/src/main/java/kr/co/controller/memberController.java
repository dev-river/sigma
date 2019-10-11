package kr.co.controller;

import javax.inject.Inject;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.domain.memberVO;
import kr.co.service.memberService;

@Controller
@RequestMapping("/member")
public class memberController {
	@Inject
	private memberService mservice;
	
	
	//일반 회원가입 UI
	@RequestMapping(value = "/sign/signNorm", method = RequestMethod.GET)
	public void signin() {
	}

	
	//일반 회원가입
	@RequestMapping(value = "/sign/signNorm", method = RequestMethod.POST)
	public String signin(memberVO vo) {

		mservice.signin(vo);
		return "redirect:/board/boardFR/list";
	}
	
	
	//판매자 회원가입 UI
	@RequestMapping(value = "/sign/signComp", method = RequestMethod.GET)
	public void signincomp() {
	}
	
	//판매자 회원가입
	@RequestMapping(value = "/sign/signComp", method = RequestMethod.POST)
	public String signincomp(memberVO vo) {

		mservice.signincomp(vo);
		return "redirect:/board/boardFR/list";
	}
	
	
	//로그인 UI
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public void login() {
		
	}
	
	
	//로그인
	@RequestMapping(value = "/login/loginpost", method = RequestMethod.POST)
	public void login(memberVO vo, Model model) {

		memberVO mvo = mservice.login(vo);
		if (mvo == null) {
			return;
		}
		model.addAttribute("vo", mvo);
	}
	
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
		}
		
		return "redirect:/board/boardFR/list";
	}
	
	//ID찾기 UI
	@RequestMapping(value = "/login/searchID", method = RequestMethod.GET)
	public void searchID() {
		
	}
	
	//ID찾기
	@RequestMapping(value = "/login/searchID", method = RequestMethod.POST)
	public void searchID(memberVO vo, Model model) {
		memberVO mvo = mservice.searchID(vo);
		
		if(mvo != null) {
			model.addAttribute("vo", mvo);
		} else {
			model.addAttribute("err_searchID", "존재하는 아이디가 없습니다.");
		}
		
	}
	
	//PW찾기 UI
	@RequestMapping(value = "/login/searchPW", method = RequestMethod.GET)
	public void searchPW() {
		
	}
	
	//ID찾기
	@RequestMapping(value = "/login/searchPW", method = RequestMethod.POST)
	public void searchPW(memberVO vo, Model model) {
		memberVO mvo = mservice.searchPW(vo);
		
		if(mvo != null) {
			model.addAttribute("vo", mvo);
		} else {
			model.addAttribute("err_searchPW", "입력하신 정보가 맞지 않습니다.");
		}
		
	}
}