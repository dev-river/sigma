package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.basketVO;
import kr.co.domain.buyListVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;


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

	@Override
	public void buyListdelete(int gdnum, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("gdnum", gdnum);
		map.put("id", id);
		session.delete(NS+".buyListdelete", map);
		
	}

	@Override
	public List<refundVO> refundList(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".refundList", id);
	}

	@Override
	public int getrefundgdnum(int buynum, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", buynum);
		map.put("id", id);
		return session.selectOne(NS+".getrefundgdnum", map);
		
	}

	@Override
	public List<buyListVO> buyList24(String id) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".buyList24", id);
	}

	@Override
	public void refundInsert(int num, String content, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buynum", num);
		map.put("content", content);
		map.put("id", id);
		session.insert(NS+".refundInsert", map);
	}

	@Override
	public memberVO getSex(String id) {
		System.out.println(id);
		return session.selectOne(NS+".getSex", id);
	}

	@Override
	public void mancount(int gdnum) {
		session.update(NS+".mancount", gdnum);
	}

	@Override
	public void womancount(int gdnum) {
		session.update(NS+".womancount", gdnum);
	}

	@Override
	public void totalAge(int age, int gdnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", gdnum);
		map.put("age", age);
		session.update(NS+".totalAge", map);
		
	}

	@Override
	public void profit(int gdnum) {
		session.update(NS+".profit", gdnum);
		
	}

	@Override
	public void sellCharge(int gdnum) {
		session.update(NS+".sellCharge", gdnum);
		
	}

	@Override
	public List<gameVO> subComp(String writer) {
		return session.selectList(NS+".subComp", writer);
		
	}

	@Override
	public void refundDelete(int num, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		System.out.println(map);
		session.delete(NS+".refundDelete", map);
		
	}
	
}
