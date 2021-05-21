package com.example.ex01.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ProductDTO {
	private String search;
	private String name;
	private String price;
	private String content;
	private String image;

}
