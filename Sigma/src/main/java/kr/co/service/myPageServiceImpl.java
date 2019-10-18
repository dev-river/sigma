package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.basketVO;
import kr.co.domain.memberVO;
import kr.co.persistence.myPageDAO;

@Service
@Transactional
public class myPageServiceImpl implements myPageService{
	@Inject
	private myPageDAO mpdao;

	@Override
	public memberVO getMemberVO(String userId) {
		
		return mpdao.getMemberVO(userId);
		
	}

	@Override
	public memberVO updateUI(String id) {
		// TODO Auto-generated method stub
		return mpdao.updateUI(id);
	}

	@Override
	public void update(memberVO vo) {
		mpdao.update(vo);
		
	}

	@Override
	public void delete(String id, String pw) {
		mpdao.delete(id, pw);
		
	}

	@Override
	public void updateCash(int cash, String id) {
		mpdao.updateCash(cash, id);
		
	}

	@Override
	public void regiBasket(String obj, int gdnum) {
		mpdao.regiBasket(obj, gdnum);
		
	}

	@Override
	public List<basketVO> getBasket(String id) {
		// TODO Auto-generated method stub
		return mpdao.getBasket(id);
	}

	@Override
	public void deleteBasketList(int gdnum, String id) {
		mpdao.deleteBasketList(gdnum, id);
		
	}

	@Override
	public void zzim_insert(String id, int gdnum) {
		mpdao.zzim_insert(id,gdnum);
		
	}

	@Override
	public List<basketVO> zzim_list(String id) {
		// TODO Auto-generated method stub
		return mpdao.zzim_list(id);
	}

	@Override
	public void zzimDelete(int gdnum, String id) {
		mpdao.zzimDelete(gdnum,id);
		
	}

}