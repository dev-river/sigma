package kr.co.controller;

import java.util.ArrayList;
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

import kr.co.domain.PageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.memberVO;
import kr.co.service.adminService;
import kr.co.utils.UploadFileUtils;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Inject
	private adminService adservice;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/userManage/userlist", method = RequestMethod.GET)
	public void adminUserList(Model model) {
		List<memberVO> vo = adservice.adminUserList();
		model.addAttribute("vo", vo);
	}
	
	/*
	 @RequestMapping(value = "/sUserManage/userlist", method = RequestMethod.GET)
	 public void adminSUserList(Model model) { 
	 List<memberVO> vo = adservice.adminSUserList(); 
	 model.addAttribute("vo", vo); }
	 */
	
	
	@RequestMapping(value = "/userManage/sellerlist", method = RequestMethod.GET)
	public void adminSellerList(Model model) {
		List<memberVO> vo = adservice.adminSellerList();
		model.addAttribute("vo", vo);
	}

	@RequestMapping(value = "/userManage/adminlist", method = RequestMethod.GET)
	public void adminAdminList(Model model) {
		List<memberVO> vo = adservice.adminAdminList();
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping(value = "/userManage/read")
	public void adminUserRead(memberVO vo, Model model) {
		memberVO readvo = adservice.adminUserRead(vo);
		model.addAttribute("readvo", readvo); 
	}
	
	@RequestMapping(value = "/userManage/update")
	public void userAuthorUI(String id, Model model) {
		memberVO updatevo = adservice.userAuthorUI(id);
		model.addAttribute("updatevo", updatevo);
	}

	@RequestMapping(value = "/userManage/update", method = RequestMethod.POST)
	public String userAuthor(memberVO vo) {
		adservice.userAuthor(vo);
		return "redirect:/admin/userManage/read?id=" + vo.getId();
	}

	@RequestMapping(value = "/userManage/delete", method = RequestMethod.GET)
	public String userDelete(String id) {
		adservice.userDelete(id);
		return "redirect:/admin/userManage/userlist";
	}
	
/*	@RequestMapping(value = "/boardManage/boardFRlist")
	public void boardManageFRlist(PageTO to, Model model) {
		
		PageTO dbTO = adservice.pageList(to);
		model.addAttribute("dbTO", dbTO);
	} */

	@RequestMapping(value = "/adminSetting/imgManage")
	public void imgManage(Model model) {
		adminSetVO LogoVo = adservice.getLogoimg();
		adminSetVO BgVo = adservice.getBGimg();
		model.addAttribute("LogoVo", LogoVo);
		model.addAttribute("BgVo", BgVo);
	}

//	@RequestMapping(value = "/adminSetting/imgManage", method = RequestMethod.POST)
//	public String imgManage(MultipartHttpServletRequest request, Model model) throws Exception {
//		
//		List<MultipartFile> list = request.getFiles("file");
//		List<String> savedNameList = new ArrayList<String>();
//		
//		for(MultipartFile x : list) {
//			String savedName = UploadFileUtils.uploadFile(uploadPath, x);
//			savedNameList.add(savedName);
//		}
//		model.addAttribute("savedNameList", savedNameList);
//		
//		return "redirect:/admin/adminSetting/imgManage/";
//		
//	}
	
	@ResponseBody
	@RequestMapping(value = "/adminSetting/imgManage/displayfile")
	public ResponseEntity<byte[]> displayfile(String filename){
		
		return UploadFileUtils.displayfile(uploadPath, filename);
	}
	
	@RequestMapping(value="/adminSetting/imgManage/uploadLogoAjax", method = RequestMethod.GET)
	public void uploadLogoAjax() {
		
	}

	@RequestMapping(value="/adminSetting/imgManage/uploadBGAjax", method = RequestMethod.GET)
	public void uploadBGAjax() {
		
	}

	@ResponseBody
	@RequestMapping(value="/adminSetting/imgManage/uploadLogoAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> uploadALogojax(MultipartHttpServletRequest request, adminSetVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedLogoName = UploadFileUtils.uploadFile(uploadPath, file);
		
		adservice.LogoUpdate(vo, savedLogoName);
		
		return new ResponseEntity<String>(savedLogoName, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/adminSetting/imgManage/uploadBGAjax", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public ResponseEntity<String> uploadBGAjax(MultipartHttpServletRequest request, adminSetVO vo) throws Exception{
		
		MultipartFile file = request.getFile("file");
		String savedBGName = UploadFileUtils.uploadFile(uploadPath, file);
		
		adservice.BGUpdate(vo, savedBGName);
		
		return new ResponseEntity<String>(savedBGName, HttpStatus.OK);
	}
	
//	@ResponseBody
//	@RequestMapping(value="/adminSetting/imgManage/getBGimg")
//	public String getBGimg(String bgfilepath){
//		
//		return adservice.getBGimg();
//	}
	
	
	@RequestMapping(value = "/adminSetting/chargeManage")
	public void changeChargeUI(Model model) {
		adminSetVO updatevo = adservice.changeChargeUI();
		model.addAttribute("updatevo", updatevo);
	}
	
	@RequestMapping(value = "/adminSetting/chargeManage", method = RequestMethod.POST)
	public String changeCharge(adminSetVO vo) {
		adservice.changeCharge(vo);
		return "redirect:/admin/adminSetting/chargeManage/";
	}
}