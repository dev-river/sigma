package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.boardVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;
import kr.co.persistence.adminDAO;
import kr.co.persistence.boardDAO;
import kr.co.persistence.gameDetailDAO;
import kr.co.persistence.recommandDAO;

@Service
@Transactional
public class recommandServiceImpl implements recommandService{
	@Inject
	private recommandDAO rdao;

	@Override
	public SPageTO newgameRec(SPageTO to) {
		int amount = rdao.getNewGameAmount();
		to.setAmount(amount);
		List<gameVO> list = rdao.getNewGameList(to);
		to.setList(list);
		return to;
	}
	@Override
	public SPageTO freegameRec(SPageTO to) {
		int amount = rdao.getFreeGameAmount();
		to.setAmount(amount);
		List<gameVO> list = rdao.getFreeGameList(to);
		to.setList(list);
		return to;
	}
	@Override
	public SPageTO dcgameRec(SPageTO to) {
		int amount = rdao.getDcGameAmount();
		to.setAmount(amount);
		List<gameVO> list = rdao.getDcGameList(to);
		to.setList(list);
		return to;
	}
	@Override
	public SPageTO hotgameRec(SPageTO to) {
		List<gameVO> list = rdao.getHotGameList(to);
		to.setList(list);
		return to;
	}
	@Override
	public SPageTO customRec(SPageTO to, String id) {
		int amount = rdao.getcustomRecAmount();
		to.setAmount(amount);
		String category = rdao.getcategory(id);
		List<gameVO> list = rdao.customRec(to, category);
		to.setList(list);
		return to;
	}



}
