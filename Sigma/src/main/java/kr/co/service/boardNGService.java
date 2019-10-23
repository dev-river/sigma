package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardNGVO;

public interface boardNGService {

	List<boardNGVO> boardNGlist();

	void boardNGinsert(boardNGVO vo);

	boardNGVO boardNGread(boardNGVO vo);

	boardNGVO boardNGupdateUI(int num);

	void boardNGupdate(boardNGVO vo);

	void boardNGdelete(int num);

	PageTO<boardNGVO> pageList(PageTO<boardNGVO> to);

	int amount();
}
