package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.PageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.boardVO;
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
	
	/*
	 @RequestMapping(value = "/sUserManage/userlist", method = RequestMethod.GET)
	 public void adminSUserList(Model model) { List<memberVO> vo =
	 adservice.adminSUserList(); model.addAttribute("vo", vo); }
	 */
	
	
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
	
	@RequestMapping(value = "/userManage/update")
	public void userAuthorUI(String id, Model model) {
		memberVO updatevo = adservice.userAuthorUI(id);
		model.addAttribute("updatevo", updatevo);
	}

	@RequestMapping(value = "/userManage/update", method = RequestMethod.POST)
	public String userAuthor(memberVO vo) {
		adservice.userAuthor(vo);
		return "redirect:/admin/userManage/read?id=" + vo.getId();
	}

	@RequestMapping(value = "/userManage/delete", method = RequestMethod.GET)
	public String userDelete(String id) {
		adservice.userDelete(id);
		return "redirect:/admin/userManage/userlist";
	}
	
/*	@RequestMapping(value = "/boardManage/boardFRlist")
	public void boardManageFRlist(PageTO to, Model model) {
		
		PageTO dbTO = adservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	} */

//	@RequestMapping(value = "/adminSetting/imgManage")
//	public void imgManageUI(Model model) {
//		adminSetVO updatevo = adservice.imgManage();
//		model.addAttribute("updatevo", updatevo);
//	}
//
//	@RequestMapping(value = "/adminSetting/imgManage", method = RequestMethod.POST)
//	public String imgManage(adminSetVO vo) {
//		adservice.imgManage(vo);
//		return "redirect:/admin/adminSetting/imgManage";
//	}
	
	@RequestMapping(value = "/adminSetting/chargeManage")
	public void changeChargeUI(Model model) {
		adminSetVO updatevo = adservice.changeChargeUI();
		model.addAttribute("updatevo", updatevo);
	}
	
	@RequestMapping(value = "/adminSetting/chargeManage", method = RequestMethod.POST)
	public String changeCharge(adminSetVO vo) {
		adservice.changeCharge(vo);
		return "redirect:/admin/adminSetting/chargeManage/";
	}
}