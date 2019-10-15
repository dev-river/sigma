package kr.co.persistence;

import java.util.List;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;

public interface compDAO {

	memberVO read(String id);

	void update(memberVO vo);

	void delete(String id);

	List<gameVO> gamelist(String writer);

	void gameinsert(gameVO vo);

}
