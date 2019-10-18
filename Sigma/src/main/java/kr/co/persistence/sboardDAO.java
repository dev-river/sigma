package kr.co.persistence;

import java.util.List;

import kr.co.domain.SPageTO;
import kr.co.domain.boardVO;

public interface sboardDAO {

	int amount(SPageTO sto);

	List<boardVO> list(SPageTO sto);

	boardVO read(int num);
	
	void increaseviewcnt(int num);

	void del(int num);

	boardVO updateUI(int num);

	void update(boardVO vo);

}
