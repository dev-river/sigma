package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardOVO;
import kr.co.domain.boardVO;

public interface boardOService {

	List<boardOVO> boardOlist();

	void boardOinsert(boardOVO vo);

	boardOVO boardOread(boardOVO vo);

	boardOVO boardOupdateUI(int num);

	void boardOupdate(boardOVO vo);

	void boardOdelete(int num);

	PageTO<boardOVO> pageList(PageTO<boardOVO> to);

	int amount();

	
}
