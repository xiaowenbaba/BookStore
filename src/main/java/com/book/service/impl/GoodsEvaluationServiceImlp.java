package com.book.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.GoodsEvaluation;
import com.book.mapper.GoodsEvaluationMapper;
import com.book.service.GoodsEvaluationService;
@Service
public class GoodsEvaluationServiceImlp implements GoodsEvaluationService {
	@Autowired
	private GoodsEvaluationMapper goodsEvaluationMapper;
	@Override
	public int insertBybook(GoodsEvaluation evaluation) {
		// TODO Auto-generated method stub
		return goodsEvaluationMapper.insertBybook(evaluation);
	}
	@Override
	public GoodsEvaluation selectByUser(GoodsEvaluation evaluation) {
		// TODO Auto-generated method stub
		return goodsEvaluationMapper.selectByUser(evaluation);
	}
	@Override
	public List<GoodsEvaluation> selectEvaluationByPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsEvaluationMapper.selectEvaluationByPage(map);
	}
	@Override
	public int delectByid(GoodsEvaluation evaluation) {
		// TODO Auto-generated method stub
		return goodsEvaluationMapper.delectByid(evaluation);
	}


}
