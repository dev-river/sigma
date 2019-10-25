package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.boardVO;
import kr.co.domain.memberVO;
import kr.co.domain.reviewVO;

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

	@Override
	public void logoupdate(String logofilepath, adminSetVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("logofilepath", logofilepath);
		map.put("vo", vo);
		
		session.update(NSsetting+".changeLogo", map);
	}

	@Override
	public void bgupdate(String bgfilepath, adminSetVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bgfilepath", bgfilepath);
		map.put("vo", vo);
		
		session.update(NSsetting+".changeBG", map);
	}

	@Override
	public adminSetVO getBGimg() {

		return session.selectOne(NSsetting+".getBGimg");
	}

	@Override
	public adminSetVO getLogoimg() {
		
		return session.selectOne(NSsetting+".getLogoimg");
	}

	@Override
	public List<adminSlideVO> slideList() {

		return session.selectList(NSsetting+".slideList");
	}

	@Override
	public void slideDelete(int num) {

		session.delete(NSsetting+".slideDelete", num);
	}

	@Override
	public void slideInsert(String bnfilepath, adminSlideVO vo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("filepath", bnfilepath);
		map.put("urlpath", vo.geturlpath());
		
		session.insert(NSsetting+".slideInsert", map);
	}

	@Override
	public adminSlideVO getSlide(int num) {

		return session.selectOne(NSsetting+".getSlide", num);
	}

	@Override
	public void slideUpdate(String bnfilepath, adminSlideVO vo) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("filepath", bnfilepath);
		map.put("urlpath", vo.geturlpath());
		map.put("num", vo.getNum());
		
		session.update(NSsetting+".slideUpdate", map);
	}

	@Override
	public List<boardVO> boardAllList(SPageTO to) {
		return session.selectList(NSboard+".boardAllList", to);
	}

	@Override
	public int getAmount(SPageTO to) {
		return session.selectOne(NSboard+".getAmount", to);
	}

	@Override
	public int getReviewAmount(SPageTO to) {
		return session.selectOne(NSboard+".getReviewAmount", to);
	}

	@Override
	public List<reviewVO> reviewAllList(SPageTO to) {
		return session.selectList(NSboard+".reviewAllList", to);
	}

	@Override
	public reviewVO reviewRead(int num) {
		return session.selectOne(NSboard+".reviewRead", num);
	}
}
