package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.SPageTO;
import kr.co.domain.gameVO;

@Repository
public class recommnadDAOImpl implements recommandDAO{

	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.recommand";
	
	@Override
	public int getNewGameAmount() {
		return session.selectOne(NS+".getNewGameAmount");
	}

	@Override
	public List<gameVO> getNewGameList(SPageTO to) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", to.getStartNum());
		map.put("endNum", to.getEndNum());
		
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		return session.selectList(NS+".getNewGameList", map);
	}

	@Override
	public int getFreeGameAmount() {
		return session.selectOne(NS+".getFreeGameAmount");
	}

	@Override
	public List<gameVO> getFreeGameList(SPageTO to) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", to.getStartNum());
		map.put("endNum", to.getEndNum());
		
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		return session.selectList(NS+".getFreeGameList", map);
	}

	@Override
	public int getDcGameAmount() {
		return session.selectOne(NS+".getDcGameAmount");
	}

	@Override
	public List<gameVO> getDcGameList(SPageTO to) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", to.getStartNum());
		map.put("endNum", to.getEndNum());
		
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		return session.selectList(NS+".getDcGameList", map);
	}

	@Override
	public List<gameVO> getHotGameList(SPageTO to) {
		return session.selectList(NS+".getHotGameList");
	}

	@Override
	public int getcustomRecAmount() {
		return session.selectOne(NS+".getcustomRecAmount");
	}
	
	@Override
	public String getcategory(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getcategory", id);
	}
	
	@Override
	public List<gameVO> customRec(SPageTO to, String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", to.getStartNum());
		map.put("endNum", to.getEndNum());
		
		map.put("keyword", to.getKeyword());
		map.put("searchType", to.getSearchType());
		map.put("category", category);
		return session.selectList(NS+".getcustoRecList", map);
	}

	@Override
	public List<gameVO> getHotGameList() {
		return session.selectList(NS+".getHotGameList");
	}

	@Override
	public List<gameVO> getNewGameList() {
		return session.selectList(NS+".NewGameList");
	}

	@Override
	public List<gameVO> getDcGameList() {
		return session.selectList(NS+".DCGameList");
	}

	

	


	
	

}
