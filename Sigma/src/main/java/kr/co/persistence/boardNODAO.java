package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardNOVO;

public interface boardNODAO {
	public List<boardNOVO> boardNOlist();

	public void boardNOinsert(boardNOVO vo);

	public boardNOVO boardNOread(boardNOVO vo);

	public boardNOVO boardNOupdateUI(int num);

	public void boardNOupdate(boardNOVO vo);

	public void boardNOdelete(int num);

	public int getAmount();

	public List<boardNOVO> pageList(PageTO<boardNOVO> to);

}
