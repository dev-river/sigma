package kr.co.service;

import kr.co.domain.memberVO;

public interface memberService {

	void signin(memberVO vo);

	void signincomp(memberVO vo);

	memberVO login(memberVO vo);

	memberVO searchID(memberVO vo);

	memberVO searchPW(memberVO vo);

	void updateJsidNvalidtime(String jsid, long validtime, String id);

	memberVO getmemberVO(String jsid);

	void timeUpdate(String jsid, long validtime);

	memberVO idcheck(String id);

	memberVO nickcheck(String nickname);

	memberVO compcheck(String compname);

}
