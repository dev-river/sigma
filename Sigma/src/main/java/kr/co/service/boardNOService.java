package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardNOVO;

public interface boardNOService {

	List<boardNOVO> boardNOlist();

	void boardNOinsert(boardNOVO vo);

	boardNOVO boardNOread(boardNOVO vo);

	boardNOVO boardNOupdateUI(int num);

	void boardNOupdate(boardNOVO vo);

	void boardNOdelete(int num);

	PageTO<boardNOVO> pageList(PageTO<boardNOVO> to);

	int amount();
}
