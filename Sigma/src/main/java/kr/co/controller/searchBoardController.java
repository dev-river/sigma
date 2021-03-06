package kr.co.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.SPageTO;
import kr.co.domain.boardNGVO;
import kr.co.domain.boardVO;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/sboard")
public class searchBoardController {

	@Autowired
	private sboardService sbService;
	
	@Autowired
	private replyService rservice;

	
	/* ====================== 새게임소식 SEARCH부분 ===================================================*/
	
	@RequestMapping("/main/newgame/searchboardNGList")
	public void NGlist(SPageTO sto, Model model) {
		SPageTO dbSTO = sbService.NGList(sto);
		model.addAttribute("to", dbSTO); 
	}
	
	@RequestMapping(value = "/sboardNG/read")
	public void NGread(Model model, int num, SPageTO sto) {
		boardNGVO svo = sbService.NGRead(num);
		
		model.addAttribute("vo", svo);
		model.addAttribute("to", sto);
	}
	
	@RequestMapping(value="/main/slist/searchboardNGUpdate", method = RequestMethod.GET) 
	public void	NGupdateUI(Model model, SPageTO sto, int num) {
		boardNGVO vo = sbService.NGUpdateUI(num); 
		model.addAttribute("vo", vo);
		model.addAttribute("to", sto); 
	}

	@RequestMapping(value="/sboardNG/update", method = RequestMethod.POST)
	public String NGupdate(boardNGVO vo, SPageTO sto) { 
		
		sbService.NGUpdate(vo);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:/board/main/newgame/NewGame?num=");
		sb.append(vo.getNum());
		sb.append("&CurPage=");
		sb.append(sto.getCurPage());
		sb.append("&perPage=");
		sb.append(sto.getPerPage());
		sb.append("&searchType=");
		sb.append(sto.getSearchType());
		sb.append("&keyword=");
		sb.append(sto.getKeyword());
		
		return sb.toString();
//		return "redirect:/sboard/read?bno="+vo.getBno()+"&curPage="+sto.getCurPage()+"&perPage"+sto.getPerPage()+"&searchType="+sto.getSearchType()+"&keyword="+sto.getKeyword();
	}
	
	
	/* ====================== 자유게시판 SEARCH부분 ===================================================*/	
	@RequestMapping("/sboardFR/list")
	public void list(SPageTO sto, Model model) {
		SPageTO dbSTO = sbService.list(sto);
		model.addAttribute("to", dbSTO); 
	}

  @RequestMapping(value = "/sboardFR/read")
	public void read(Model model, int num, SPageTO sto) {
		boardVO svo = sbService.read(num);
		
		model.addAttribute("vo", svo);
		model.addAttribute("to", sto);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sboardFR/del", method = RequestMethod.POST)
	public void delete(int num) {
		rservice.deleteAll(num);
		sbService.del(num);

		/*
		 * StringBuffer sb = new StringBuffer();
		 * sb.append("redirect:/sboard/list?curPage="); sb.append(sto.getCurPage());
		 * sb.append("&perPage="); sb.append(sto.getPerPage());
		 * sb.append("&searchType="); sb.append(sto.getSearchType());
		 * sb.append("&keyword="); sb.append(sto.getKeyword());
		 * 
		 * return sb.toString();
		 */
		
		/*
		 * return "redirect:/sboard/list?curPage=" + sto.getCurPage() + "&perPage=" +
		 * sto.getPerPage() + "&searchType=" + sto.getSearchType() + "&keyword=" +
		 * sto.getKeyword(); 이걸로 해도되긴함
		 */

	}
	
	@RequestMapping(value="/sboardFR/update", method = RequestMethod.GET) 
	public void	updateUI(Model model, SPageTO sto, int num) {
		boardVO vo = sbService.updateUI(num); 
		model.addAttribute("vo", vo);
		model.addAttribute("to", sto); 
	}

	@RequestMapping(value="/sboardFR/update", method = RequestMethod.POST)
	public String update(boardVO vo, SPageTO sto) { 
		
		sbService.update(vo);
		
		StringBuffer sb = new StringBuffer();
		sb.append("redirect:/searchMainboardread?num=");
		sb.append(vo.getNum());
		sb.append("&CurPage=");
		sb.append(sto.getCurPage());
		sb.append("&perPage=");
		sb.append(sto.getPerPage());
		sb.append("&searchType=");
		sb.append(sto.getSearchType());
		sb.append("&keyword=");
		sb.append(sto.getKeyword());
		
		return sb.toString();
//		return "redirect:/sboard/read?bno="+vo.getBno()+"&curPage="+sto.getCurPage()+"&perPage"+sto.getPerPage()+"&searchType="+sto.getSearchType()+"&keyword="+sto.getKeyword();
	}

}
