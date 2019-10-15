package kr.co.persistence;

import java.util.List;

import kr.co.domain.replyVO;

public interface replyDAO {
	
	void replyInsert(replyVO vo);

	List<replyVO> replyList(int frnum);

	

	void replyDelete(int num);

	void replyUpdate(replyVO vo);

}
