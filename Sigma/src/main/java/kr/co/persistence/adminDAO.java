package kr.co.persistence;

import java.util.List;

import kr.co.domain.memberVO;

public interface adminDAO {

	public List<memberVO> adminUserList();

	public List<memberVO> adminSellerList();

	public List<memberVO> adminAdminList();
	
	public memberVO adminUserRead(memberVO vo);

}
