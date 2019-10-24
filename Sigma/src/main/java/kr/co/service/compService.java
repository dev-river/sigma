package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;

public interface compService {

	memberVO read(String id);

	void update(memberVO vo);

	void delete(String id);

	List<gameVO> gamelist(String writer);

	void gameinsert(gameVO vo);

	int count(String id);

	List<refundVO> refundList(String id);

	List<gameDetailDcVO> gameDetailDC(String writer);

	refundVO refundRead(Map<String, Object> map);

	void refundReject(Map<String, Object> map);

	void refundOK(int num);

	void returncash(Map<String, Object> map2);

	void giveback1(Map<String, Object> map1);

	void givemoney();

	void sellermoney(gameVO vo);

	void giveback2(int buynum);

	int seachcash(String writer);
}