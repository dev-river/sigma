package kr.co.persistence;

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


	
}
