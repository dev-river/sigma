package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.boardVO;
import kr.co.persistence.boardDAO;

@Service
@Transactional
public class boardServiceImpl implements boardService{
	@Inject
	private boardDAO bdao;

	@Override
	public List<boardVO> boardFRList() {
		return bdao.boardFRList();
	}
	
	
}
