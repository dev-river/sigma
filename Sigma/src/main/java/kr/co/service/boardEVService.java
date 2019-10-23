package kr.co.service;

import java.util.List;

import kr.co.domain.PageTO;
import kr.co.domain.boardEVVO;

public interface boardEVService {

	List<boardEVVO> boardEVlist();

	void boardEVinsert(boardEVVO vo);

	boardEVVO boardEVread(boardEVVO vo);

	boardEVVO boardEVupdateUI(int num);

	void boardEVupdate(boardEVVO vo);

	void boardEVdelete(int num);

	PageTO<boardEVVO> pageList(PageTO<boardEVVO> to);

	int amount();
}
