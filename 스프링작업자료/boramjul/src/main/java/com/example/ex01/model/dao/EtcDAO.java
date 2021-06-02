package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcDAO {
	public List<QnADTO> QnAlist();
	public QnADTO detailProduct(int qnanum);
}
