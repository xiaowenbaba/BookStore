package com.book.service;

import java.util.HashMap;
import java.util.List;

import com.book.dto.Common;
import com.book.dto.UserOrder;

public interface UserOrderService {
	Common selectCommonById(Common common);
	int insertOrder(UserOrder order);
	Integer selectNextId();
	int updateById(UserOrder order);
	List<UserOrder>selectByUser(UserOrder order);
	List<UserOrder> BackOrderByPage(HashMap<String ,Object > map) ;
}

