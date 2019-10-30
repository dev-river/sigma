package kr.co.service;

import java.util.List;

import kr.co.domain.replyOVO;

public interface replyOService {

	void replyOInsert(replyOVO vo);

	List<replyOVO> replyOList(int frnum);
	
	void Odelete(int num);

	void replyOUpdate(replyOVO vo);

	void deleteAll(int num);

	
}
