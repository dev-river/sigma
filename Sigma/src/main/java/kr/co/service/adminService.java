package kr.co.service;

import java.util.List;

import kr.co.domain.memberVO;

public interface adminService {

	List<memberVO> adminUserList();

	List<memberVO> adminSellerList();

	List<memberVO> adminAdminList();
	
	memberVO adminUserRead(memberVO vo);

}
