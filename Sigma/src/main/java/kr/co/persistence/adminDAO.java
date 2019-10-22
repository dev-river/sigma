package kr.co.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.adminSetVO;
import kr.co.domain.memberVO;

public interface adminDAO {

	public List<memberVO> adminUserList();

	public List<memberVO> adminSellerList();

	public List<memberVO> adminAdminList();
	
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
}
