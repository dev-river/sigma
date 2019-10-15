package kr.co.persistence;

import kr.co.domain.memberVO;

public interface memberDAO {

	public void signin(memberVO vo);

	public void signincomp(memberVO vo);

	public memberVO login(memberVO vo);

	public memberVO searchID(memberVO vo);

	public memberVO searchPW(memberVO vo);

	public void updateJsidNvalidtime(String jsid, long validtime, String id);

	public memberVO getmemberVO(String jsid);

	public void timeUpdate(String jsid, long validtime);

}
