package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.basketVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.service.gameDetailService;
import kr.co.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	@Inject
	private myPageService mpService;
	
	@Inject
	private gameDetailService gservice;
	
	//마이페이지로 넘어가는 컨트롤러... 세션에 저장된 id를 가져와서 들어감
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/myPage/mypage", method = RequestMethod.GET)
	public void myPage(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		model.addAttribute("myinfo", obj);
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
		memberVO vo = mpService.getMemberVO(id);
		model.addAttribute("usercash", vo);
	}
	
	//캐쉬충전UI
	@RequestMapping(value = "/cash/charge", method = RequestMethod.POST)
	public String charge(int cash, String id) {
		
		mpService.updateCash(cash, id);
		
		return "redirect:/myPage/myPage/mypage";
	}
	
	//장바구니로 이동
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/shopBasket/regiBasket", method = RequestMethod.GET)
	public void regiBasget(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		model.addAttribute("myInfo", obj);
		
		//내가 가지고 있는게임 리스트 가져오기
		String id = obj.getId();
		List<basketVO> list = mpService.getBasket(id);
		model.addAttribute("basket", list);
	}
	
	//게임 장바구니에 집어넣기
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/shopBasket/regiBasket", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	public String regiBasget(HttpServletRequest request, int gdnum) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		
		List<basketVO> list = mpService.getBasket(obj.getId());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGdnum() == gdnum) {
				return "failed";
			}
		}
		mpService.regiBasket(obj.getId(), gdnum);
		
		return "success";
	}
	
	//장바구니에서 게임 제거
	@ResponseBody
	@RequestMapping(value = "/shopBasket/delete", method = RequestMethod.POST)
	public void deleteBasketList(int gdnum, String id) {
		mpService.deleteBasketList(gdnum, id);
	}
	
	
	//찜목록으로 이동
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/zzimList/list", method = RequestMethod.GET)
	public void zzim_list(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		model.addAttribute("myInfo", obj);
		
		//내가 가지고 있는게임 리스트 가져오기
		String id = obj.getId();
		List<basketVO> list = mpService.zzim_list(id);
		model.addAttribute("zzim", list);
	}
	
		
	//찜목록에 게임 저장
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value="/zzimList/list", method = RequestMethod.POST)
	public String zzim_insert(HttpServletRequest request, int gdnum) {
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		
		List<basketVO> list = mpService.zzim_list(obj.getId());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGdnum() == gdnum) {
				return "failed";
			}
		}
		mpService.zzim_insert(obj.getId(), gdnum);
		
		return "success";
	}
	
	//찜목록에서 게임 제거
	@ResponseBody
	@RequestMapping(value = "/zzimList/delete", method = RequestMethod.POST)
	public void zzimDelete(int gdnum, String id) {
		mpService.zzimDelete(gdnum, id);
	}
	
	
	//게임 정보 가져오기 ㅠㅠ
	@ResponseBody
	@RequestMapping(value = "/shopBasket/gameInfo", method = RequestMethod.GET)
	public gameVO gameInfo(int gdnum) {
		
		gameVO vo = gservice.read(gdnum);
		
		return vo;
	}
	

}