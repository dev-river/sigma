package kr.co.persistence;

import kr.co.domain.memberVO;

public interface memberDAO {

	public void signin(memberVO vo);

	public void signincomp(memberVO vo);

	public memberVO login(memberVO vo);

	public memberVO searchID(memberVO vo);

	public memberVO searchPW(memberVO vo);

}
