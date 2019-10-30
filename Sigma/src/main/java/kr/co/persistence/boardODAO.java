package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardOVO;

public interface boardODAO {
	
	public List<boardOVO> boardOlist();

	public void boardOinsert(boardOVO vo);

	public boardOVO boardOread(boardOVO vo);

	public boardOVO boardOupdateUI(int num);

	public void boardOupdate(boardOVO vo);

	public void boardOdelete(int num);

	public int getAmount();

	public List<boardOVO> pageList(PageTO<boardOVO> to);

}
