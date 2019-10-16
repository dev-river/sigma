package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.memberVO;

@Repository
public class adminDAOImpl implements adminDAO{

	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.admin";

	@Override
	public List<memberVO> adminUserList() {

		return session.selectList(NS+".userList");
	}

	@Override
	public List<memberVO> adminSellerList() {

		return session.selectList(NS+".sellerList");
	}

	@Override
	public List<memberVO> adminAdminList() {

		return session.selectList(NS+".adminList");
	}
	
	@Override
	public memberVO adminUserRead(memberVO vo) {
		
		return session.selectOne(NS+".userRead", vo);
	}
}
