package com.book.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.Common;
import com.book.dto.UserOrder;
import com.book.mapper.UserOrderMapper;
import com.book.service.UserOrderService;
@Service
public class UserOrderServiceImpl implements UserOrderService {
	@Autowired
	private UserOrderMapper mapper;

	@Override
	public Common selectCommonById(Common common) {
		// TODO Auto-generated method stub
		return mapper.selectCommonById(common);
	}

	@Override
	public int insertOrder(UserOrder order) {
		return mapper.insertOrder(order);
	}

	@Override
	public Integer selectNextId() {
		// TODO Auto-generated method stub
		return mapper.selectNextId();
	}

	@Override
	public int updateById(UserOrder order) {
		// TODO Auto-generated method stub
		return mapper.updateById(order);
	}

	@Override
	public List<UserOrder> selectByUser(UserOrder order) {
		// TODO Auto-generated method stub
		return mapper.selectByUser(order);
	}

	@Override
	public List<UserOrder> BackOrderByPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return mapper.BackOrderByPage(map);
	}
	
	
}
