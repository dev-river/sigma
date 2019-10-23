package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardEVVO;

public interface boardEVDAO {
	public List<boardEVVO> boardEVlist();

	public void boardEVinsert(boardEVVO vo);

	public boardEVVO boardEVread(boardEVVO vo);

	public boardEVVO boardEVupdateUI(int num);

	public void boardEVupdate(boardEVVO vo);

	public void boardEVdelete(int num);

	public int getAmount();

	public List<boardEVVO> pageList(PageTO<boardEVVO> to);

}
