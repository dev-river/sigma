package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.service.gameDetailService;

@Controller
@RequestMapping("/gameDetail")
public class gameDetailController {
	@Inject
	private gameDetailService gservice;
	
	@RequestMapping(value = "/inform/list", method = RequestMethod.GET)
	public void gameDetaillist(Model model, String category) {
		if(category.equalsIgnoreCase("all")) {
			category = "%";
		}
		List<gameVO> vo = new ArrayList<gameVO>();
		vo = gservice.list(category);
		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/inform/read", method = RequestMethod.GET)
	public void gameDetailread(Model model, int num) {
		
		gameVO vo = gservice.read(num);
		List<String> filepath = gservice.filepath(num);
		String mainfilepath = filepath.get(0);
		filepath.remove(0);
		model.addAttribute("vo", vo);
		model.addAttribute("mainfilepath", mainfilepath);
		System.out.println(filepath);
		model.addAttribute("filepath", filepath);
	}
	
	
}