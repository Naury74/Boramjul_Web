package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcDAO {
	public void QnA_insert(QnADTO dto);
	public List<QnADTO> QnAlist();
	public QnADTO detailProduct(int qnanum);
}
