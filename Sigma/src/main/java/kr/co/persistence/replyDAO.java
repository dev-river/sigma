package kr.co.persistence;

import java.util.List;

import kr.co.domain.replyVO;

public interface replyDAO {
	
	void replyInsert(replyVO vo);

	List<replyVO> replyList(int frnum);

	void replyUpdate(int num);

	void replyDelete(int num);
	

}
