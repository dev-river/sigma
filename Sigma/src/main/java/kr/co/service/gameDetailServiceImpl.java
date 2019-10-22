package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;
import kr.co.persistence.gameDetailDAO;

@Service
@Transactional
public class gameDetailServiceImpl implements gameDetailService{
	@Inject
	private gameDetailDAO gdao;

	@Override
	public List<gameVO> list(String category) {
		return gdao.list(category);
	}

	@Override
	public gameVO read(int num) {
		return gdao.read(num);
	}

	@Override
	public List<String> filepath(int num) {
		return gdao.filepath(num);
	}

	@Override
	public gameDetailDcVO dccheck(int num) {
		return gdao.dccheck(num);
	}

	@Override
	public void dcadd(int num) {
		gdao.dcadd(num);
	}

	@Override
	public void update(gameVO vo) {
		gdao.update(vo);
	}

	@Override
	public List<reviewVO> reviewlist(int num) {
		return gdao.reviewlist(num);
	}

	@Override
	public reviewVO maxYesReview(int num) {
		return gdao.maxYesReview(num);
	}

	@Override
	public reviewVO maxNoReview(int num) {
		return gdao.maxNoReview(num);
	}

	@Override
	public void reviewadd(int num, String assist) {
		gdao.reviewadd(num, assist);
	}

	@Override
	public void reviewinsert(int gdnum, String reviewContent, String likeselect, String id) {
		gdao.reviewinsert(gdnum, reviewContent, likeselect, id);
	}

	@Override
	public void reviewdelete(int num) {
		gdao.reviewdelete(num);
	}

	@Override
	public reviewVO reviewselect(int num) {
		return gdao.reviewselect(num);
	}

	@Override
	public void reviewupdate(reviewVO vo) {
		gdao.reviewupdate(vo);
	}

	@Override
	public List<gameDetailDcVO> dcrqlist(int num) {
		return gdao.dcrqlist(num);
	}

	@Override
	public void DCRqSet(gameDetailDcVO vo) {
		gdao.DCRqSet(vo);
	}
}
