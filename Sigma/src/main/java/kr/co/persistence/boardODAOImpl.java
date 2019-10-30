package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.boardOVO;

@Repository
public class boardODAOImpl implements boardODAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.boardO";
	
	@Override
	public List<boardOVO> boardOlist() {
		return session.selectList(NS+".Olist");
	}

	@Override
	public void boardOinsert(boardOVO vo) {
		session.insert(NS+".Oinsert", vo);
	}

	@Override
	public boardOVO boardOread(boardOVO vo) {
		session.update(NS+".addOviewcnt", vo.getNum());
		return session.selectOne(NS+".Oread", vo);
	}

	@Override
	public boardOVO boardOupdateUI(int num) {
		return session.selectOne(NS+".OupdateUI", num);
	}

	@Override
	public void boardOupdate(boardOVO vo) {
		session.update(NS+".Oupdate", vo);
	}

	@Override
	public void boardOdelete(int num) {
		session.delete(NS+".Odelete", num);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<boardOVO> pageList(PageTO<boardOVO> to) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".pageList", to);
	}



}
