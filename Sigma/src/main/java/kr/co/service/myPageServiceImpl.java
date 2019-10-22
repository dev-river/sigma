package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
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

	@Override
	public void insertBuyList(int gdnum, String id, int price) {
		mpdao.insertBuyList(gdnum, id, price);
	}

	@Override
	public List<buyListVO> buyList(String id) {
		// TODO Auto-generated method stub
		return mpdao.buyList(id);
	}

	@Override
	public void buyListdelete(int gdnum, String id) {
		mpdao.buyListdelete(gdnum, id);
		
	}

	@Override
	public List<refundVO> refundList(String id) {
		// TODO Auto-generated method stub
		return mpdao.refundList(id);
	}

	@Override
	public int getrefundgdnum(int buynum, String id) {
		
		return mpdao.getrefundgdnum(buynum,id);
	}

	@Override
	public List<buyListVO> buyList24(String id) {
		// TODO Auto-generated method stub
		return mpdao.buyList24(id);
	}

	@Override
	public void refundInsert(int buynum, String content, String id) {
		mpdao.refundInsert(buynum, content,id);
		
	}

	@Override
	public memberVO getSex(String id) {
		
		return mpdao.getSex(id);
		
	}

	@Override
	public void mancount(int gdnum) {
		mpdao.mancount(gdnum);
	}

	@Override
	public void womancount(int gdnum) {
		mpdao.womancount(gdnum);
	}

	@Override
	public void totalAge(int age, int gdnum) {
		mpdao.totalAge(age, gdnum);
		
	}

	@Override
	public void profit(int gdnum) {
		mpdao.profit(gdnum);
		
	}

	@Override
	public void sellCharge(int gdnum) {
		mpdao.sellCharge(gdnum);
		
	}

}