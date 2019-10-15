package kr.co.service;

import java.util.List;

import kr.co.domain.replyVO;

public interface replyService {

	void replyInsert(replyVO vo);

	List<replyVO> replyList(int frnum);

	void replyUpdate(int num);

	void delete(int num);


	
	

}
