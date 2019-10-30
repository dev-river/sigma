package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.replyOVO;
import kr.co.service.replyOService;
import kr.co.service.replyService;

@RestController
@RequestMapping("/replyO")
public class replyOController {
	
	@Autowired
	private replyOService oservice;
	
	  /* Reply Insert 부분 */
	
	  @ResponseBody	
	  @RequestMapping(value = "", method = RequestMethod.POST , produces = "application/text; charset=utf-8") 
	  public ResponseEntity<String> replyInsert(replyOVO vo){

	 ResponseEntity<String> entity = null;
	  
		try {
			oservice.replyOInsert(vo);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	 
	/* Reply List 출력 부분 */
	/* 댓글 페이징 부분 수정 */
	@RequestMapping(value = "/{frnum}", method = RequestMethod.GET)
	public ResponseEntity<List<replyOVO>> replyOList(@PathVariable ("frnum") int frnum){
		ResponseEntity<List<replyOVO>> entity = null;
		
		try {
			List<replyOVO> replyList = oservice.replyOList(frnum);
			entity = new ResponseEntity<List<replyOVO>>(replyList, HttpStatus.OK); 
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new  ResponseEntity<List<replyOVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/{num}" , method = RequestMethod.POST , produces = "application/text; charset=utf-8")
	public ResponseEntity<String> replyOUpdate(@PathVariable("num") int num , replyOVO vo){
		ResponseEntity<String> entity = null;
		vo.setNum(num);
		
		try {
			oservice.replyOUpdate(vo);
			entity = new ResponseEntity<String>("UPDATE_SUCCESS", HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/{num}", method = RequestMethod.DELETE)
	public ResponseEntity<String> replyODelete(@PathVariable("num") int num){
		ResponseEntity<String> entity = null;
		
		try {
			oservice.Odelete(num);
			entity = new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
