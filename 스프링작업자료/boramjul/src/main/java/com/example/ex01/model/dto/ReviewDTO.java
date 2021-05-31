package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int renum;
	private int prodnum;
	private String image;
	private String email;
	private String rename;
	private String content;
	private int lookup;
	private int recom;
	private int comnum;
	private int comscore;
	private int grade;
	private Date redate;
}
