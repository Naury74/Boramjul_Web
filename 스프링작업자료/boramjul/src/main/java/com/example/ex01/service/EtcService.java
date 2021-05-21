package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.QnADTO;

public interface EtcService {
	public void QnA_insert(QnADTO dto);
	public List<QnADTO> QnAlist();
}
