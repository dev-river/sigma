package kr.co.persistence;

import java.util.List;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.boardVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;

public interface adminDAO {

	public int getUserAmount(SPageTO to);
	
	public List<memberVO> userList(SPageTO to);

	public int getSellerAmount(SPageTO to);

	public List<memberVO> sellerList(SPageTO to);
	
	public int getAdminAmount(SPageTO to);
	
	public List<memberVO> adminList(SPageTO to);
	
	public memberVO adminUserRead(memberVO vo);

	public memberVO userAuthorUI(String id);

	public void userAuthor(memberVO vo);

	public void userDelete(String id);

	public adminSetVO changeChargeUI();

	public void changeCharge(adminSetVO vo);

	public void logoupdate(String logofilepath, adminSetVO vo);

	public void bgupdate(String bgfilepath, adminSetVO vo);

	public adminSetVO getBGimg();

	public adminSetVO getLogoimg();

	public List<adminSlideVO> slideList();

	public void slideDelete(int num);

	public void slideInsert(String bnfilepath, adminSlideVO vo);

	public adminSlideVO getSlide(int num);

	public void slideUpdate(String bnfilepath, adminSlideVO vo);

	public List<boardVO> boardAllList(SPageTO to);

	public int getAmount(SPageTO to);

	public int getReviewAmount(SPageTO to);

	public List<reviewVO> reviewAllList(SPageTO to);

	public reviewVO reviewRead(int num);

	public List<adminSetVO> setList();



}
