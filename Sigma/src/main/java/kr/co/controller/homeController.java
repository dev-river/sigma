package kr.co.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.domain.gameVO;
import kr.co.service.recommandService;
import kr.co.domain.adminSlideVO;
import kr.co.service.adminService;

@Controller
@RequestMapping("/")
public class homeController {
	@Inject
	private adminService adservice;
	@Inject
	private recommandService rservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<adminSlideVO> vo = adservice.slideList();
	
		String firstfilepath = vo.get(0).getFilepath();
		String firsturl = vo.get(0).geturlpath();
		vo.remove(0);	
	
		model.addAttribute("firstfilepath", firstfilepath);
		model.addAttribute("firsturl", firsturl);
		model.addAttribute("filepath", vo);
		
		List<gameVO> ngame = rservice.newgameRec();
		List<gameVO> hgame = rservice.hotgameRec();
		List<gameVO> dcgame = rservice.dcgameRec();
		model.addAttribute("ngame", ngame);
		model.addAttribute("dcgame", dcgame);
		model.addAttribute("hgame", hgame);

		return "main";
	}
	@RequestMapping(value = "/QnA", method = RequestMethod.GET)
	public String homeq(Locale locale, Model model) {
		return "QnA";
	}

}
