package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.memberVO;
import kr.co.service.adminService;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Inject
	private adminService adservice;

	@RequestMapping(value = "/userManage/userlist", method = RequestMethod.GET)
	public void adminUserList(Model model) {
		List<memberVO> vo = adservice.adminUserList();
		model.addAttribute("vo", vo);
	}

	@RequestMapping(value = "/userManage/sellerlist", method = RequestMethod.GET)
	public void adminSellerList(Model model) {
		List<memberVO> vo = adservice.adminSellerList();
		model.addAttribute("vo", vo);
	}

	@RequestMapping(value = "/userManage/adminlist", method = RequestMethod.GET)
	public void adminAdminList(Model model) {
		List<memberVO> vo = adservice.adminAdminList();
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/userManage/read")
	public void adminUserRead(memberVO vo, Model model) {
		memberVO readvo = adservice.adminUserRead(vo);
		model.addAttribute("readvo", readvo); 
	}
	/*
	 * @RequestMapping(value = "/boardFR/insert", method = RequestMethod.GET) public
	 * void boardFRinsertUI() { }
	 * 
	 * @RequestMapping(value = "/boardFR/insert", method = RequestMethod.POST)
	 * public String boardFRinsert(boardVO vo) { bservice.boardFRinsert(vo); return
	 * "redirect:/board/boardFR/list"; }
	 * 
	 * @RequestMapping(value = "/boardFR/read") public void boardFRread(boardVO vo,
	 * Model model) { boardVO readvo = bservice.boardFRread(vo);
	 * model.addAttribute("readvo", readvo); }
	 * 
	 * @RequestMapping(value = "/boardFR/update") public void boardFRupdateUI(int
	 * num,Model model) { boardVO updatevo = bservice.boardFRupdateUI(num);
	 * model.addAttribute("updatevo", updatevo); }
	 * 
	 * @RequestMapping(value = "/boardFR/update", method = RequestMethod.POST)
	 * public String boardFRupdate(boardVO vo) { bservice.boardFRupdate(vo); return
	 * "redirect:/board/boardFR/read?num=" + vo.getNum();
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/boardFR/delete", method = RequestMethod.GET) public
	 * String boardFRdelete(int num) { bservice.boardFRdelete(num); return
	 * "redirect:/board/boardFR/list";
	 * 
	 * }
	 */
}