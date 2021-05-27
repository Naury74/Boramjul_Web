package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDetailDTO {
	
	private int detailnum;
	private int cartnum;
	private String prodnum;
	private String name;
	private String image;
	private int quantity;
	private int price;
	private int totalprice;
	private int review;
	private int delivery;
	private Date indate;

}
