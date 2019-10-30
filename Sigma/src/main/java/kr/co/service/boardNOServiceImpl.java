package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.PageTO;
import kr.co.domain.boardNOVO;
import kr.co.persistence.boardNODAO;


@Service
@Transactional
public class boardNOServiceImpl implements boardNOService{
	@Inject
	private boardNODAO nodao;

	@Override
	public List<boardNOVO> boardNOlist() {
		return nodao.boardNOlist();
	}

	@Override
	public void boardNOinsert(boardNOVO vo) {
		nodao.boardNOinsert(vo);
	}

	@Override
	public boardNOVO boardNOread(boardNOVO vo) {
		return nodao.boardNOread(vo);
	}

	@Override
	public boardNOVO boardNOupdateUI(int num) {
		return nodao.boardNOupdateUI(num);
	}

	@Override
	public void boardNOupdate(boardNOVO vo) {
		nodao.boardNOupdate(vo);
	}

	@Override
	public void boardNOdelete(int num) {
		nodao.boardNOdelete(num);
		
	}

	@Override
	public PageTO<boardNOVO> pageList(PageTO<boardNOVO> to) {
		int amount = nodao.getAmount();
		to.setAmount(amount);
		
		List<boardNOVO> list = nodao.pageList(to);
		to.setList(list);
		
		return to;
	}

	@Override
	public int amount() {
		
		return nodao.getAmount();
	}

}
