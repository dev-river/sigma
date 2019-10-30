package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.SPageTO;
import kr.co.domain.boardNGVO;
import kr.co.domain.boardVO;
import kr.co.persistence.sboardDAO;

@Service
@Transactional
public class sboardServiceImpl implements sboardService{
	
	@Inject
	private sboardDAO sdao;
	
	/* ================ 자유게시판 부분 =============== */
	
	@Override
	public SPageTO list(SPageTO sto) {
		
		int amount = sdao.amount(sto);
		sto.setAmount(amount);
		
		List<boardVO> list = sdao.list(sto);
		
		sto.setList(list);
		
		return sto;
	}

	@Override
	public int amount(SPageTO sto) {
		// TODO Auto-generated method stub
		return sdao.amount(sto);
	}

	@Override
	public boardVO read(int num) {
		// TODO Auto-generated method stub
		return sdao.read(num);
	}

	@Override
	public void del(int num) {
		// TODO Auto-generated method stub
		sdao.del(num);
		
	}

	@Override
	public boardVO updateUI(int num) {
		// TODO Auto-generated method stub
		return sdao.updateUI(num);
	}

	@Override
	public void update(boardVO vo) {
		// TODO Auto-generated method stub
		sdao.update(vo);
	}
	
	/* ================ 새게임소식 부분 =============== */
	
	@Override
	public SPageTO NGList(SPageTO sto) {
		
		int amount = sdao.NGamount(sto);
		sto.setAmount(amount);
		
		List<boardNGVO> list = sdao.NGList(sto);
		
		sto.setList(list);
		
		return sto;
	}

	@Override
	public boardNGVO NGRead(int num) {
		// TODO Auto-generated method stub
		return sdao.NGRead(num);
	}

	@Override
	public boardNGVO NGUpdateUI(int num) {
		// TODO Auto-generated method stub
		return sdao.NGUpdateUI(num);
	}

	@Override
	public void NGUpdate(boardNGVO vo) {
		// TODO Auto-generated method stub
		sdao.NGUpdate(vo);
	}

	@Override
	public int NGamount(SPageTO sto) {
		// TODO Auto-generated method stub
		return sdao.NGamount(sto);
	}
	

	

	
}
