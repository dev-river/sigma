package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.SPageTO;
import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;
import kr.co.persistence.gameDetailDAO;

@Service
@Transactional
public class gameDetailServiceImpl implements gameDetailService{
	@Inject
	private gameDetailDAO gdao;

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
	public gPageTO<reviewVO> reviewlist(int num, gPageTO<reviewVO> sto) {
		int amount = gdao.getReviewAmount(num);
		sto.setAmount(amount);
		
		List<reviewVO> list = gdao.reviewlist(num, sto);
		sto.setList(list);
		return sto;
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

	@Override
	public void gameStatus(int num, String status) {
		gdao.gameStatus(num, status);
	}

	@Override
	public SPageTO list(SPageTO to, String category) {
		if (category.equalsIgnoreCase("all")) {
  			category = "%";
  		}
		int amount = gdao.getAmount(to, category);
		to.setAmount(amount);
		
		List<gameVO> list = gdao.list(to, category);
		to.setList(list);
		return to;
	}

	@Override
	public int dcjoincheck(int num, String id) {
		return gdao.dcjoincheck(num, id);
	}

	@Override
	public void dcjoininsert(int num, String id) {
		gdao.dcjoininsert(num, id);
	}

	@Override
	public int buycheck(String id, int num) {
		return gdao.buycheck(id, num);
	}

	@Override
	public int manratio(int num) {
		return gdao.manratio(num);
	}

	@Override
	public int womanratio(int num) {
		return gdao.womanratio(num);
	}

	@Override
	public int ageratio1(int num) {
		return gdao.ageratio1(num);
	}

	@Override
	public int ageratio2(int num) {
		return gdao.ageratio2(num);
	}

	@Override
	public int ageratio3(int num) {
		return gdao.ageratio3(num);
	}

	@Override
	public int ageratio4(int num) {
		return gdao.ageratio4(num);
	}

	@Override
	public List<gameDetailFileVO> filename(int num) {
		return gdao.filename(num);
	}

	@Override
	public void imgupdate1(String filename1, int num1) {
		gdao.imgupdate1(filename1, num1);
	}

	@Override
	public void imgupdate2(String filename2, int num2) {
		gdao.imgupdate2(filename2, num2);
	}

	@Override
	public void imgupdate3(String filename3, int num3) {
		gdao.imgupdate3(filename3, num3);
	}

	@Override
	public void imgupdate4(String filename4, int num4) {
		gdao.imgupdate4(filename4, num4);
	}
}
