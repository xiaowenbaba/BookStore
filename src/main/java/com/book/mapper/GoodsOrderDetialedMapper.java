package com.book.mapper;

import java.util.List;

import com.book.dto.Common;
import com.book.dto.GoodsOrderDetialed;

public interface GoodsOrderDetialedMapper {
	int  insertDetial(GoodsOrderDetialed detialed);
	List<Common> selectByOrderId(GoodsOrderDetialed detialed);
}
