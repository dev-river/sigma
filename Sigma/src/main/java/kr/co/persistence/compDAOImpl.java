package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
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
		vo.setFilepath(vo.getFilepath().substring(3));
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
	public void giveback1(Map<String, Object> map1) {
		session.update(NS+".giveback1", map1);
	}

	@Override
	public void givemoney() {
		session.update(NS+".givemoney");
	}

	@Override
	public void sellermoney(gameVO vo) {
		session.update(NS+".sellermoney", vo);
	}

	@Override
	public void giveback2(int buynum) {
		session.update(NS+".giveback2", buynum);
	}

	@Override
	public int seachcash(String writer) {
		return session.selectOne(NS+".seachcash", writer);
	}

	@Override
	public refundVO refundRead(Map<String, Object> map) {
		return session.selectOne(NS+".refundRead", map);
	}

	@Override
	public int datalist(String writer) {
		return session.selectOne(NS+".datalist1",writer);
	}

	@Override
	public int datalist1(String writer) {
		return session.selectOne(NS+".datalist2", writer);
	}

	@Override
	public void gameimg(List list, int gdnum) {
		for(int i=0;i<list.size();i++) {
			gameDetailFileVO vo = new gameDetailFileVO();
			String filename = (String) list.get(i);
			vo.setFilename(filename.substring(3));
			vo.setGdnum(gdnum);
			session.insert(NS+".gameimg", vo);
		}
	}

	@Override
	public gameVO titlecheck(String title) {
		return session.selectOne(NS+".titlecheck", title);
	}

	@Override
	public int checknum(gameVO vo) {
		return session.selectOne(NS+".checknum", vo);
	}

	@Override
	public int mancount(String writer) {
		return session.selectOne(NS+".mancount", writer);
	}

	@Override
	public int womancount(String writer) {
		return session.selectOne(NS+".womancount", writer);
	}

	@Override
	public int age10(String writer) {
		return session.selectOne(NS+".age10",writer);
	}
	
	@Override
	public int age20(String writer) {
		return session.selectOne(NS+".age20",writer);
	}
	
	@Override
	public int age30(String writer) {
		return session.selectOne(NS+".age30",writer);
	}
	
	@Override
	public int age40(String writer) {
		return session.selectOne(NS+".age40",writer);
	}
}