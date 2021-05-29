package com.example.ex01.model.dao;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.QnADTO;

public interface AdminDAO {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto);
	void QnA_delete(int cartnum);
	void QnA_update(QnADTO dto);

}
