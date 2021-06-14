package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcService {

	//qna 조회
	public List<QnADTO> QnAlist();
	
	//qna글 상세 조회
	public QnADTO detailProduct(int qnanum);
}
