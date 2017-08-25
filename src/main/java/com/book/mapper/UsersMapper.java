package com.book.mapper;

import java.util.HashMap;
import java.util.List;

import com.book.dto.Common;
import com.book.dto.UserInformation;
import com.book.dto.Users;
import com.book.dto.UsersBackstage;

public interface UsersMapper {	
	int registerUser(Users user);
	Users loginUser(Users user);
	int updateState(Users user );
	Users selectByName(Users user);
	Integer selectNextId();
	int insertUserInfo(Integer id);
	Common selectUserInfo(Integer id);
	int updateUserInfoMessage(UserInformation information);
	int updatePassword(Users user);
	UsersBackstage loginBack(UsersBackstage backstage);
	List<Common> BackselectByPage(HashMap<String, Object> map);
}
