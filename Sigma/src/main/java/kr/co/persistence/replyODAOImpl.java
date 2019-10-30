package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.replyOVO;
import kr.co.domain.replyVO;

@Repository
public class replyODAOImpl implements replyODAO{
	
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.replyO";
	
	@Override
	public void replyOInsert(replyOVO vo) {
		
		session.insert(NS+".replyOInsert", vo);		
	}
	
	@Override
	public List<replyOVO> replyOList(int frnum) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".replyOList", frnum);
	}

	@Override
	public void replyODelete(int num) {
		session.delete(NS+".replyODelete", num);
		
	}

	@Override
	public void replyOUpdate(replyOVO vo) {
		session.update(NS+".replyOUpdate", vo);
		
	}

	@Override
	public void deleteAll(int num) {
		// TODO Auto-generated method stub
		session.delete(NS+".deleteAll", num);
	};




}
