package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;

public interface boardService {

	List<boardVO> boardFRlist();

	void boardFRinsert(boardVO vo);

	boardVO boardFRread(boardVO vo);

	boardVO boardFRupdateUI(int num);

	void boardFRupdate(boardVO vo);

	void boardFRdelete(int num);

	PageTO<boardVO> pageList(PageTO<boardVO> to);

	int amount();
}
