package kr.co.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.PageTO;
/*import kr.co.domain.SPageTO;*/
import kr.co.domain.boardOVO;
import kr.co.service.boardOService;
import kr.co.service.replyService;
import kr.co.service.sboardService;

@Controller
@RequestMapping("/board")
public class boardOneController {
	@Inject
	private boardOService oservice;
	
	@Autowired
	private replyService rservice;
	
	@Autowired
	private sboardService sbService;
	
	@RequestMapping(value = "/main/One/One", method = RequestMethod.GET)
	public void boardOList(PageTO<boardOVO> to, Model model) {
		
		PageTO<boardOVO> dbTO = oservice.pageList(to);
		model.addAttribute("dboTO", dbTO);
	}
	
	@RequestMapping(value = "/main/One/OneInsert", method = RequestMethod.GET)
	public void boardOinsertUI() {
	}
	
	@RequestMapping(value = "/main/One/OneInsert", method = RequestMethod.POST)
	public String boardFRinsert(boardOVO vo) {
		oservice.boardOinsert(vo);
		return "redirect:/board/main/One/One";
	}
	
	@RequestMapping(value = "/main/One/OneRead")
	public void boardOread(boardOVO vo, Model model , PageTO<boardOVO> to) {
		boardOVO readvo  = oservice.boardOread(vo);
		model.addAttribute("readvo", readvo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/One/OneUpdate")
	public void boardOupdateUI(int num,Model model,PageTO<boardOVO> to) {
		boardOVO updateo = oservice.boardOupdateUI(num);
		model.addAttribute("updateo", updateo);
		model.addAttribute("to", to);
	}
	
	@RequestMapping(value = "/main/One/OneUpdate", method = RequestMethod.POST)
	public String boardOupdate(boardOVO vo , PageTO<boardOVO> to) {
		oservice.boardOupdate(vo);
		return "redirect:/board/main/One/OneRead?num=" + vo.getNum()+"&curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
		
	}
	
	@RequestMapping(value = "/boardO/delete", method = RequestMethod.GET)
	public String boardOdelete(int num , PageTO<boardOVO> to) throws Exception {
		rservice.deleteAll(num);
		oservice.boardOdelete(num);
		return "redirect:/board/main/One/One?curPage="+to.getCurPage()+"&perPage="+to.getPerPage();
	}
	
	@ResponseBody
	@RequestMapping("/boardO/amount/{perPage}")
	public int list(@PathVariable("perPage") int perPage) {
		int amount = oservice.amount();
		System.out.println(amount);
		return (amount-1)/perPage+1;
	}
	
	//==========================================slist======================================================
	
	/*
	 * @RequestMapping("/main/slist/searchboardlist") public void
	 * list(SPageTO<boardVO> sto, Model model) { SPageTO<boardVO> dbSTO =
	 * sbService.list(sto); model.addAttribute("to", dbSTO); }
	 * 
	 * @RequestMapping(value = "/main/slist/searchboardread") public void read(Model
	 * model, int num, SPageTO<boardVO> sto) { boardVO svo = sbService.read(num);
	 * 
	 * model.addAttribute("vo", svo); model.addAttribute("to", sto); }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/searchMainboardDel", method = RequestMethod.POST)
	 * public void delete(int num) { rservice.deleteAll(num); sbService.del(num); }
	 * 
	 * @RequestMapping(value="/main/slist/searchboardupdate", method =
	 * RequestMethod.GET) public void updateUI(Model model, SPageTO<boardVO> sto,
	 * int num) { boardVO vo = sbService.updateUI(num); model.addAttribute("vo",
	 * vo); model.addAttribute("to", sto); }
	 * 
	 * @RequestMapping(value="/main/slist/searchboardupdate", method =
	 * RequestMethod.POST) public String update(boardVO vo, SPageTO<boardVO> sto) {
	 * 
	 * sbService.update(vo);
	 * 
	 * StringBuffer sb = new StringBuffer();
	 * sb.append("redirect:/board/main/slist/searchboardread?num=");
	 * sb.append(vo.getNum()); sb.append("&CurPage="); sb.append(sto.getCurPage());
	 * sb.append("&perPage="); sb.append(sto.getPerPage());
	 * sb.append("&searchType="); sb.append(sto.getSearchType());
	 * sb.append("&keyword="); sb.append(sto.getKeyword());
	 * 
	 * return sb.toString(); // return
	 * "redirect:/sboard/read?bno="+vo.getBno()+"&curPage="+sto.getCurPage()+
	 * "&perPage"+sto.getPerPage()+"&searchType="+sto.getSearchType()+"&keyword="+
	 * sto.getKeyword(); }
	 */
}