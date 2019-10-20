package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
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

	@Override
	public void updateCash(int cash, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cash", cash);
		map.put("id", id);
		session.update(NS+".updateCash", map);
		
	}

	@Override
	public void regiBasket(String obj, int gdnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", obj);
		map.put("gdnum", gdnum);
		session.insert(NS+".regiBasket", map);
	}

	@Override
	public List<basketVO> getBasket(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".basketList", id);
	}

	@Override
	public void deleteBasketList(int gdnum, String id) {
		Map<String, Object> map	 = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("id", id);
		session.delete(NS+".deleteBasketList", map);
		
	}

	@Override
	public void zzim_insert(String id, int gdnum) {
		Map<String, Object> map	 = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("id", id);
		session.insert(NS+".zzim_insert", map);
	}

	@Override
	public List<basketVO> zzim_list(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".zzim_list", id);
	}

	@Override
	public void zzimDelete(int gdnum, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("id", id);
		session.delete(NS+".zzimDelete", map);
		
	}

	@Override
	public void insertBuyList(int gdnum, String id, int price) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("id", id);
		map.put("buyprice", price);
		session.insert(NS+".insertBuyList", map);
	}

	@Override
	public List<buyListVO> buyList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".buyList", id);
	}
	
}
