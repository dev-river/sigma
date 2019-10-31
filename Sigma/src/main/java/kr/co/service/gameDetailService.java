package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.SPageTO;
import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;

public interface gameDetailService {


	gameVO read(int num);

	List<String> filepath(int num);

	gameDetailDcVO dccheck(int num);

	void dcadd(int num);

	void update(gameVO vo);

	gPageTO<reviewVO> reviewlist(int num, gPageTO<reviewVO> pto);

	reviewVO maxYesReview(int num);

	reviewVO maxNoReview(int num);

	void reviewadd(int num, String assist);

	void reviewinsert(int gdnum, String reviewContent, String likeselect, String id);

	void reviewdelete(int num);

	reviewVO reviewselect(int num);

	void reviewupdate(reviewVO vo);

	List<gameDetailDcVO> dcrqlist(int num);

	void DCRqSet(gameDetailDcVO vo);

	void gameStatus(int num, String status);

	SPageTO list(SPageTO to, String category);

	int dcjoincheck(int num, String id);

	void dcjoininsert(int num, String id);

	int buycheck(String id, int num);

	int manratio(int num);

	int womanratio(int num);

	int ageratio1(int num);

	int ageratio2(int num);

	int ageratio3(int num);

	int ageratio4(int num);

	List<gameDetailFileVO> filename(int num);

	void imgupdate1(String filename1, int num1);
	
	void imgupdate2(String filename2, int num2);
	
	void imgupdate3(String filename3, int num3);
	
	void imgupdate4(String filename4, int num4);
}
