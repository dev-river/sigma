package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.domain.PageTO;
import kr.co.domain.SPageTO;
import kr.co.domain.adminSetVO;
import kr.co.domain.adminSlideVO;
import kr.co.domain.gameVO;
import kr.co.domain.memberVO;

public interface recommandService {

	SPageTO newgameRec(SPageTO to);

	SPageTO freegameRec(SPageTO to);

	SPageTO dcgameRec(SPageTO to);

	SPageTO hotgameRec(SPageTO to);

	SPageTO customRec(SPageTO to, String id);

}
