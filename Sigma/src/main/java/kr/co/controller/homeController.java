package kr.co.controller;

import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class homeController {
   
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	@RequestMapping(value = "/board/qand", method = RequestMethod.GET)
	public String homeq(Locale locale, Model model) {
		return "main";
	}
}
