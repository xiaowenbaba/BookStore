package com.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.book.dto.Common;
import com.book.dto.GoodsOrderDetialed;
import com.book.mapper.GoodsOrderDetialedMapper;
import com.book.service.GoodsOrderDetialedService;
@Service
public class GoodsOrderDetialedServiceImpl implements GoodsOrderDetialedService {

	@Autowired
	private GoodsOrderDetialedMapper maper;

	@Override
	public int insertDetial(GoodsOrderDetialed detialed) {
		// TODO Auto-generated method stub
		return maper.insertDetial(detialed);
	}

	@Override
	public List<Common> selectByOrderId(GoodsOrderDetialed detialed) {
		// TODO Auto-generated method stub
		return maper.selectByOrderId(detialed);
	}
}
