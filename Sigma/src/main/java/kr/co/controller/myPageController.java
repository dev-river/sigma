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
	
	//마이페이지로 넘어가는 컨트롤러... 세션에 저장된 id를 가져와서 들어감
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
	
	
	//프로필 수정UI
	@RequestMapping(value = "/myProfile/update", method = RequestMethod.GET)
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = mpService.updateUI(id);
		model.addAttribute("updateUIInfo", vo);
	}
	
	
	//프로필 수정
	@RequestMapping(value = "/myProfile/update", method = RequestMethod.POST)
	public String update(memberVO vo) {
		mpService.update(vo);
		
		return "redirect:/myPage/myPage/mypage";
	}
	
	
	//회원 탈퇴
	@RequestMapping(value = "/myProfile/delete", method = RequestMethod.GET)
	public String delete(String id, String pw) {
		mpService.delete(id, pw);
		
		return "redirect:/member/login/logout";
	}
	
	//캐쉬충전UI
	@RequestMapping(value = "/cash/charge", method = RequestMethod.GET)
	public void chargeUI(String id, Model model) {
		System.out.println(id);
		memberVO vo = mpService.getMemberVO(id);
		model.addAttribute("usercash", vo);
	}


}