package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int comidx;
	private String email;
	private int renum;
	private String comcontent;
	private Date notidate;

}
