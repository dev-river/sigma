package kr.co.controller;

import java.util.List;
import java.util.Locale;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.co.domain.SPageTO;
import kr.co.domain.gameVO;
import kr.co.service.recommandService;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.service.adminService;

@Controller
@RequestMapping("/")
public class homeController {
	@Inject
	private adminService adservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<adminSlideVO> vo = adservice.slideList();
	
		String firstfilepath = vo.get(0).getFilepath();
		String firsturl = vo.get(0).geturlpath();
		vo.remove(0);	
	
		model.addAttribute("firstfilepath", firstfilepath);
		model.addAttribute("firsturl", firsturl);
		model.addAttribute("filepath", vo);
//		
//		List<adminSetVO> to = adservice.setList();
//		String firstlogofile = to.get(0).getLogofilepath();
//
//		model.addAttribute("firstlogofile", firstlogofile);
//		model.addAttribute("logofilepath", to);

		

		return "main";
	}
	
	@RequestMapping(value = "/QnA", method = RequestMethod.GET)
	public String homeq(Locale locale, Model model) {
		return "QnA";
	}

}
