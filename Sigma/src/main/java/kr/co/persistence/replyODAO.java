package kr.co.persistence;

import java.util.List;

import kr.co.domain.replyOVO;

public interface replyODAO {
	
	void replyOInsert(replyOVO vo);

	List<replyOVO> replyOList(int frnum);

	void replyODelete(int num);

	void replyOUpdate(replyOVO vo);

	void deleteAll(int num);

}
