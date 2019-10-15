package kr.co.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.replyVO;
import kr.co.service.replyService;

@Controller
public class homeController {
	
	@Autowired
	private replyService rservice;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "", method = RequestMethod.POST , produces =
	 * "application/text; charset=utf-8") public String replyInsert(replyVO vo){
	 * 
	 * System.out.println(
	 * "testestestsaetsdf----------------------------------------------------");
	 * 
	 * try { rservice.replyInsert(vo); // entity = new
	 * ResponseEntity<String>("INSERT_SUCCESS",HttpStatus.CREATED);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); // entity = new
	 * ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST); } return
	 * "Insert_success"; }
	 */
	
}
