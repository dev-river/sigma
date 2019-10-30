package kr.co.persistence;

import java.util.List;
import java.util.Map;

import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;

public interface recommandDAO {

	int getNewGameAmount();

	List<gameVO> getNewGameList(SPageTO to);

	int getFreeGameAmount();

	List<gameVO> getFreeGameList(SPageTO to);

	int getDcGameAmount();

	List<gameVO> getDcGameList(SPageTO to);

	List<gameVO> getHotGameList(SPageTO to);

	int getcustomRecAmount();
	
	List<gameVO> customRec(SPageTO to, String category);

	String getcategory(String id);
}
