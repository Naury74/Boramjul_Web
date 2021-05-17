package com.example.ex01.model.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Data;

@Data
@JsonInclude
public class MemberDTO {
	private String email;
	private String passwd;
	private String name;
	private String phone;
	private int sns;
	private String birth;
	private String address;
	private int rank;
	private int totalprice;
	private int reserves;
	private Date joindate;
}

