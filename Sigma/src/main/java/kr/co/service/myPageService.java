package kr.co.service;

import kr.co.domain.memberVO;

public interface myPageService {

	memberVO getMemberVO(String userId);

	memberVO updateUI(String id);

	void update(memberVO vo);

	void delete(String id, String pw);

}
