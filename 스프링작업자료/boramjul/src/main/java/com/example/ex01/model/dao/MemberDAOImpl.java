package com.example.ex01.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public List<MemberDAO> list() {
		return sqlSession.selectList("mysqlMember.list");
	}

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert("mysqlMember.insert",dto);
	}

	@Override
	public MemberDTO myInfo(String email) {
		return sqlSession.selectOne("mysqlMember.myInfo",email);
	}

	@Override
	public void delete(String email) {
		sqlSession.delete("mysqlMember.delete",email);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update("mysqlMember.update",dto);
	}

	@Override
	public MemberDTO findemail(String phone) {
		return sqlSession.selectOne("mysqlMember.findemail",phone);
	}
	
	@Override
	public MemberDTO findpwd(String email) {
		return sqlSession.selectOne("mysqlMember.findpwd",email);
	}
	
	@Override
	public boolean check_passwd(String email, String passwd) {
		
		boolean result = false;
		
		// mybatis에 2개이상 인자를 사용 할 수 없으므로 이경우는 dto or Map활용
		Map<String,String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", passwd);
		
		// 아래와 같이 사용 할 수 없음
		//int count = sqlSession.selectOne("member.check_passwd", userid, passwd);
		
		int count = sqlSession.selectOne("mysqlMember.check_passwd", map);
		// 1이면 true, 0이면 false	
		if (count == 1) 
			result =  true;
		
		return result;
	}
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("mysqlMember.loginCheck",dto);
	}

}
