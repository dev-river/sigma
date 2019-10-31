package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.gameDetailDcVO;
import kr.co.domain.gameDetailFileVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.domain.refundVO;
import kr.co.persistence.compDAO;

@Service
@Transactional
public class compServiceImpl implements compService{

	@Inject
	private compDAO dao;

	@Override
	public memberVO read(String id) {
		return dao.read(id);
	}

	@Override
	public void update(memberVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public List<gameVO> gamelist(String writer) {
		return dao.gamelist(writer);
	}

	@Override
	public void gameinsert(gameVO vo) {
		dao.gameinsert(vo);
		
	}

	@Override
	public int count(String id) {
		return dao.count(id);
	}

	@Override
	public List<refundVO> refundList(String id) {
		return dao.refundList(id);
	}

	@Override
	public List<gameDetailDcVO> gameDetailDC(String writer) {
		return dao.gameDetailDC(writer);
	}
	
	@Override
	public void refundOK(int num) {
		dao.refundOK(num);
	}
	
	@Override
	public void refundReject(Map<String, Object> map) {
		dao.refundReject(map);
	}

	@Override
	public void returncash(Map<String, Object> map2) {
		dao.returncash(map2);
	}

	@Override
	public void giveback1(Map<String, Object> map1) {
		dao.giveback1(map1);
	}

	@Override
	public void givemoney() {
		dao.givemoney();
	}

	@Override
	public void sellermoney(gameVO vo) {
		dao.sellermoney(vo);
	}

	@Override
	public void giveback2(int buynum) {
		dao.giveback2(buynum);
	}

	@Override
	public int seachcash(String writer) {
		return dao.seachcash(writer);
	}
	
	@Override
	public refundVO refundRead(Map<String, Object> map) {
		return dao.refundRead(map);
	}

	@Override
	public int datalist(String writer) {
		return dao.datalist(writer);
	}

	@Override
	public int datalist1(String writer) {
		return dao.datalist1(writer);
	}

	@Override
	public gameVO titlecheck(String title) {
		return dao.titlecheck(title);
	}

	@Override
	public int checknum(gameVO vo) {
		return dao.checknum(vo);
	}

	@Override
	public void gameimg(List list, int gdnum) {
		dao.gameimg(list, gdnum);
	}

	@Override
	public int mancount(String writer) {
		return dao.mancount(writer);
	}

	@Override
	public int womancount(String writer) {
		return dao.womancount(writer);
	}

	@Override
	public int age10() {
		return dao.age10();
	}
	
	@Override
	public int age20() {
		return dao.age20();
	}
	
	@Override
	public int age30() {
		return dao.age30();
	}
	
	@Override
	public int age40() {
		return dao.age40();
	}
}