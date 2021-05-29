package com.example.ex01.model.dao;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.QnADTO;

public interface AdminDAO {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto);
	void QnA_delete(int cartnum);
	void QnA_update(QnADTO dto);
	
	public void prod_insert(BooksDTO dto);
	public void order_now(CartDTO dto);

}
