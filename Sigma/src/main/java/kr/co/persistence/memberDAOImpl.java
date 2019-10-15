package kr.co.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.memberVO;

@Repository
public class memberDAOImpl implements memberDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.member";
	

	@Override
	public void signin(memberVO vo) {
		session.insert(NS+".signin", vo);
	}

	@Override
	public void signincomp(memberVO vo) {
		session.insert(NS+".signincomp", vo);
	}

	@Override
	public memberVO login(memberVO vo) {
		return session.selectOne(NS+".login", vo);
		
	}

	@Override
	public memberVO searchID(memberVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".searchID", vo);
	}

	@Override
	public memberVO searchPW(memberVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".searchPW", vo);
		
	}

	@Override
	public void updateJsidNvalidtime(String jsid, long validtime, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jsid", jsid);
		map.put("validtime", validtime);
		map.put("id", id);
		session.update(NS+".updateJsidNvalidtime", map);
		
	}

	@Override
	public memberVO getmemberVO(String jsid) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getmemberVO", jsid);
	}

	@Override
	public void timeUpdate(String jsid, long validtime) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jsid", jsid);
		map.put("validtime", validtime);
		
		session.update(NS+".timeUpdate", map);
		
	}


	
}
