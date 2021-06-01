package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailDTO {
	private String email;
	private int detailnum;
	private int cartnum;
	private int prodnum;
	private String prodname;
	private String image;
	private int quantity;
	private int price;
	private int totalprice;
	private int review;
	private int delivery;
	private Date indate;
	private int grade;

}
