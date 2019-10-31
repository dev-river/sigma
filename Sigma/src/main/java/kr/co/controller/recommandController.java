package kr.co.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.PageTO;
import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.service.adminService;
import kr.co.service.recommandService;
import kr.co.utils.UploadFileUtils;

@Controller
@RequestMapping("/recommand/main")
public class recommandController {
	
	@Inject
	private recommandService rservice;
	
	@RequestMapping(value = "/newgameRec", method = RequestMethod.GET)
	public void newgameRec(Model model, SPageTO to) {
		to = rservice.newgameRec(to);
		model.addAttribute("vo", to);
	}
	
	@RequestMapping(value = "/freegameRec", method = RequestMethod.GET)
	public void freegameRec(Model model, SPageTO to) {
		to = rservice.freegameRec(to);
		model.addAttribute("vo", to);
	}
	
	@RequestMapping(value = "/dcgameRec", method = RequestMethod.GET)
	public void dcgameRec(Model model, SPageTO to) {
		to = rservice.dcgameRec(to);
		model.addAttribute("vo", to);
	}
	
	@RequestMapping(value = "/hotgameRec", method = RequestMethod.GET)
	public void hotgameRec(Model model, SPageTO to) {
		to = rservice.hotgameRec(to);
		model.addAttribute("vo", to);
	}
	
	@RequestMapping(value = "/customRec", method = RequestMethod.GET)
	public void customRec(Model model, SPageTO to, HttpServletRequest requset) {
		HttpSession session = requset.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		String id = obj.getId();
		
		to = rservice.customRec(to, id);
		model.addAttribute("vo", to);
	}
}