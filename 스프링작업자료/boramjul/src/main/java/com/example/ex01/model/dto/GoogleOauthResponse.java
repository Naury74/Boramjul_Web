package com.example.ex01.model.dto;

import lombok.Data;

@Data
public class GoogleOauthResponse {
	private String accessToken;
	private String expiresIn;
	private String refreshToken;
	private String scope;
	private String tokenType;
	private String idToken;
}
