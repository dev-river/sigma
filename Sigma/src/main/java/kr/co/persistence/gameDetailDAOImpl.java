package kr.co.persistence;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.gameVO;


@Repository
public class gameDetailDAOImpl implements gameDetailDAO{
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.gameInform";
	
	@Override
	public List<gameVO> list(String category) {
		return session.selectList(NS+".list", category);
	}
	
	
}