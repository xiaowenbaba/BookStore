package com.book.service;

import java.util.List;

import com.book.dto.Common;
import com.book.dto.GoodsOrderDetialed;

public interface GoodsOrderDetialedService {
	int  insertDetial(GoodsOrderDetialed detialed);
	List<Common> selectByOrderId(GoodsOrderDetialed detialed);
}
