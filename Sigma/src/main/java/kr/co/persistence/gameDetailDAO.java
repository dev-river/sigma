package kr.co.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;

public interface gameDetailDAO {

	List<gameVO> list(String category);

	gameVO read(int num);

	List<String> filepath(int num);

	gameDetailDcVO dccheck(int num);

	void dcadd(int num);

	void update(gameVO vo);

	List<reviewVO> reviewlist(int num);

	reviewVO maxYesReview(int num);

	reviewVO maxNoReview(int num);

	void reviewadd(int num, String assist);

	void reviewinsert(int gdnum, String reviewContent, String likeselect, String id);

	void reviewdelete(int num);

	reviewVO reviewselect(int num);





}
