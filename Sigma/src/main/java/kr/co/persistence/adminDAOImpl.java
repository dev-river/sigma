package kr.co.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.adminSetVO;
import kr.co.domain.memberVO;

@Repository
public class adminDAOImpl implements adminDAO{

	@Inject
	private SqlSession session;
	private final String NSuser = "kr.co.mapper.adminUser";
	private final String NSboard = "kr.co.mapper.adminBoard";
	private final String NSsetting = "kr.co.mapper.adminSetting";
	private final String NSanalysis = "kr.co.mapper.adminAnalysis";

	@Override
	public List<memberVO> adminUserList() {

		return session.selectList(NSuser+".userList");
	}

	@Override
	public List<memberVO> adminSellerList() {

		return session.selectList(NSuser+".sellerList");
	}

	@Override
	public List<memberVO> adminAdminList() {

		return session.selectList(NSuser+".adminList");
	}
	
	@Override
	public memberVO adminUserRead(memberVO vo) {
		
		return session.selectOne(NSuser+".userRead", vo);
	}

	@Override
	public memberVO userAuthorUI(String id) {

		return session.selectOne(NSuser+".userAuthorUI", id);
	}

	@Override
	public void userAuthor(memberVO vo) {

		session.update(NSuser+".userAuthor", vo);
	}

	@Override
	public void userDelete(String id) {

		session.delete(NSuser+".userDelete", id);
	}

	@Override
	public adminSetVO changeChargeUI() {

		return session.selectOne(NSsetting+".changeChargeUI");
	}

	@Override
	public void changeCharge(adminSetVO vo) {

		session.update(NSsetting+".changeCharge", vo);
	}

	

}
