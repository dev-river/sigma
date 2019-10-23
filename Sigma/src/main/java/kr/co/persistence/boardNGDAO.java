package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardNGVO;

public interface boardNGDAO {
	public List<boardNGVO> boardNGlist();

	public void boardNGinsert(boardNGVO vo);

	public boardNGVO boardNGread(boardNGVO vo);

	public boardNGVO boardNGupdateUI(int num);

	public void boardNGupdate(boardNGVO vo);

	public void boardNGdelete(int num);

	public int getAmount();

	public List<boardNGVO> pageList(PageTO<boardNGVO> to);

}
