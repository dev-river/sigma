package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.memberVO;
import kr.co.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	@Inject
	private myPageService mpService;
	
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/myPage/mypage", method = RequestMethod.GET)
	public void myPage(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		Object obj = session.getValue("login");
		String sobj = obj.toString();
		int a = sobj.indexOf("id=");
		int b = sobj.indexOf(",");
		String userId = sobj.substring(a+3, b);

		memberVO vo = mpService.getMemberVO(userId);
		model.addAttribute("myinfo", vo);
	}
	
	@RequestMapping(value = "/myProfile/update", method = RequestMethod.GET)
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = mpService.updateUI(id);
		model.addAttribute("updateUIInfo", vo);
	}
	
	@RequestMapping(value = "/myProfile/update", method = RequestMethod.POST)
	public String update(memberVO vo) {
		
		mpService.update(vo);
		
		return "redirect:/myPage/myPage/mypage";
	}
	
	@RequestMapping(value = "/myProfile/delete", method = RequestMethod.GET)
	public String delete(String id, String pw) {
		mpService.delete(id, pw);
		
		return "redirect:/member/login/logout";
		
	}


}