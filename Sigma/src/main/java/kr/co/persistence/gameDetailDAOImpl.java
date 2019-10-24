package kr.co.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.SPageTO;
import kr.co.domain.gPageTO;
import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.reviewVO;


@Repository
public class gameDetailDAOImpl implements gameDetailDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.gameInform";
	

	@Override
	public gameVO read(int num) {
		return session.selectOne(NS+".read", num);
	}

	@Override
	public List<String> filepath(int num) {
		return session.selectList(NS+".filepath", num);
	}

	@Override
	public gameDetailDcVO dccheck(int num) {
		return session.selectOne(NS+".dccheck", num);
	}

	@Override
	public void dcadd(int num) {
		session.update(NS+".dcadd", num);
	}

	@Override
	public void update(gameVO vo) {
		session.update(NS+".update", vo);
	}

	@Override
	public List<reviewVO> reviewlist(int num) {
		return session.selectList(NS+".reviewlist", num);
	}

	@Override
	public reviewVO maxYesReview(int num) {
		return session.selectOne(NS+".maxYesReview", num);
	}

	@Override
	public reviewVO maxNoReview(int num) {
		return session.selectOne(NS+".maxNoReview", num);
	}

	@Override
	public void reviewadd(int num, String assist) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("assist", assist);
		session.update(NS+".reviewadd", map);
	}

	@Override
	public void reviewinsert(int gdnum, String reviewContent, String likeselect, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("reviewContent", reviewContent);
		map.put("likeselect", likeselect);
		map.put("id", id);
		
		session.insert(NS+".reviewinsert", map);
	}

	@Override
	public void reviewdelete(int num) {
		session.delete(NS+".reviewdelete", num);
	}

	@Override
	public reviewVO reviewselect(int num) {
		return session.selectOne(NS+".reviewselect", num);
	}

	@Override
	public void reviewupdate(reviewVO vo) {
		session.update(NS+".reviewupdate", vo);
	}

	@Override
	public List<gameDetailDcVO> dcrqlist(int num) {
		return session.selectList(NS+".dcrqlist", num);
	}

	@Override
	public void DCRqSet(gameDetailDcVO vo) {
		session.insert(NS+".DCRqSet", vo);
	}

	@Override
	public void gameStatus(int num, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("status", status);
		session.update(NS+".gameStatus", map);
	}

	@Override
	public int getAmount(SPageTO to, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		
		return session.selectOne(NS+".getAmount", map);
	}

	@Override
	public List<gameVO> list(SPageTO to, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", to.getStartNum());
		map.put("endNum", to.getEndNum());
		
		map.put("category", category);
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		return session.selectList(NS+".list", map);
	}

}
