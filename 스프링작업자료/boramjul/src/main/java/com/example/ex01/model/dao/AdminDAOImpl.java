package com.example.ex01.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.QnADTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public boolean check_passwd(String id, String passwd) {
		boolean result = false;
		
		// mybatis에 2개이상 인자를 사용 할 수 없으므로 이경우는 dto or Map활용
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("passwd", passwd);
		
		int count = sqlSession.selectOne("mysqlAdmin.check_passwd", map);
		// 1이면 true, 0이면 false	
		if (count == 1) 
			result =  true;
		
		return result;
	}

	@Override
	public String loginCheck(AdminDTO dto) {
		return sqlSession.selectOne("mysqlAdmin.loginCheck",dto);
	}
	
	@Override
	public void QnA_insert(QnADTO dto) {
		sqlSession.insert("mysqlAdmin.QnA_insert",dto);
	}

	@Override
	public void QnA_delete(int cartnum) {
		sqlSession.delete("mysqlAdmin.QnA_delete", cartnum);
	}

	@Override
	public void QnA_update(QnADTO dto) {
		sqlSession.update("mysqlAdmin.QnA_update", dto);
	}

	@Override
	public void prod_insert(BooksDTO dto) {
		sqlSession.insert("mysqlProduct.prod_insert", dto);
	}

	@Override
	public void order_now(CartDTO dto) {
		sqlSession.insert("mysqlCart.order_now", dto);
	}

	@Override
	public boolean prodname_list(String prodname) {
		boolean result = false;
		
		int count = sqlSession.selectOne("mysqlProduct.prodname_list", prodname);
		// 1이면 true, 0이면 false	
		if (count == 1) 
			result =  true;
		
		return result;
	}

	@Override
	public BooksDTO prodnum_list(int prodnum) {
		return sqlSession.selectOne("mysqlProduct.prodnum_list",prodnum);
	}

	@Override
	public int name_list(String prodname) {
		return sqlSession.selectOne("mysqlProduct.name_list", prodname);
	}



}
