package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.PageTO;
import kr.co.domain.boardNGVO;
import kr.co.persistence.boardNGDAO;

@Service
@Transactional
public class boardNGServiceImpl implements boardNGService{
	@Inject
	private boardNGDAO ngdao;

	@Override
	public List<boardNGVO> boardNGlist() {
		return ngdao.boardNGlist();
	}

	@Override
	public void boardNGinsert(boardNGVO vo) {
		ngdao.boardNGinsert(vo);
	}

	@Override
	public boardNGVO boardNGread(boardNGVO vo) {
		return ngdao.boardNGread(vo);
	}

	@Override
	public boardNGVO boardNGupdateUI(int num) {
		return ngdao.boardNGupdateUI(num);
	}

	@Override
	public void boardNGupdate(boardNGVO vo) {
		ngdao.boardNGupdate(vo);
	}

	@Override
	public void boardNGdelete(int num) {
		ngdao.boardNGdelete(num);
		
	}

	@Override
	public PageTO<boardNGVO> pageList(PageTO<boardNGVO> to) {
		int amount = ngdao.getAmount();
		to.setAmount(amount);
		
		List<boardNGVO> list = ngdao.pageList(to);
		to.setList(list);
		
		return to;
	}

	@Override
	public int amount() {
		
		return ngdao.getAmount();
	}

}
