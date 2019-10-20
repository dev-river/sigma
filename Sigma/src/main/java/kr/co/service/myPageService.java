package kr.co.service;

import java.util.List;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.memberVO;

public interface myPageService {

	memberVO getMemberVO(String userId);

	memberVO updateUI(String id);

	void update(memberVO vo);

	void delete(String id, String pw);

	void updateCash(int cash, String id);

	void regiBasket(String obj, int gdnum);

	List<basketVO> getBasket(String id);

	void deleteBasketList(int gdnum, String id);

	void zzim_insert(String id, int gdnum);

	List<basketVO> zzim_list(String id);

	void zzimDelete(int gdnum, String id);

	void insertBuyList(int gdnum, String id, int price);

	List<buyListVO> buyList(String id);


}
