package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class QnADTO {
	private int qnanum;
	private String name;
	private String content;
	private String kind;
	private String id;
	private Date qnadate;

}
