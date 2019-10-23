package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.PageTO;
import kr.co.domain.boardEVVO;
import kr.co.persistence.boardEVDAO;


@Service
@Transactional
public class boardEVServiceImpl implements boardEVService{
	@Inject
	private boardEVDAO evdao;

	@Override
	public List<boardEVVO> boardEVlist() {
		return evdao.boardEVlist();
	}

	@Override
	public void boardEVinsert(boardEVVO vo) {
		evdao.boardEVinsert(vo);
	}

	@Override
	public boardEVVO boardEVread(boardEVVO vo) {
		return evdao.boardEVread(vo);
	}

	@Override
	public boardEVVO boardEVupdateUI(int num) {
		return evdao.boardEVupdateUI(num);
	}

	@Override
	public void boardEVupdate(boardEVVO vo) {
		evdao.boardEVupdate(vo);
	}

	@Override
	public void boardEVdelete(int num) {
		evdao.boardEVdelete(num);
		
	}

	@Override
	public PageTO<boardEVVO> pageList(PageTO<boardEVVO> to) {
		int amount = evdao.getAmount();
		to.setAmount(amount);
		
		List<boardEVVO> list = evdao.pageList(to);
		to.setList(list);
		
		return to;
	}

	@Override
	public int amount() {
		
		return evdao.getAmount();
	}

}
