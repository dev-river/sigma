package kr.co.persistence;

import kr.co.domain.memberVO;

public interface myPageDAO {

	memberVO getMemberVO(String userId);

	memberVO updateUI(String id);

	void update(memberVO vo);

	void delete(String id, String pw);

}
