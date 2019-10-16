package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.boardVO;
import kr.co.domain.memberVO;
import kr.co.persistence.adminDAO;
import kr.co.persistence.boardDAO;

@Service
@Transactional
public class adminServiceImpl implements adminService{
	@Inject
	private adminDAO addao;

	@Override
	public List<memberVO> adminUserList() {

		return addao.adminUserList();
	}

	@Override
	public List<memberVO> adminSellerList() {
		// TODO Auto-generated method stub
		return addao.adminSellerList();
	}

	@Override
	public List<memberVO> adminAdminList() {
		// TODO Auto-generated method stub
		return addao.adminAdminList();
	}
	
	@Override
	public memberVO adminUserRead(memberVO vo) {
		
		return addao.adminUserRead(vo);
	}

}
