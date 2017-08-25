package com.book.mapper;

import java.util.HashMap;
import java.util.List;

import com.book.dto.Common;
import com.book.dto.Page;
import com.book.dto.ShoppingCar;
import com.book.dto.Users;

public interface ShoppingCarMapper {
	 int insertShoppingCar(ShoppingCar shoppingCar);
	 int updateShoppingCar(ShoppingCar shoppingCar);
	 ShoppingCar  selectById(ShoppingCar shoppingCar);
	 List<ShoppingCar> selectByUser(Users user);
	 List<Common> selectMassageByPage(HashMap<String , Object> parameter);
	 int delectById(ShoppingCar shoppingCar);
	 int delectByUser(ShoppingCar shoppingCar);
	 Integer selectCount(ShoppingCar shoppingCar);
}
