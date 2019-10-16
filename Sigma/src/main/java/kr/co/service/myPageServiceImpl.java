package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.memberVO;
import kr.co.persistence.myPageDAO;

@Service
@Transactional
public class myPageServiceImpl implements myPageService{
	@Inject
	private myPageDAO mpdao;

	@Override
	public memberVO getMemberVO(String userId) {
		
		return mpdao.getMemberVO(userId);
		
	}

	@Override
	public memberVO updateUI(String id) {
		// TODO Auto-generated method stub
		return mpdao.updateUI(id);
	}

	@Override
	public void update(memberVO vo) {
		mpdao.update(vo);
		
	}

	@Override
	public void delete(String id, String pw) {
		mpdao.delete(id, pw);
		
	}

}