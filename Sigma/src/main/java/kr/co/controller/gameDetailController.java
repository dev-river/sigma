package kr.co.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.SPageTO;
import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;
import kr.co.domain.memberVO;
import kr.co.service.gameDetailService;
import kr.co.utils.UploadFileUtils;

@Controller
@RequestMapping("/gameDetail")
public class gameDetailController {
	@Inject
	private gameDetailService gservice;
	
	@Resource(name = "uploadGamePath")
	private String uploadGamePath;
	
	@Resource(name = "GameFile")
	private String gamefile;
	
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
	
	
	
	public Map<String, Object> sessionInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//Session 정보 가져오기
		String id = null;
		String author = null;
		HttpSession session = request.getSession();
		
		if(session.getValue("login") != null) {
			memberVO obj = (memberVO) session.getValue("login");
			if (obj.getId() != null) {
				id = obj.getId();
			}
			if (obj.getAuthor() != null) {
				author = obj.getAuthor();
			}

			map.put("id", id);
			map.put("author", author);
		}else {
			map.put("id", null);
			map.put("author", null);
		}

		return map;
	}
	
	@RequestMapping(value = "/main/maincategory", method = RequestMethod.GET)
    public void gameDetaillist(Model model, String category, HttpServletRequest request, SPageTO to) {
		to = gservice.list(to, category);
		model.addAttribute("vo", to);
		model.addAttribute("category", category);
}
	@RequestMapping(value = "/main/maincategoryread", method = RequestMethod.GET)
	public void gameDetailread(Model model, int num, HttpServletRequest request, gPageTO<reviewVO> pto) {
		String id = null; String author = null;
		Map<String, Object> sessioninfo = sessionInfo(request);
		id = (String) sessioninfo.get("id");
		author = (String) sessioninfo.get("author");
		
		
		//num으로 gameVO 상세정보 부르기 from gameDetail
		gameVO vo = gservice.read(num);
		
		//해당 num에 걸려있는 이미지 파일 가져오기  from gameDetailFile
		List<String> filepath = gservice.filepath(num);
		/*
		 * if(filepath.size() == 0) { filepath.add("noimage.png");
		 * filepath.add("noimage.png"); } if(filepath.size() == 1) {
		 * filepath.add("noimage.png"); }
		 */
		String firstfilepath = filepath.get(0);
		filepath.remove(0);
		
		//장바구니/구매 버튼 판단을 위한 buylist 조회
		if(id != null) {
			int buycheck = gservice.buycheck(id, num);
			model.addAttribute("buycheck", buycheck);
		}
		//할인정보 가져오기
		gameDetailDcVO dcvo = null;
		int dcjoincheck = 0;
		dcvo = gservice.dccheck(num);
		if(dcvo != null) {
			dcvo.setRqstartdate(dcvo.getRqstartdate().substring(0, 10));
			dcvo.setRqenddate(dcvo.getRqenddate().substring(0, 10));
			dcvo.setDcstartdate(dcvo.getDcstartdate().substring(0, 10));
			dcvo.setDcenddate(dcvo.getDcenddate().substring(0, 10));
			model.addAttribute("dcnum", dcvo.getNum());
			
			//할인정보 동참 여부 확인
			dcjoincheck = gservice.dcjoincheck(dcvo.getNum(), id);
			model.addAttribute("dcjoincheck", dcjoincheck);
		}
		
		//최다 리뷰글 가져오기
		reviewVO maxYesReview = gservice.maxYesReview(num);
		reviewVO maxNoReview= gservice.maxNoReview(num);
		
		//전체 리뷰글 가져오기
		pto = gservice.reviewlist(num, pto);
		/* List<reviewVO> reviewlist = gservice.reviewlist(num); */
		
		//구매자 남/녀 성비
		int manratio = gservice.manratio(num);
		int womanratio = gservice.womanratio(num);
		
		//구매자 나이대 비율
		int age1 = gservice.ageratio1(num);
		int age2 = gservice.ageratio2(num);
		int age3 = gservice.ageratio3(num);
		int age4 = gservice.ageratio4(num);
		
		model.addAttribute("vo", vo);
		model.addAttribute("firstfilepath", firstfilepath);
		model.addAttribute("filepath", filepath);
		model.addAttribute("dcvo", dcvo);
		model.addAttribute("maxYesReview", maxYesReview);
		model.addAttribute("maxNoReview", maxNoReview);
		model.addAttribute("reviewlist", pto.getList());
		model.addAttribute("sto", pto);
		model.addAttribute("id", id);
		model.addAttribute("author", author);
		model.addAttribute("manratio", manratio);
		model.addAttribute("womanratio", womanratio);
		model.addAttribute("age1", age1);
		model.addAttribute("age2", age2);
		model.addAttribute("age3", age3);
		model.addAttribute("age4", age4);
	}
	
	@RequestMapping(value = "/inform/DCRqSet", method = RequestMethod.GET)
	public void DCRqSet(int num, String title, Model model) {
		List<gameDetailDcVO> list = gservice.dcrqlist(num);
		gameDetailDcVO lastvo = null; 
		if(lastvo != null){
			lastvo = list.get(list.size()-1);
			lastvo.setRqstartdate(lastvo.getRqstartdate().substring(0,10));
			lastvo.setRqenddate(lastvo.getRqenddate().substring(0,10));
			lastvo.setDcstartdate(lastvo.getDcstartdate().substring(0,10));
			lastvo.setDcenddate(lastvo.getDcenddate().substring(0,10));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("lastvo", lastvo);
		model.addAttribute("title", title);
		model.addAttribute("num", num);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/DCRqSet", method = RequestMethod.POST)
	public void DCRqSet(gameDetailDcVO vo) {
		gservice.DCRqSet(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewinsert", method = RequestMethod.POST)
	public void reviewinsert(int gdnum, String reviewContent, String likeselect, HttpServletRequest request) {
		String id = null;
		Map<String, Object> sessioninfo = sessionInfo(request);
		id = (String) sessioninfo.get("id");
		
		gservice.reviewinsert(gdnum, reviewContent, likeselect, id);
	}
	
	@RequestMapping(value = "/inform/gameStatus")
	public String gameStatus(int num, String status) {
		if(status.equalsIgnoreCase("o")) {
			status = "x";
		}else {
			status = "o";
		}
		gservice.gameStatus(num, status);
		
		return "redirect:/gameDetail/main/maincategoryread?num=" + num;
	}
	
	@RequestMapping(value = "/main/maincategoryreviewupdate", method = RequestMethod.GET)
	public void reviewupdate(int num, Model model) {
		reviewVO vo = gservice.reviewselect(num);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/main/maincategoryreviewupdate", method = RequestMethod.POST)
	public void reviewupdate(reviewVO vo) {
		gservice.reviewupdate(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/inform/reviewdelete", method = RequestMethod.GET)
	public void reviewdelete(int num) {
		gservice.reviewdelete(num);
	}
	
	@RequestMapping(value = "/inform/dcCountAdd", method = RequestMethod.GET)
	public String gameDetailDCcountAdd(Model model, int num, int gdnum, HttpServletRequest request) {
		String id = null; String author = null;
		Map<String, Object> sessioninfo = sessionInfo(request);
		id = (String) sessioninfo.get("id");
		author = (String) sessioninfo.get("author");
		
		gservice.dcadd(num);
		gservice.dcjoininsert(num, id);
		return "redirect:/gameDetail/main/maincategoryread?num="+gdnum;
	}
	
	@RequestMapping(value = "/main/maincategoryupdate", method = RequestMethod.GET)
	public void update(Model model, int num) {
		gameVO vo = gservice.read(num);
		List<gameDetailFileVO> filevo = gservice.filename(num);
		String str1 = filevo.get(0).getFilename();
		String str2 = filevo.get(1).getFilename();
		String str3 = filevo.get(2).getFilename();
		String str4 = filevo.get(3).getFilename();
		System.out.println(str1+" : "+str2+" : "+str3+" : "+str4);
		model.addAttribute("vo", vo);
		model.addAttribute("str1", str1);
		model.addAttribute("str2", str2);
		model.addAttribute("str3", str3);
		model.addAttribute("str4", str4);
	}
	
	@RequestMapping(value = "/main/maincategoryupdate", method = RequestMethod.POST)
	public String update(gameVO vo, String filename1, String filename2, String filename3, String filename4) {
		System.out.println("start "+vo);
		gameVO gvo = gservice.read(vo.getNum());
		if(vo.getGamefilepath()==null) {
			vo.setGamefilepath(gvo.getGamefilepath());
		}
		
		if(vo.getFilepath()==null) {
			vo.setFilepath(gvo.getFilepath());
			System.out.println("0 : "+vo);
		}else {
			if(vo.getFilepath().equals(gvo.getFilepath())) {
				System.out.println("1 : " +vo);
			}else {
				vo.setFilepath(vo.getFilepath().substring(3));
				System.out.println("2 : "+vo);
				gservice.update(vo);
			}
		}
		gservice.update(vo);
		
		List<gameDetailFileVO> filevo = gservice.filename(vo.getNum());
		int num1 = filevo.get(0).getNum();
		int num2 = filevo.get(1).getNum();
		int num3 = filevo.get(2).getNum();
		int num4 = filevo.get(3).getNum();
		if(filename1 == null) {
			filename1 = filevo.get(0).getFilename();
		}else {
			filename1 = filename1;
		}
		if(filename2 == null) {
			filename2 = filevo.get(1).getFilename();
		}else {
			filename2 = filename2;
		}
		if(filename3 == null) {
			filename3 = filevo.get(2).getFilename();
		}else {
			filename3 = filename3;
		}
		if(filename4 == null) {
			filename4 = filevo.get(3).getFilename();
		}else {
			filename4 = filename4;
		}
		if(filename1.equals(filevo.get(0).toString())) {
		}else {
			gservice.imgupdate1(filename1,num1);
		}
		if(filename2.equals(filevo.get(1).toString())) {
		}else {
			gservice.imgupdate2(filename2,num2);
		}
		if(filename3.equals(filevo.get(2).toString())) {
		}else {
			gservice.imgupdate3(filename3,num3);
		}
		if(filename4.equals(filevo.get(3).toString())) {
		}else {
			gservice.imgupdate4(filename4,num4);
		}
		
		return "redirect:/gameDetail/main/maincategoryread?num="+vo.getNum();
	}
	
	@RequestMapping(value = "/inform/reviewadd")
	@ResponseBody
	public String reviewadd(int num, String assist) {
		gservice.reviewadd(num, assist);
		return "success";
	}
}