package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.SPageTO;
import kr.co.domain.boardVO;

@Repository
public class sboardDAOImpl implements sboardDAO{
	
	@Autowired
	private SqlSession session;
	private final String NS = "kr.co.mapper.sboard";
	
	@Override
	public List<boardVO> list(SPageTO sto) {
		
		return session.selectList(NS+".list", sto);
	}
	
	@Override
	public int amount(SPageTO sto) {
		
		return session.selectOne(NS+".amount", sto);
	}

	@Override
	public boardVO read(int num) {
		
		return session.selectOne(NS+".read", num);
	}

	@Override
	public void increaseviewcnt(int num) {
		session.update(NS+".increaseviewcnt", num);
		
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		session.delete(NS+".delete", num);
		
	}

	@Override
	public boardVO updateUI(int num) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".updateUI", num);
	}

	@Override
	public void update(boardVO vo) {
		// TODO Auto-generated method stub
		session.update(NS+".update", vo);
		
	}
}
