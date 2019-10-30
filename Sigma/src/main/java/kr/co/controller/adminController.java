package kr.co.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.boardVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;
import kr.co.service.adminService;
import kr.co.utils.UploadFileUtils;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Inject
	private adminService adservice;
	
	// ---회원관리 -- //
	//로고, 배경이미지 패스
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//배너 패스
	@Resource(name="uploadBNPath")
	private String uploadBNPath;

	//회원 리스트 ,(분석으로 변경해야하는데 아직 미완성)
	@RequestMapping(value = "/main/user/adminlist", method = RequestMethod.GET)
	public void adminUserList(Model model) {
		List<memberVO> vo = adservice.adminUserList();
		model.addAttribute("vo", vo);
	}
	
	//판매회원 리스트
	@RequestMapping(value = "/main/user/adminsellerlist", method = RequestMethod.GET)
	public void adminSellerList(Model model) {
		List<memberVO> vo = adservice.adminSellerList();
		model.addAttribute("vo", vo);
	}

	//관리회원 리스트
	@RequestMapping(value = "/main/user/adminadminlist", method = RequestMethod.GET)
	public void adminAdminList(Model model) {
		List<memberVO> vo = adservice.adminAdminList();
		model.addAttribute("vo", vo);
	}
	
	//회원정보 상세보기
	@RequestMapping(value = "/userManage/read")
	public void adminUserRead(memberVO vo, Model model) {
		memberVO readvo = adservice.adminUserRead(vo);
		model.addAttribute("readvo", readvo); 
	}
	
	//회원정보 수정UI
	@RequestMapping(value = "/userManage/update")
	public void userAuthorUI(String id, Model model) {
		memberVO updatevo = adservice.userAuthorUI(id);
		model.addAttribute("updatevo", updatevo);
	}

	//회원정보 수정
	@RequestMapping(value = "/userManage/update", method = RequestMethod.POST)
	public String userAuthor(memberVO vo) {
		adservice.userAuthor(vo);
		return "redirect:/admin/userManage/read?id=" + vo.getId();
	}

	//회원 삭제
	@RequestMapping(value = "/userManage/delete", method = RequestMethod.GET)
	public String userDelete(String id) {
		adservice.userDelete(id);
		return "redirect:/admin/userManage/userlist";
	}
	
	// --회원관리 끝-- //
	// --로고, 배경 이미지 관리--//
	// 현재 이미지 불러오기
	@RequestMapping(value = "/main/setting/imgmanage")
	public void imgManage(Model model) {
		adminSetVO LogoVo = adservice.getLogoimg();
		adminSetVO BgVo = adservice.getBGimg();
		model.addAttribute("LogoVo", LogoVo);
		model.addAttribute("BgVo", BgVo);
	}

	// 로고, 배경 이미지 출력
	@ResponseBody
	@RequestMapping(value = "/main/setting/imgmanage/displayfile")
	public ResponseEntity<byte[]> displayfile(String filename){
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	//로고 Ajax
	@RequestMapping(value="/adminSetting/imgManage/uploadLogoAjax", method = RequestMethod.GET)
	public void uploadLogoAjax() {
		
	}


	//로고 Ajax
	@ResponseBody
	@RequestMapping(value="/adminSetting/imgManage/uploadLogoAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> uploadLogoAjax(MultipartHttpServletRequest request, adminSetVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedLogoName = UploadFileUtils.uploadFile(uploadPath, file);
		
		adservice.LogoUpdate(vo, savedLogoName);
		
		return new ResponseEntity<String>(savedLogoName, HttpStatus.OK);
	}
	
	//배경 Ajax
	@RequestMapping(value="/adminSetting/imgManage/uploadBGAjax", method = RequestMethod.GET)
	public void uploadBGAjax() {
		
	}
	
	//배경 Ajax
	@ResponseBody
	@RequestMapping(value="/adminSetting/imgManage/uploadBGAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> uploadBGAjax(MultipartHttpServletRequest request, adminSetVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedBGName = UploadFileUtils.uploadFile(uploadPath, file);
		
		adservice.BGUpdate(vo, savedBGName);
		
		return new ResponseEntity<String>(savedBGName, HttpStatus.OK);
	}
	
	//-- 로고, 배경 끝--//
	
	//-- 관리자 비용관리 --//
	//수수료 관리UI
	@RequestMapping(value = "/main/setting/chargelist")
	public void changeChargeUI(Model model) {
		adminSetVO updatevo = adservice.changeChargeUI();
		model.addAttribute("updatevo", updatevo);
	}
	
	//수수료 관리
	@RequestMapping(value = "/main/setting/chargelist", method = RequestMethod.POST)
	public String changeCharge(adminSetVO vo) {
		adservice.changeCharge(vo);
		return "redirect:/admin/main/setting/chargelist";
	}
	
	//-- 관리자 비용관리 끝--//
	
	//-- 메인 슬라이드 이미지(배너) 관리 -- //
	//배너 이미지 출력
	@ResponseBody
	@RequestMapping(value = "/adminSetting/slideManage/displayfile")
	public ResponseEntity<byte[]> displayBNfile(String filename){
		String uploadPath = uploadBNPath;
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	//배너 이미지 관리
	@RequestMapping(value = "/main/setting/slidemanage", method = RequestMethod.GET)
	public void slideManage(Model model) {

		List<adminSlideVO> vo = adservice.slideList();
		model.addAttribute("vo", vo);
	}
	
	//배너 이미지 삭제
	@RequestMapping(value = "/adminSetting/slideDelete", method = RequestMethod.GET)
	public String slideDelete(int num) {
		adservice.slideDelete(num);
		return "redirect:/admin/main/setting/slidemanage";
	}
	
	//배너 이미지 생성 UI
	@RequestMapping(value = "/main/setting/slidemanageinsert", method = RequestMethod.GET)
	public void slideInsertUI(Model model) {
		
	}
	
	//배너 이미지 생성
	@RequestMapping(value = "/main/setting/slidemanageinsert", method = RequestMethod.POST)
	public String slideInsert(adminSlideVO vo) {
		String savedname = vo.getFilepath();
		adservice.slideInsert(vo, savedname);
		return "redirect:/admin/main/setting/slidemanage";
	}
	
	//배너 이미지등록 Ajax
	@RequestMapping(value="/adminSetting/slideInsert/uploadBNAjax", method = RequestMethod.GET)
	public void uploadBNAjax() {
		
	}

	//배너 이미지등록 Ajax
	@ResponseBody
	@RequestMapping(value="/adminSetting/slideInsert/uploadBNAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> uploadBNAjax(MultipartHttpServletRequest request, adminSlideVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedName = UploadFileUtils.uploadFile(uploadBNPath, file);
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	// 배너 수정 UI
	@RequestMapping(value = "/main/setting/slidemanageupdate", method = RequestMethod.GET)
	public void slideUpdateUI(int num, Model model) {
		adminSlideVO vo = adservice.getSlide(num);
		model.addAttribute("vo", vo);
	}

	// 배너 수정
	@RequestMapping(value = "/main/setting/slidemanageupdate", method = RequestMethod.POST)
	public String slideUpdate(adminSlideVO vo) {
		String savedName = vo.getFilepath();
		adservice.slideUpdate(vo, savedName);
		return "redirect:/admin/main/setting/slidemanage";
	}
	
		
	// 배너 수정 Ajax
	@RequestMapping(value="/main/setting/slidemanageupdate/updateBNAjax", method = RequestMethod.GET)
	public void updateBNAjax() {
			
	}

	// 배너 수정 Ajax
	@ResponseBody
	@RequestMapping(value="/main/setting/slidemanageupdate/updateBNAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> updateBNAjax(MultipartHttpServletRequest request, adminSlideVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedName = UploadFileUtils.uploadFile(uploadBNPath, file);
		
		return new ResponseEntity<String>(savedName, HttpStatus.OK);
	}
	
	// 관리자 에러
	@RequestMapping(value="/adminSetting/adminError", method=RequestMethod.GET)
	public void adminError() {
		
	}
		
  // -- 게시판 관리 -- //
  //전체게시물 보기
	@RequestMapping(value = "/boardManage/boardAllList")
	public void boardAllList(Model model, SPageTO to) {
		to = adservice.boardAllList(to);
		model.addAttribute("to", to);
	}
	
  //전체리뷰 보기
	@RequestMapping(value = "/boardManage/reviewAllList")
	public void reviewAllList(Model model, SPageTO to) {
		to = adservice.reviewAllList(to);
		model.addAttribute("to", to);
	}
	
  //리뷰
	@RequestMapping(value = "/boardManage/reviewRead", method = RequestMethod.GET)
	public void reviewRead(Model model, int num) {
		reviewVO vo = adservice.reviewRead(num);
		model.addAttribute("vo", vo);
	}
}