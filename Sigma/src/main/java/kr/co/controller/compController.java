package kr.co.controller;

import java.io.PrintWriter;
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
	
	//판매자가 등록한 게임 리스트
	@RequestMapping(value = "/gameList/gameList")
	public void gamelist(String writer, Model model) {
		List<gameVO> gamelist = compservice.gamelist(writer);
		List<gameDetailDcVO> gameDetailDC =  compservice.gameDetailDC(writer);
		model.addAttribute("gamelist", gamelist);
		model.addAttribute("gameDetailDC", gameDetailDC);
	}
	
	//게임 등록 UI
	@RequestMapping(value = "/gameList/gameInsert")
	public void gameinsertUI(@RequestParam String writer, Model model) {
		int cash = compservice.seachcash(writer);
		model.addAttribute("cash", cash);
	}
	
	//게임 등록
	@RequestMapping(value = "/gameList/gameInsert", method = RequestMethod.POST)
	public String gameinsert(gameVO vo) {
		//판매자의 캐시 1000원을 관리자에게 준다
		compservice.sellermoney(vo);
		compservice.givemoney();
		//게임 등록
		compservice.gameinsert(vo);
		return "redirect:/compManage/gameList/gameList?writer="+vo.getWriter();
	}
	
	//환불 리스트
	@RequestMapping(value = "/refund/refundList")
	public void refundList(@RequestParam String id, Model model) {
		List<refundVO> list = compservice.refundList(id);
		model.addAttribute("list", list);
	}
	
	//환불 상세보기
	@RequestMapping(value = "/refund/refundRead")
	public void refundRead(String id, Model model) {
		refundVO rvo = compservice.refundRead(id);
		model.addAttribute("vo", rvo);
	}
	
	//환불 승인
	@ResponseBody
	@RequestMapping(value = "/refund/refundOK", method = RequestMethod.POST)
	public String refundOK(int num, int buynum, String id, String userid) {
		int cash = compservice.seachcash(userid);
		System.out.println(num+":"+buynum+":"+id+":"+cash);
		//캐시 부족 일 경우
		if(cash < buynum) {
			return "wait";
		}else {
			//캐시 확인 후 승인 및 사용자에게 캐시 환원
			compservice.refundOK(num);
			//판매자의 캐시에서 판매가격의 90% 만큼 캐시 차감
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("userid", userid);
			map1.put("buynum", buynum);
			compservice.giveback1(map1);
			//관리자의 캐시는 판매가격의 10%만큼 캐시 차감
			compservice.giveback2(buynum);
			//환불 신청 받은 buynum만큼 캐시 돌려 받음
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("buynum", buynum);
			map2.put("id", id);
			compservice.returncash(map2);
			return "ok";
		}
	}
	
	//환불 거절
	@ResponseBody
	@RequestMapping(value = "/refund/refundReject", method = RequestMethod.POST)
	public void refundReject(int num, String inputString) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("inputString", inputString);
		compservice.refundReject(map);
	}
	
	
}
