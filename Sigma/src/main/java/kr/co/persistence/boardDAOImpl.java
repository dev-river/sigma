package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.boardVO;

@Repository
public class boardDAOImpl implements boardDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.board";
	
	@Override
	public List<boardVO> boardFRList() {
		return session.selectList(NS+".FRlist");
	}
	
	
}
