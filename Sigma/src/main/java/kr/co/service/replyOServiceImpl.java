package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.replyOVO;
import kr.co.domain.replyVO;
import kr.co.persistence.replyDAO;
import kr.co.persistence.replyODAO;

@Service
@Transactional
public class replyOServiceImpl implements replyOService{
	
	@Inject
	private replyODAO odao;

	@Override
	public void replyOInsert(replyOVO vo) {
		odao.replyOInsert(vo);
		
	}

	@Override
	public List<replyOVO> replyOList(int frnum) {
		
		return odao.replyOList(frnum);
	}


	@Override
	public void Odelete(int num) {
		odao.replyODelete(num);
		
	}

	@Override
	public void replyOUpdate(replyOVO vo) {
		odao.replyOUpdate(vo);
		
	}

	@Override
	public void deleteAll(int num) {
		odao.deleteAll(num);
	}

}
