package kr.co.service;

import java.util.List;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;

public interface adminService {

	SPageTO userList(SPageTO to);
	
	SPageTO sellerList(SPageTO to);

	SPageTO adminList(SPageTO to);
	
	memberVO adminUserRead(memberVO vo);

	memberVO userAuthorUI(String id);

	void userAuthor(memberVO vo);

	void userDelete(String id);

	adminSetVO changeChargeUI();

	void changeCharge(adminSetVO vo);

	void LogoUpdate(adminSetVO vo, String savedName);

	void BGUpdate(adminSetVO vo, String savedName);

	adminSetVO getBGimg();

	adminSetVO getLogoimg();

	List<adminSlideVO> slideList();

	void slideDelete(int num);

	void slideInsert(adminSlideVO vo, String savedName);

	adminSlideVO getSlide(int num);

	void slideUpdate(adminSlideVO vo, String savedName);

	SPageTO boardAllList(SPageTO to);

	SPageTO reviewAllList(SPageTO to);

	reviewVO reviewRead(int num);

	List<adminSetVO> setList();

}
