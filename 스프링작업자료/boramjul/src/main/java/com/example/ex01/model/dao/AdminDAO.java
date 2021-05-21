package com.example.ex01.model.dao;

import com.example.ex01.model.dto.AdminDTO;

public interface AdminDAO {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto);

}
