package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.EtcDAO;
import com.example.ex01.model.dto.QnADTO;

@Service
public class EtcServiceImpl implements EtcService {
	
	@Inject
	EtcDAO etcDao;
	

	@Override
	public List<QnADTO> QnAlist() {
		return etcDao.QnAlist();
	}
	
	@Override
	public QnADTO detailProduct(int qnanum) {
		return etcDao.detailProduct(qnanum);
	}

}
