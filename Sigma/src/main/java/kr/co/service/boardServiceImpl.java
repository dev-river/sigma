package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;
import kr.co.persistence.boardDAO;

@Service
@Transactional
public class boardServiceImpl implements boardService{
	@Inject
	private boardDAO bdao;

	@Override
	public List<boardVO> boardFRlist() {
		return bdao.boardFRlist();
	}

	@Override
	public void boardFRinsert(boardVO vo) {
		bdao.boardFRinsert(vo);
	}

	@Override
	public boardVO boardFRread(boardVO vo) {
		return bdao.boardFRread(vo);
	}

	@Override
	public boardVO boardFRupdateUI(int num) {
		return bdao.boardFRupdateUI(num);
	}

	@Override
	public void boardFRupdate(boardVO vo) {
		bdao.boardFRupdate(vo);
	}

	@Override
	public void boardFRdelete(int num) {
		bdao.boardFRdelete(num);
		
	}

	@Override
	public PageTO<boardVO> pageList(PageTO<boardVO> to) {
		int amount = bdao.getAmount();
		to.setAmount(amount);
		
		List<boardVO> list = bdao.pageList(to);
		to.setList(list);
		
		return to;
	}

	@Override
	public int amount() {
		
		return bdao.getAmount();
	}

}
