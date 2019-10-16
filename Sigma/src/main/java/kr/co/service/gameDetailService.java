package kr.co.service;

import java.util.List;

import kr.co.domain.gameVO;

public interface gameDetailService {

	List<gameVO> list(String category);

}
