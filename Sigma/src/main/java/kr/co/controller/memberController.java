package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void login(@ModelAttribute("vo") memberVO vo, HttpServletRequest request) {
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
	@RequestMapping(value = "/login/logout", method = RequestMethod.GET)
	public String login(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
		}
		Cookie[] arr = request.getCookies();
		Cookie loginCookie = null;
		if(arr != null){
			for(Cookie x : arr) {
				if(x.getName().equalsIgnoreCase("loginCookie")) {
					loginCookie = x;
					break;
				}
			}
			long curTime = System.currentTimeMillis();
			//jsid 있는지 확인하고 없으면 안 돌아가~~
			if(loginCookie != null) {
			String jsid = loginCookie.getValue();
			mservice.timeUpdate(jsid, curTime);
			
			for(int i = 0; i<arr.length; i++) {
				/* cookies[i].setPath("/"); */
				arr[i].setMaxAge(0);
				response.addCookie(arr[i]);
			}
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
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
			model.addAttribute("search_id", mvo);
		} else {
			model.addAttribute("err_searchID", "존재하는 아이디가 없습니다.");
		}
		
	}
	
	//PW찾기 UI
	@RequestMapping(value = "/login/searchPW", method = RequestMethod.GET)
	public void searchPW() {}
	
	//ID찾기
	@RequestMapping(value = "/login/searchPW", method = RequestMethod.POST)
	public void searchPW(memberVO vo, Model model) {
		memberVO mvo = mservice.searchPW(vo);
		
		if(mvo != null) {
			model.addAttribute("search_pw", mvo);
		} else {
			model.addAttribute("err_searchPW", "입력하신 정보가 맞지 않습니다.");
		}
	}
	
	//일반/판매자 회원 가입 선택
	@RequestMapping(value = "/sign/signSelect", method = RequestMethod.GET)
	public void signselect() {
	}
	
	//아이디/비밀번호 찾기 선택
	@RequestMapping(value = "/login/searchSelect", method = RequestMethod.GET)
	public void searchselect() {
	}
	
}