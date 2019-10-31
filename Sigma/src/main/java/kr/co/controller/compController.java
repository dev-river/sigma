package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
import kr.co.domain.sellinfoVO;
import kr.co.service.compService;
import kr.co.utils.UploadFileUtils;

@Controller
@RequestMapping(value = "/compManage")
public class compController {
	
	@Inject
	private compService compservice;
	
	@Resource(name = "uploadGamePath")
	private String uploadGamePath;
	
	@Resource(name = "GameFile")
	private String gamefile;
	
	@ResponseBody
	@RequestMapping(value = "/titlecheck", method = RequestMethod.POST)
	public String titlecheck(String title) {
		gameVO titlecheck = compservice.titlecheck(title);
		if(titlecheck!=null) {
			return "ok";
		}else {
			return "no";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/gamefile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> gamedisplay(String filename){
		String uploadPath = gamefile;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	@ResponseBody
	@RequestMapping(value = "/imgfile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgdisplay(String filename){
		String uploadPath = uploadGamePath;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	@ResponseBody
	@RequestMapping(value = "/imgsrcfile1", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgsrcdisplay1(String filename){
		String uploadPath = uploadGamePath;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	@ResponseBody
	@RequestMapping(value = "/imgsrcfile2", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgsrcdisplay2(String filename){
		String uploadPath = uploadGamePath;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	@ResponseBody
	@RequestMapping(value = "/imgsrcfile3", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgsrcdisplay3(String filename){
		String uploadPath = uploadGamePath;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	@ResponseBody
	@RequestMapping(value = "/imgsrcfile4", method = RequestMethod.GET)
	public ResponseEntity<byte[]> imgsrcdisplay4(String filename){
		String uploadPath = uploadGamePath;
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	@ResponseBody
	@RequestMapping(value = "/gameajax", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> GameAjax(MultipartHttpServletRequest request) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedName = UploadFileUtils.uploadFile(gamefile, file);
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/gameajax", method = RequestMethod.GET)
	public void GameAjax() {}
	
	@ResponseBody
	@RequestMapping(value = "/imgajax", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> ImgAjax(MultipartHttpServletRequest request) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedName = UploadFileUtils.uploadFile(uploadGamePath, file);
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/imgajax", method = RequestMethod.GET)
	public void ImgAjax() {}
	
	@ResponseBody
	@RequestMapping(value = "/imgsrcajax", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> ImgsrcAjax(MultipartHttpServletRequest request) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedName = UploadFileUtils.uploadFile(uploadGamePath, file);
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/imgsrcajax", method = RequestMethod.GET)
	public void ImgsrcAjax() {}

	//판매자 페이지
	@RequestMapping(value = "/main/manageread")
	public void read(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
		int count = compservice.count(id);
		model.addAttribute("vo", vo);
		model.addAttribute("count", count);
	}
	
	//판매자 정보 수정 UI
	@RequestMapping(value = "/main/manageupdate")
	public void updateUI(@RequestParam String id, Model model) {
		memberVO vo = compservice.read(id);
		
		model.addAttribute("vo", vo);
	}
	//판매자 정보 수정	
	@RequestMapping(value = "/main/manageupdate", method = RequestMethod.POST)
	public String update(memberVO vo) {
		compservice.update(vo);
		return "redirect:/compManage/main/manageread?id="+vo.getId();
	}
	
	//판매자가 등록한 게임 리스트
	@RequestMapping(value = "/main/gamelist")
	public void gamelist(String writer, Model model) {
		List<gameVO> gamelist = compservice.gamelist(writer);
		List<gameDetailDcVO> gameDetailDC =  compservice.gameDetailDC(writer);
		int man = compservice.mancount(writer);
		int woman = compservice.womancount(writer);
		int s10 = compservice.age10();
		int s20 = compservice.age20();
		int s30 = compservice.age30();
		int s40 = compservice.age40();
		model.addAttribute("gamelist", gamelist);
		model.addAttribute("gameDetailDC", gameDetailDC);
		model.addAttribute("man", man);
		model.addAttribute("woman", woman);
		model.addAttribute("s10", s10);
		model.addAttribute("s20", s20);
		model.addAttribute("s30", s30);
		model.addAttribute("s40", s40);
	}
	
	//게임 등록 UI
	@RequestMapping(value = "/main/gameinsert")
	public void gameinsertUI(@RequestParam String writer, Model model) {
		int cash = compservice.seachcash(writer);
		model.addAttribute("cash", cash);
	}
	
	//게임 등록
	@RequestMapping(value = "/main/gameinsert", method = RequestMethod.POST)
	public String gameinsert(gameVO vo, String filename1, String filename2, String filename3, String filename4) {
		//판매자의 캐시 1000원을 관리자에게 준다
		compservice.sellermoney(vo);
		compservice.givemoney();
		//게임 등록
		compservice.gameinsert(vo);
		
		int gdnum = compservice.checknum(vo);
		if(filename1 == null) {
			filename1 = "noimage.png";
		}
		if(filename2 == null) {
			filename2 = "noimage.png";
		}
		if(filename3 == null) {
			filename3 = "noimage.png";
		}
		if(filename4 == null) {
			filename4 = "noimage.png";
		}
		//gamedetailfile에 그림 이미지 4개 등록
		List list = new ArrayList();
		list.add(0, filename1);
		list.add(1, filename2);
		list.add(2, filename3);
		list.add(3, filename4);
		compservice.gameimg(list, gdnum);
		
		return "redirect:/compManage/main/gamelist?writer="+vo.getWriter();
	}
	
	//환불 리스트
	@RequestMapping(value = "/main/refundlist")
	public void refundList(@RequestParam String id, Model model) {
		List<refundVO> list = compservice.refundList(id);
		model.addAttribute("list", list);
	}
	
	//환불 상세보기
	@RequestMapping(value = "/main/refundread")
	public void refundRead(@RequestParam String id, @RequestParam int num, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("num", num);
		refundVO rvo = compservice.refundRead(map);
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

