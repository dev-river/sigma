package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.PageTO;
import kr.co.domain.boardNGVO;

@Repository
public class boardNGDAOImpl implements boardNGDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.boardNG";
	
	@Override
	public List<boardNGVO> boardNGlist() {
		return session.selectList(NS+".NGlist");
	}

	@Override
	public void boardNGinsert(boardNGVO vo) {
		session.insert(NS+".NGinsert", vo);
	}

	@Override
	public boardNGVO boardNGread(boardNGVO vo) {
		session.update(NS+".addNGviewcnt", vo.getNum());
		return session.selectOne(NS+".NGread", vo);
	}

	@Override
	public boardNGVO boardNGupdateUI(int num) {
		return session.selectOne(NS+".NGupdateUI", num);
	}

	@Override
	public void boardNGupdate(boardNGVO vo) {
		session.update(NS+".NGupdate", vo);
	}

	@Override
	public void boardNGdelete(int num) {
		session.delete(NS+".NGdelete", num);
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getAmount");
	}

	@Override
	public List<boardNGVO> pageList(PageTO<boardNGVO> to) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".pageList", to);
	}



}
