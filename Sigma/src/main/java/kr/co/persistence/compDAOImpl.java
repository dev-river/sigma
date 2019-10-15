package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;

@Repository
public class compDAOImpl implements compDAO {

	@Inject
	private SqlSession session;
	
	private final String NS = "kr.co.mapper.compManage";

	@Override
	public memberVO read(String id) {
		return session.selectOne(NS+".read", id);
	}

	@Override
	public void update(memberVO vo) {
		session.update(NS+".update", vo);
	}

	@Override
	public void delete(String id) {
		session.delete(NS+".delete", id);
	}

	@Override
	public List<gameVO> gamelist(String writer) {
		return session.selectList(NS+".gamelist", writer);
	}

	@Override
	public void gameinsert(gameVO vo) {
		session.insert(NS+".gameinsert", vo);
	}
}
