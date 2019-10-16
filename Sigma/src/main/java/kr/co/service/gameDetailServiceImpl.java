package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.domain.gameVO;
import kr.co.persistence.gameDetailDAO;

@Service
@Transactional
public class gameDetailServiceImpl implements gameDetailService{
	@Inject
	private gameDetailDAO gdao;

	@Override
	public List<gameVO> list(String category) {
		return gdao.list(category);
	}

	@Override
	public gameVO read(int num) {
		return gdao.read(num);
	}

	@Override
	public List<String> filepath(int num) {
		return gdao.filepath(num);
	}

	
}
