package kr.co.service;

import kr.co.domain.memberVO;

public interface memberService {

	void signin(memberVO vo);

	void signincomp(memberVO vo);

	memberVO login(memberVO vo);

	memberVO searchID(memberVO vo);

	memberVO searchPW(memberVO vo);

}
