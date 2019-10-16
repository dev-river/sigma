package kr.co.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.memberVO;


@Repository
public class myPageDAOImpl implements myPageDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.myPage";
	
	@Override
	public memberVO getMemberVO(String userId) {
		
		return session.selectOne(NS+".getMemberVO", userId);
		
	}

	@Override
	public memberVO updateUI(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".updateUI", id);
	}

	@Override
	public void update(memberVO vo) {
		session.update(NS+".myProfileUpdate", vo);
		
	}

	@Override
	public void delete(String id, String pw) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pw", pw);
		map.put("id", id);
		session.delete(NS+".deleteUser", map);
		
	}
	
}
