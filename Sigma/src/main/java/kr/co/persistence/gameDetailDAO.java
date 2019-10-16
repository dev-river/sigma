package kr.co.persistence;

import java.util.List;

import kr.co.domain.gameVO;

public interface gameDetailDAO {

	List<gameVO> list(String category);

	gameVO read(int num);

	List<String> filepath(int num);

}
