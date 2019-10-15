package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.service.compService;

@Controller
@RequestMapping(value = "/compManage")
public class compController {
	
	@Inject
	private compService compservice;
	
	@RequestMapping(value = "/compInform/read")
	public void read(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/compInform/update")
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
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
		List<gameVO> list = compservice.gamelist(writer);
		model.addAttribute("gamelist", list);
	}
	
	@RequestMapping(value = "/gameList/gameInsert")
	public void gameinsertUI() {}
	
	@RequestMapping(value = "/gameList/gameInsert", method = RequestMethod.POST)
	public String gameinsert(gameVO vo) {
		compservice.gameinsert(vo);
		return "redirect:/compManage/gameList/gameList?writer=idid";
	}
}
