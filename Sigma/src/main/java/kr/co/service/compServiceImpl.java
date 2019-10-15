package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
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
}