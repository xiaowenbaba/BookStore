package com.book.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.Common;
import com.book.dto.ShoppingCar;
import com.book.dto.Users;
import com.book.mapper.ShoppingCarMapper;
import com.book.service.ShoppingCarService;
@Service
public class ShoppingCarServiceImpl implements ShoppingCarService {
	
	
	@Autowired
	private ShoppingCarMapper shoppingCarMapper;

	@Override
	public int insertShoppingCar(ShoppingCar shoppingCar) {
		return shoppingCarMapper.insertShoppingCar(shoppingCar);
	}

	@Override
	public int updateShoppingCar(ShoppingCar shoppingCar) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.updateShoppingCar(shoppingCar);
	}

	@Override
	public ShoppingCar selectById(ShoppingCar shoppingCar) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.selectById(shoppingCar);
	}

	@Override
	public List<ShoppingCar> selectByUser(Users user) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.selectByUser(user);
	}

	@Override
	public List<Common> selectMassageByPage(HashMap<String, Object> parameter) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.selectMassageByPage(parameter);
	}

	@Override
	public int delectById(ShoppingCar shoppingCar) {
		// TODO Auto-generated method stub
		return  shoppingCarMapper.delectById(shoppingCar);
	}

	@Override
	public int delectByUser(ShoppingCar shoppingCar) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.delectByUser(shoppingCar);
	}

	@Override
	public Integer selectCount(ShoppingCar shoppingCar) {
		// TODO Auto-generated method stub
		return shoppingCarMapper.selectCount(shoppingCar);
	}

	
	
}
