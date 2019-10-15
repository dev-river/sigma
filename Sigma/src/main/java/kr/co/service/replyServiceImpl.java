package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.replyVO;
import kr.co.persistence.replyDAO;

@Service
@Transactional
public class replyServiceImpl implements replyService{
	
	@Inject
	private replyDAO rdao;

	@Override
	public void replyInsert(replyVO vo) {
		rdao.replyInsert(vo);
		
	}

	@Override
	public List<replyVO> replyList(int frnum) {
		
		return rdao.replyList(frnum);
	}




	@Override
	public void delete(int num) {
		rdao.replyDelete(num);
		
	}

	@Override
	public void replyUpdate(replyVO vo) {
		rdao.replyUpdate(vo);
		
	}

}
