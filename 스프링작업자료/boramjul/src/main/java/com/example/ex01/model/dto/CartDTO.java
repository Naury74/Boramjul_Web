package com.example.ex01.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartDTO {
	private int cartnum;
	private String email;
	private String prodnum;
	private String name;
	private String image;
	private int quantity;
	private int result;
	private int price;
	private int sale;
	private int totalprice;
	private int cart_tot;
	private int ordernum;
	private Date regdate;
}
