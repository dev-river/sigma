package kr.co.service;

import kr.co.domain.SPageTO;
import kr.co.domain.boardNGVO;
import kr.co.domain.boardVO;

public interface sboardService {
	
	/* ================ 자유게시판 부분 =============== */
	SPageTO list(SPageTO sto);
	
	int amount(SPageTO sto);

	boardVO read(int num);

	void del(int num);

	boardVO updateUI(int num);

	void update(boardVO vo);
	/* ================ 새게임소식 부분 =============== */

	SPageTO NGList(SPageTO sto);
	
	int NGamount(SPageTO sto);

	boardNGVO NGRead(int num);

	boardNGVO NGUpdateUI(int num);

	void NGUpdate(boardNGVO vo);

	

	


}
