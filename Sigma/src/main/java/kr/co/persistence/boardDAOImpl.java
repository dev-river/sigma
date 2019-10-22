package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.boardVO;

@Repository
public class boardDAOImpl implements boardDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.board";
	
	@Override
	public List<boardVO> boardFRlist() {
		return session.selectList(NS+".FRlist");
	}

	@Override
	public void boardFRinsert(boardVO vo) {
		session.insert(NS+".FRinsert", vo);
	}

	@Override
	public boardVO boardFRread(boardVO vo) {
		session.update(NS+".addFRviewcnt", vo.getNum());
		return session.selectOne(NS+".FRread", vo);
	}

	@Override
	public boardVO boardFRupdateUI(int num) {
		return session.selectOne(NS+".FRupdateUI", num);
	}

	@Override
	public void boardFRupdate(boardVO vo) {
		session.update(NS+".FRupdate", vo);
	}

	@Override
	public void boardFRdelete(int num) {
		session.delete(NS+".FRdelete", num);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<boardVO> pageList(PageTO<boardVO> to) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".pageList", to);
	}



}
