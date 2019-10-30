package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.boardNOVO;

@Repository
public class boardNODAOImpl implements boardNODAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.boardNO";
	
	@Override
	public List<boardNOVO> boardNOlist() {
		return session.selectList(NS+".NOlist");
	}

	@Override
	public void boardNOinsert(boardNOVO vo) {
		session.insert(NS+".NOinsert", vo);
	}

	@Override
	public boardNOVO boardNOread(boardNOVO vo) {
		session.update(NS+".addNOviewcnt", vo.getNum());
		return session.selectOne(NS+".NOread", vo);
	}

	@Override
	public boardNOVO boardNOupdateUI(int num) {
		return session.selectOne(NS+".NOupdateUI", num);
	}

	@Override
	public void boardNOupdate(boardNOVO vo) {
		session.update(NS+".NOupdate", vo);
	}

	@Override
	public void boardNOdelete(int num) {
		session.delete(NS+".NOdelete", num);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<boardNOVO> pageList(PageTO<boardNOVO> to) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".pageList", to);
	}



}
