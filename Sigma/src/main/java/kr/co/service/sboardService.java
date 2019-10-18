package kr.co.service;

import kr.co.domain.SPageTO;
import kr.co.domain.boardVO;

public interface sboardService {

	SPageTO list(SPageTO sto);
	
	int amount(SPageTO sto);

	boardVO read(int num);

	void del(int num);

	boardVO updateUI(int num);

	void update(boardVO vo);
}
