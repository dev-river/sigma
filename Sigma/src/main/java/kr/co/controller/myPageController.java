package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		HttpSession session = request.getSession(false);
		Object obj = session.getValue("login");
		String sobj = obj.toString();
		int a = sobj.indexOf("id=");
		int b = sobj.indexOf(",");
		String userId = sobj.substring(a+3, b);

		memberVO vo = mpService.getMemberVO(userId);
		model.addAttribute("myinfo", vo);
	}


}