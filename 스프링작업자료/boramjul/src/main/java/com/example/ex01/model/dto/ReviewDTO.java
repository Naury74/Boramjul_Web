package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int renum;
	private int prodnum;
	private String prodname;
	private String image;
	private String content;
	private int price;
	
	private String email;
	private String rename;
	private int lookup;
	private String recontent;
	private int recom;
	private int comnum;
	private int comscore;
	private int grade;
	private Date redate;
}
