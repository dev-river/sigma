package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO mdao;

	@Override
	public List<MemberVO> hlist() {
		return mdao.hlist();
	}
}
