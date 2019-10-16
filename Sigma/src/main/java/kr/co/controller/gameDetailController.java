package kr.co.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.gameVO;
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
		System.out.println(vo);
		
		model.addAttribute("vo", vo);
	}
}