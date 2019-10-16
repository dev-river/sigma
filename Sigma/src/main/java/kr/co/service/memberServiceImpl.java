package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.memberVO;
import kr.co.persistence.memberDAO;

@Service
@Transactional
public class memberServiceImpl implements memberService{
	@Inject
	private memberDAO mdao;

	@Override
	public void signin(memberVO vo) {
		mdao.signin(vo);
	}

	@Override
	public void signincomp(memberVO vo) {
		// TODO Auto-generated method stub
		mdao.signincomp(vo);
	}
	
	@Override
	public memberVO login(memberVO vo) {
		
		return mdao.login(vo);
		
	}

	@Override
	public memberVO searchID(memberVO vo) {
		// TODO Auto-generated method stub
		return mdao.searchID(vo);
	}

	@Override
	public memberVO searchPW(memberVO vo) {
		// TODO Auto-generated method stub
		return mdao.searchPW(vo);
	}

	@Override
	public void updateJsidNvalidtime(String jsid, long validtime, String id) {
		mdao.updateJsidNvalidtime(jsid, validtime, id);
		
	}

	@Override
	public memberVO getmemberVO(String jsid) {
		// TODO Auto-generated method stub
		return mdao.getmemberVO(jsid);
	}

	@Override
	public void timeUpdate(String jsid, long validtime) {
		mdao.timeUpdate(jsid, validtime);
		
	}

	@Override
	public memberVO idcheck(String id) {
		// TODO Auto-generated method stub
		return mdao.idcheck(id);
	}

	@Override
	public memberVO nickcheck(String nickname) {
		// TODO Auto-generated method stub
		return mdao.nickcheck(nickname);
	}

	@Override
	public memberVO compcheck(String compname) {
		// TODO Auto-generated method stub
		return mdao.compcheck(compname);
	}


}
