package com.example.ex01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.QnADTO;

@Repository
public class EtcDAOImpl implements EtcDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void QnA_insert(QnADTO dto) {
		sqlSession.insert("mysqlEtc.QnA_insert",dto);
	}

	@Override
	public List<QnADTO> QnAlist() {
		return sqlSession.selectList("mysqlEtc.QnAlist");
	}
	@Override
	public QnADTO detailProduct(String name) {
		return sqlSession.selectOne("mysqlEtc.detailProduct", name);
	}

}
