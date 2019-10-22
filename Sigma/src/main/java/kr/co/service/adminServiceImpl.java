package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.adminSetVO;
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

	@Override
	public memberVO userAuthorUI(String id) {

		return addao.userAuthorUI(id);
	}

	@Override
	public void userAuthor(memberVO vo) {

		addao.userAuthor(vo);
	}

	@Override
	public void userDelete(String id) {

		addao.userDelete(id);
	}

	@Override
	public adminSetVO changeChargeUI() {
		return addao.changeChargeUI();
	}

	@Override
	public void changeCharge(adminSetVO vo) {

		addao.changeCharge(vo);
	}

	@Override
	public void LogoUpdate(adminSetVO vo, String savedName) {

		String logofilepath = savedName.substring(3);
		
		addao.logoupdate(logofilepath, vo);
		
	}

	@Override
	public void BGUpdate(adminSetVO vo, String savedName) {
		
		String bgfilepath = savedName.substring(3);
		
		addao.bgupdate(bgfilepath, vo);
		
	}

	@Override
	public adminSetVO getBGimg() {

		return addao.getBGimg();
	}

	@Override
	public adminSetVO getLogoimg() {
		
		return addao.getLogoimg();
	}


}
