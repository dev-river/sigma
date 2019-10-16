package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.replyVO;

@Repository
public class replyDAOImpl implements replyDAO{
	
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.reply";
	
	@Override
	public void replyInsert(replyVO vo) {
		
		session.insert(NS+".replyInsert", vo);		
	}
	
	@Override
	public List<replyVO> replyList(int frnum) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".replyList", frnum);
	}



	@Override
	public void replyDelete(int num) {
		session.delete(NS+".replyDelete", num);
		
	}

	@Override
	public void replyUpdate(replyVO vo) {
		session.update(NS+".replyUpdate", vo);
		
	};




}
