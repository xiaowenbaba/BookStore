package com.book.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.Common;
import com.book.dto.UserInformation;
import com.book.dto.Users;
import com.book.dto.UsersBackstage;
import com.book.mapper.UsersMapper;
import com.book.service.UsersService;

@Service
public class UsersServiceImpl  implements UsersService{
	@Autowired
	private UsersMapper usersMapper;

	@Override
	public int registerUser(Users user) {
		return	usersMapper.registerUser(user);
		
	}

	@Override
	public Users loginUser(Users user) {
		
		return usersMapper.loginUser(user);
	}

	@Override
	public int loginOut(Users user) {
		
		return usersMapper.updateState(user);
	}

	@Override
	public int updateState(Users user) {
		// TODO Auto-generated method stub
		return usersMapper.updateState(user);
	}

	@Override
	public Users selectByName(Users user) {
		// TODO Auto-generated method stub
		return usersMapper.selectByName(user);
	}

	@Override
	public Integer selectNextId() {
		// TODO Auto-generated method stub
		return usersMapper.selectNextId();
	}

	@Override
	public int insertUserInfo(Integer id) {
		// TODO Auto-generated method stub
		return usersMapper.insertUserInfo(id);
	}

	@Override
	public Common selectUserInfo(Integer id) {
		// TODO Auto-generated method stub
		return usersMapper.selectUserInfo(id);
	}

	@Override
	public int updateUserInfoMessage(UserInformation information) {
		// TODO Auto-generated method stub
		return usersMapper.updateUserInfoMessage(information);
	}

	@Override
	public int updatePassword(Users user) {
		// TODO Auto-generated method stub
		return usersMapper.updatePassword(user);
	}

	@Override
	public UsersBackstage loginBack(UsersBackstage backstage) {
		// TODO Auto-generated method stub
		return usersMapper.loginBack(backstage);
	}

	@Override
	public List<Common> BackselectByPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return usersMapper.BackselectByPage(map);
	}
	
	
	
}
