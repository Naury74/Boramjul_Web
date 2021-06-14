package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcDAO {
	
	//qna 조회
	public List<QnADTO> QnAlist();
	
	//qna글 상세 조회
	public QnADTO detailProduct(int qnanum);
}
