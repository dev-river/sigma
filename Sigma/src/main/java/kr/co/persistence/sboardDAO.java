package kr.co.persistence;

import java.util.List;

import kr.co.domain.SPageTO;
import kr.co.domain.boardNGVO;
import kr.co.domain.boardVO;

public interface sboardDAO {
	/* ================ 자유게시판 부분 =============== */
	
	int amount(SPageTO sto);

	List<boardVO> list(SPageTO sto);

	boardVO read(int num);
	
	void increaseviewcnt(int num);

	void del(int num);

	boardVO updateUI(int num);

	void update(boardVO vo);
	
	/* ================ 새게임소식 부분 =============== */
	
	int NGamount(SPageTO sto);
	
	List<boardNGVO> NGList(SPageTO sto);

	boardNGVO NGRead(int num);

	boardNGVO NGUpdateUI(int num);

	void NGUpdate(boardNGVO vo);


}
