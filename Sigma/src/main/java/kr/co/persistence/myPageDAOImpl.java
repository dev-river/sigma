package kr.co.persistence;

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
	
}
