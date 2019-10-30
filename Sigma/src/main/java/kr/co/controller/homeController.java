package kr.co.controller;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.adminSlideVO;
import kr.co.service.adminService;

@Controller
@RequestMapping("/")
public class homeController {
	@Inject
	private adminService adservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)//슬라이스
	public String home(Locale locale, Model model) {
		List<adminSlideVO> vo = adservice.slideList();
		String firstfilepath = vo.get(0).getFilepath();
		vo.remove(0);	
		model.addAttribute("firstfilepath", firstfilepath);
		model.addAttribute("filepath", vo);
		return "main";
	}
	@RequestMapping(value = "/board/qand", method = RequestMethod.GET)
	public String homeq(Locale locale, Model model) {
		return "main";
	}
}
