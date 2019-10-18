package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;

public interface boardDAO {
	public List<boardVO> boardFRlist();

	public void boardFRinsert(boardVO vo);

	public boardVO boardFRread(boardVO vo);

	public boardVO boardFRupdateUI(int num);

	public void boardFRupdate(boardVO vo);

	public void boardFRdelete(int num);

	public int getAmount();

	public List<boardVO> pageList(PageTO to);

	

}
