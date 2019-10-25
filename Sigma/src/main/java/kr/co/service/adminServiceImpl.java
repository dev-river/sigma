package kr.co.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.boardVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;
import kr.co.persistence.adminDAO;
import kr.co.persistence.boardDAO;
import kr.co.persistence.boardEVDAO;

@Service
@Transactional
public class adminServiceImpl implements adminService{
	@Inject
	private adminDAO addao;
	
	@Inject
	private boardDAO bdao;
	
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

	@Override
	public List<adminSlideVO> slideList() {

		return addao.slideList();
	}

	@Override
	public void slideDelete(int num) {

		addao.slideDelete(num);
	}

	@Override
	public void slideInsert(adminSlideVO vo, String savedName) {

		String bnfilepath = savedName.substring(3);
		
		addao.slideInsert(bnfilepath, vo);
	}

	@Override
	public adminSlideVO getSlide(int num) {

		return addao.getSlide(num);
	}

	@Override
	public void slideUpdate(adminSlideVO vo, String savedName) {
		String bnfilepath = savedName.substring(3);
		System.out.println(bnfilepath);
		
		addao.slideUpdate(bnfilepath, vo);
	}

	@Override
	public SPageTO boardAllList(SPageTO to) {
		int amount = addao.getAmount(to);
		to.setAmount(amount);
		
		List<boardVO> finalList = addao.boardAllList(to);
		to.setList(finalList);
		
		return to;
	}
	
	public void setListBoard(List<boardVO> list, String board, List<boardVO> finalList){
		for(boardVO vo : list) {
			vo.setBoard(board);
			finalList.add(vo);
		}
	}

	@Override
	public SPageTO reviewAllList(SPageTO to) {
		int amount = addao.getReviewAmount(to);
		to.setAmount(amount);
		
		List<reviewVO> finalList = addao.reviewAllList(to);
		to.setList(finalList);
		return to;
	}
}
