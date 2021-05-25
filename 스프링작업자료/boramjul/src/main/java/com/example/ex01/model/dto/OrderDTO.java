package com.example.ex01.model.dto;

import lombok.Data;

@Data
public class OrderDTO {
	private int detailnum;
	private int cartnum;
	private String email;
	private int totalprice;
	private int saleprice;
	private int usereserves;
	private int payprice;
	private int addreserves;
	private int result;
	private String pay;
	private String address;
	private int delivery;
	private String request;

}
