package kr.co.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.favoriteStoreVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
import kr.co.service.gameDetailService;
import kr.co.service.myPageService;

@Controller
@RequestMapping("/myPage")
public class myPageController {
	@Inject
	private myPageService mpService;
	
	@Inject
	private gameDetailService gservice;
	
	//마이페이지로 넘어가는 컨트롤러... 세션에 저장된 id를 가져와서 들어감
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/main/mypage", method = RequestMethod.GET)
	public void myPage(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		//세션에 저장된 id가져와서 정보 가져옴
		String id = obj.getId();
		obj = mpService.getMemberVO(id);
		//구매 기록
		List<buyListVO> list = mpService.buyList(id);
		//환불 기록
		List<refundVO> refundList = mpService.refundList(id);
		//단골 스토어
		List<favoriteStoreVO> favCompList = mpService.favCompList2(id);
		//보유 게임 수
		int gamecount = mpService.gameCount(id);
		//작성 글 수
		int writecount = mpService.writercount(id);
		//작성 리뷰 수
		int reviewcount = mpService.reviewcount(id);

		model.addAttribute("reviewcount", reviewcount);
		model.addAttribute("writecount", writecount);
		model.addAttribute("gamecount", gamecount);
		model.addAttribute("favComp", favCompList);
		model.addAttribute("buyList", list);
		model.addAttribute("refund", refundList);
		model.addAttribute("myinfo", obj);
	}
	
	
	//프로필 수정UI
	@RequestMapping(value = "/main/myprofile", method = RequestMethod.GET)
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = mpService.updateUI(id);
		model.addAttribute("updateUIInfo", vo);
	}
	
	
	//프로필 수정
	@RequestMapping(value = "/main/myprofile", method = RequestMethod.POST)
	public String update(memberVO vo) {
		mpService.update(vo);
		
		return "redirect:/myPage/main/mypage";
	}
	
	
	//회원 탈퇴
	@RequestMapping(value = "/myProfile/delete", method = RequestMethod.GET)
	public String delete(String id, String pw) {
		mpService.delete(id, pw);
		
		return "redirect:/member/login/logout";
	}
	
	//캐쉬충전UI
	@RequestMapping(value = "/main/cash", method = RequestMethod.GET)
	public void chargeUI(String id, Model model) {
		memberVO vo = mpService.getMemberVO(id);
		model.addAttribute("usercash", vo);
	}
	
	//캐쉬충전
	@RequestMapping(value = "/main/cash", method = RequestMethod.POST)
	public String charge(int cash, String id) {
		
		mpService.updateCash(cash, id);
		
		return "redirect:/myPage/main/mypage";
	}
	
	//장바구니로 이동
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/main/Basket", method = RequestMethod.GET)
	public void regiBasget(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		model.addAttribute("myInfo", obj);
		
		//내가 가지고 있는게임 리스트 가져오기
		String id = obj.getId();
		List<basketVO> list = mpService.getBasket(id);
		
		for(int i=0; i<list.size(); i++) {
			int gdnum = list.get(i).getGdnum();
			List<String> filepath = gservice.filepath(gdnum);
			if(filepath.size() == 0) {
				model.addAttribute("img", "noimage.png");
			} else if(filepath.size() != 0){
				String firstfilepath = filepath.get(0);
				model.addAttribute("img", firstfilepath);
			}
		}
		
		model.addAttribute("basket", list);
	}
	
	//게임 장바구니에 집어넣기
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "/main/Basket", method = RequestMethod.POST, produces = "application/text;charset=utf-8")
	public String regiBasget(HttpServletRequest request, int gdnum) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		
		List<basketVO> list = mpService.getBasket(obj.getId());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGdnum() == gdnum) {
				return "failed";
			}
		}
		mpService.regiBasket(obj.getId(), gdnum);
		
		return "success";
	}
	
	//장바구니에서 게임 제거
	@ResponseBody
	@RequestMapping(value = "/shopBasket/delete", method = RequestMethod.POST)
	public void deleteBasketList(int gdnum, String id) {
		mpService.deleteBasketList(gdnum, id);
	}
	
	
	//찜목록으로 이동
	@SuppressWarnings("deprecation")
	@RequestMapping(value = "/main/zzim", method = RequestMethod.GET)
	public void zzim_list(HttpServletRequest request, Model model) {
		
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		model.addAttribute("myInfo", obj);
		
		//내가 가지고 있는게임 리스트 가져오기
		String id = obj.getId();
		List<basketVO> list = mpService.zzim_list(id);
		
		for(int i=0; i<list.size(); i++) {
			int gdnum = list.get(i).getGdnum();
			List<String> filepath = gservice.filepath(gdnum);
			String firstfilepath = filepath.get(1);
			model.addAttribute("img", firstfilepath);
		}
		model.addAttribute("zzim", list);
	}
	
		
	//찜목록에 게임 저장
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value="/main/zzim", method = RequestMethod.POST)
	public String zzim_insert(HttpServletRequest request, int gdnum) {
		//세션에 저장된 아이디를 가져오는 코드
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		
		List<basketVO> list = mpService.zzim_list(obj.getId());
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getGdnum() == gdnum) {
				return "failed";
			}
		}
		mpService.zzim_insert(obj.getId(), gdnum);
		
		return "success";
	}
	
	//찜목록에서 게임 제거
	@ResponseBody
	@RequestMapping(value = "/zzimList/delete", method = RequestMethod.POST)
	public void zzimDelete(int gdnum, String id) {
		mpService.zzimDelete(gdnum, id);
	}
	
	//게임 구매
	@ResponseBody
	@RequestMapping(value = "/shopBasket/buyGame", method = RequestMethod.POST)
	public String insertBuyList(int gdnum, String id) {
		//장바구니에서 삭제
		mpService.deleteBasketList(gdnum, id);
		//이미 구매한 상품인지 체크
		List<buyListVO> buylist = mpService.buyList(id);
		for(int i=0; i<buylist.size(); i++) {
			if(buylist.get(i).getGdnum() == gdnum) {
				return "failed";
			}
		}
		//게임 정보 가져오기
		gameVO vo = gservice.read(gdnum);
		//구매 리스트에 추가
		mpService.insertBuyList(gdnum, id, vo.getPrice());
		//찜목록에서 삭제
		List<basketVO> list = mpService.zzim_list(id);
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				int gnum = list.get(i).getGdnum();
				if(gdnum==gnum) {
					mpService.zzimDelete(gdnum, id);
				}
			}
		}
		//캐쉬 차감
		int gamePrice = vo.getPrice();
		memberVO myinfo = mpService.getMemberVO(id);
		int myCash = myinfo.getCash();
		int nowCash = myCash - gamePrice;
		mpService.updateCash(nowCash, id);
		//게임 통계 업데이트
		//구매자 성별
		memberVO userinfo = mpService.getSex(id); //원래는 sex만 받아왔는데 오류나서 memberVO 형태로 받아온 후 sex를 뺴옴
		String sex = userinfo.getSex();
		if(sex.equals("남자")) {
			mpService.mancount(gdnum);
		}else if(sex.equals("여자")){
			mpService.womancount(gdnum);
		}
		//totalage 측정
		//현재 년도
		SimpleDateFormat year = new SimpleDateFormat("yyyy"); //현재 날짜 년도만 출력
		Date time = new Date();
		String nowyear = year.format(time); //현재 년도를 '2019' 이런식으로 출력
		//구매자 나이 불러오기
		memberVO uservo = mpService.getMemberVO(id); //아이디로 유저 정보 불러옴
		String userbirth = uservo.getBirth(); //유저 생일 가져옴
		String agebirthyear = userbirth.substring(0, 4); //유저 생일중 년도만 가져옴 
		int age = Integer.valueOf(nowyear) - Integer.valueOf(agebirthyear) +1; //현재 년도 - 유저 태어난 년도+1 = 나이		
		//유저 나이 totalage에 입력
		mpService.totalAge(age, gdnum);
		//총 수익 더하기
		mpService.profit(gdnum);
		//수수료 구하기
		mpService.sellCharge(gdnum);
		//sellinfo 데이터 추가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("price", vo.getPrice());
		map.put("usersex", sex);
		map.put("userage", age);
		mpService.sellInfo(map);
		
		return "success";
	}
	

	//게임 정보 가져오기 
	@ResponseBody
	@RequestMapping(value = "/shopBasket/gameInfo", method = RequestMethod.GET)
	public gameVO gameInfo(int gdnum) {
		gameVO vo = gservice.read(gdnum);
		
		return vo;
	}
	
	//게임 구매 리스트
	@RequestMapping(value = "/main/buylist", method = RequestMethod.GET)
	public void buyList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");

		String id = obj.getId();
		
		List<buyListVO> list = mpService.buyList(id);
		for(int i=0; i<list.size(); i++) {
			int gdnum = list.get(i).getGdnum();
			List<String> filepath = gservice.filepath(gdnum);
			if(filepath.size() == 0) {
				model.addAttribute("img", "noimage.png");
			} else if(filepath.size() != 0){
				String firstfilepath = filepath.get(0);
				model.addAttribute("img", firstfilepath);
			}
		}
		model.addAttribute("buyList", list);
		model.addAttribute("id", id);
	}
	
	
	//구매 리스트 삭제
	@ResponseBody
	@RequestMapping(value = "/buyList/delete", method = RequestMethod.POST)
	public void buyListdelete(int gdnum, String id) {
		mpService.buyListdelete(gdnum, id);
	}
	
	//환불 신청 조회
	@RequestMapping(value = "buyList/refundList", method = RequestMethod.GET)
	public void refundList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");

		String id = obj.getId();
		
		//환불 기록
		List<refundVO> refundList = mpService.refundList(id);
		model.addAttribute("refund", refundList);
	}
	
	//환불 신청/내역 삭제
	@ResponseBody
	@RequestMapping(value = "/buyList/refundDelete", method = RequestMethod.POST)
	public void refundDelete(int num, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");

		String id = obj.getId();
		mpService.refundDelete(num, id);
	}
	
	
	//환불 신청 UI
	@RequestMapping(value = "/buyList/refundInsert", method = RequestMethod.GET)
	public void refundInsert(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");

		String id = obj.getId();
		List<buyListVO> gamelist = mpService.buyList24(id);
		
		model.addAttribute("gamelist", gamelist);
		model.addAttribute("id", id);
	}
	
	//환불 신청
	@RequestMapping(value = "/buyList/refundInsert", method = RequestMethod.POST)
	public String refundInsert(int buynum, String content, String id) {
		mpService.refundInsert(buynum, content, id);
		return "redirect:/myPage/buyList/refundList";
	}
	
	//배급사 리스트로 이동
	@RequestMapping(value = "/subscribe/subComp", method = RequestMethod.GET)
	public void subComp(String writer, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		
		List<gameVO> comp = mpService.subComp(writer);
		List<favoriteStoreVO> compnum = mpService.favComp(obj.getId(), writer);
		int num = 0;
		if(compnum.size()!=0) {
			num = compnum.get(0).getCompnum();
		}
		String cwriter = comp.get(0).getWriter();
		String filepath = comp.get(0).getFilepath();
		String content = comp.get(0).getContent();

		for(int i=0; i<comp.size(); i++) {
			if(comp.get(i).getCompnum() == num) {
				model.addAttribute("ok", "ok");
			}
		}
		model.addAttribute("comp", comp);
		model.addAttribute("content", content);
		model.addAttribute("writer", cwriter);
		model.addAttribute("filepath", filepath);
	}
	
	//단골 스토어 지정
	@ResponseBody
	@RequestMapping(value = "/subscribe/insert", method=RequestMethod.POST)
	public String subCompInsert(String writer, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		mpService.subCompInsert(writer, obj.getId());
		return "";
	}
	
	//단골 스토어 삭제
	@ResponseBody
	@RequestMapping(value = "/subscribe/delete", method=RequestMethod.POST)
	public String subCompDelete(String writer, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");
		mpService.subCompDelete(writer, obj.getId());
		return "";
	}
	
	//단골스토어 조회
	@RequestMapping(value = "/subscribe/ssubComp", method = RequestMethod.GET)
	public void ssubComp(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		memberVO obj = (memberVO)session.getValue("login");

		String id = obj.getId();
		
		//단골스토어
		List<favoriteStoreVO> favCompList = mpService.favCompList(id);
		
		model.addAttribute("favCompList", favCompList);
	}

}