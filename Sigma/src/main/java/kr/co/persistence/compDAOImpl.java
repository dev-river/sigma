package kr.co.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;

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

	@Override
	public int count(String id) {
		return session.selectOne(NS+".count", id);
	}

	@Override
	public List<refundVO> refundList(String id) {
		return session.selectList(NS+".refundList", id);
	}

	@Override
	public List<gameDetailDcVO> gameDetailDC(String writer) {
		return session.selectList(NS+".gameDetailDC", writer);
	}

	@Override
	public refundVO refundRead(String id) {
		return session.selectOne(NS+".refundRead", id);
	}

	@Override
	public void refundOK(int num) {
		session.update(NS+".refundOK", num);
	}
	
	@Override
	public void refundReject(Map<String, Object> map) {
		session.update(NS+".refundReject", map);
	}

	@Override
	public void returncash(Map<String, Object> map2) {
		session.update(NS+".returncash", map2);
	}

	@Override
	public void giveback(Map<String, Object> map1) {
		session.update(NS+".giveback", map1);
	}

	@Override
	public int seachcash(gameVO vo) {
		return session.selectOne(NS+".seachcash", vo);
	}

	@Override
	public void givemoney() {
		session.update(NS+".givemoney");
	}

	@Override
	public void sellermoney(gameVO vo) {
		session.update(NS+".sellermoney", vo);
	}

	
}