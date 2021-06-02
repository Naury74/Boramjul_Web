package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcService {

	public List<QnADTO> QnAlist();
	public QnADTO detailProduct(int qnanum);
}
