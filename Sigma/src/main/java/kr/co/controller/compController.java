package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
import kr.co.service.compService;

@Controller
@RequestMapping(value = "/compManage")
public class compController {
	
	@Inject
	private compService compservice;
	
	@RequestMapping(value = "/compInform/read")
	public void read(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
		int count = compservice.count(id);
		model.addAttribute("vo", vo);
		model.addAttribute("count", count);
	}
	
	@RequestMapping(value = "/compInform/update")
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
		System.out.println(vo.getId());
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/compInform/update", method = RequestMethod.POST)
	public String update(memberVO vo) {
		compservice.update(vo);
		return "redirect:/compManage/compInform/read?id="+vo.getId();
	}
	
	@RequestMapping(value = "/compInform/delete", method = RequestMethod.POST)
	public void delete(String id) {
		compservice.delete(id);
	}
	
	@RequestMapping(value = "/gameList/gameList")
	public void gamelist(String writer, Model model) {
		List<gameVO> gamelist = compservice.gamelist(writer);
		List<gameDetailDcVO> gameDetailDC =  compservice.gameDetailDC(writer);
		model.addAttribute("gamelist", gamelist);
		model.addAttribute("gameDetailDC", gameDetailDC);
	}
	
	@RequestMapping(value = "/gameList/gameInsert")
	public void gameinsertUI() {}
	
	@RequestMapping(value = "/gameList/gameInsert", method = RequestMethod.POST)
	public String gameinsert(gameVO vo) {
		compservice.gameinsert(vo);
		return "redirect:/compManage/gameList/gameList?writer="+vo.getWriter();
	}
	
	@RequestMapping(value = "/refund/refundList")
	public void refundList(@RequestParam String id, Model model) {
		List<refundVO> list = compservice.refundList(id);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value = "/refund/refundRead")
	public void refundRead(String id, Model model) {
		refundVO rvo = compservice.refundRead(id);
		model.addAttribute("vo", rvo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/refund/refundOK", method = RequestMethod.POST)
	public void refundOK(int num, int buynum, String id) {
		compservice.refundOK(num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buynum", buynum);
		map.put("id", id);
		compservice.returncash(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/refund/refundReject", method = RequestMethod.POST)
	public void refundReject(String id, int num, String inputString) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("inputString", inputString);
		compservice.refundReject(map);
	}
	
	
}
