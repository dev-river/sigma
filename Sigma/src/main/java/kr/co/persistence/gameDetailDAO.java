package kr.co.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.SPageTO;
import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;

public interface gameDetailDAO {


	gameVO read(int num);

	List<String> filepath(int num);

	gameDetailDcVO dccheck(int num);

	void dcadd(int num);

	void update(gameVO vo);

	List<reviewVO> reviewlist(int num, gPageTO<reviewVO> sto);

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

	int getAmount(SPageTO to, String category);

	List<gameVO> list(SPageTO to, String category);

	int getReviewAmount(int num);

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

	void imgupdate(List list, int[] num);
}
