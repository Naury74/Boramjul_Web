package com.example.ex01.model.dto;

import lombok.Data;

@Data
public class CartDTO {
	private int cartnum;
	private String email;
	private int prodnum;
	private String name;
	private String image;
	private int quantity;
	private int result;
	private int price;
	private int totalprice;
	private int cart_tot;

}
