package kr.co.controller;

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

@Controller
@RequestMapping("/")
public class homeController {
   
	@Inject
	private recommandService rservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, SPageTO to) {
		List<gameVO> ngame = rservice.newgameRec();
		List<gameVO> hgame = rservice.hotgameRec();
		List<gameVO> dcgame = rservice.dcgameRec();
		model.addAttribute("ngame", ngame);
		model.addAttribute("dcgame", dcgame);
		model.addAttribute("hgame", hgame);
		return "main";
	}
	@RequestMapping(value = "/board/qand", method = RequestMethod.GET)
	public String homeq(Locale locale, Model model) {
		return "main";
	}
	
}
