package kr.co.persistence;

import java.util.List;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;

public interface compDAO {

	memberVO read(String id);

	void update(memberVO vo);

	void delete(String id);

	List<gameVO> gamelist(String writer);

	void gameinsert(gameVO vo);

	int count(String id);

	List<refundVO> refundList(String id);

}
