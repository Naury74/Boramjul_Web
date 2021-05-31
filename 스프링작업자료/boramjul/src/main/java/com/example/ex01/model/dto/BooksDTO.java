package com.example.ex01.model.dto;

import lombok.Data;

@Data
public class BooksDTO {
	private String search;
	private String prodname;
	private int price;
	private int quantity;
	private String content;
	private String image;
	private String category;
	private int prodnum;
}
