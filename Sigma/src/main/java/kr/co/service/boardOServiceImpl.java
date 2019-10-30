package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.PageTO;
import kr.co.domain.boardOVO;
import kr.co.persistence.boardODAO;

@Service
@Transactional
public class boardOServiceImpl implements boardOService{
	@Inject
	private boardODAO odao;

	@Override
	public List<boardOVO> boardOlist() {
		return odao.boardOlist();
	}

	@Override
	public void boardOinsert(boardOVO vo) {
		odao.boardOinsert(vo);
	}

	@Override
	public boardOVO boardOread(boardOVO vo) {
		return odao.boardOread(vo);
	}

	@Override
	public boardOVO boardOupdateUI(int num) {
		return odao.boardOupdateUI(num);
	}

	@Override
	public void boardOupdate(boardOVO vo) {
		odao.boardOupdate(vo);
	}

	@Override
	public void boardOdelete(int num) {
		odao.boardOdelete(num);
		
	}

	@Override
	public PageTO<boardOVO> pageList(PageTO<boardOVO> to) {
		int amount = odao.getAmount();
		to.setAmount(amount);
		
		List<boardOVO> list = odao.pageList(to);
		to.setList(list);
		
		return to;
	}

	@Override
	public int amount() {
		
		return odao.getAmount();
	}

}
