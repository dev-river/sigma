package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.boardEVVO;

@Repository
public class boardEVDAOImpl implements boardEVDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.boardEV";
	
	@Override
	public List<boardEVVO> boardEVlist() {
		return session.selectList(NS+".EVlist");
	}

	@Override
	public void boardEVinsert(boardEVVO vo) {
		session.insert(NS+".EVinsert", vo);
	}

	@Override
	public boardEVVO boardEVread(boardEVVO vo) {
		session.update(NS+".addEVviewcnt", vo.getNum());
		return session.selectOne(NS+".EVread", vo);
	}

	@Override
	public boardEVVO boardEVupdateUI(int num) {
		return session.selectOne(NS+".EVupdateUI", num);
	}

	@Override
	public void boardEVupdate(boardEVVO vo) {
		session.update(NS+".EVupdate", vo);
	}

	@Override
	public void boardEVdelete(int num) {
		session.delete(NS+".EVdelete", num);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<boardEVVO> pageList(PageTO<boardEVVO> to) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".pageList", to);
	}



}
