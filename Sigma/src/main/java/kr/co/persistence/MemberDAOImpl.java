package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession session;
	
	private final String NS = "kr.co.mapper.member";

	@Override
	public List<MemberVO> hlist() {
		return session.selectList(NS + ".hlist");
	}
}
