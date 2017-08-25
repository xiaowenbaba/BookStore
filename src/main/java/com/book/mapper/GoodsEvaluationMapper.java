package com.book.mapper;

import java.util.HashMap;
import java.util.List;

import com.book.dto.GoodsEvaluation;

public interface GoodsEvaluationMapper {
	int insertBybook(GoodsEvaluation evaluation);
	GoodsEvaluation selectByUser(GoodsEvaluation evaluation);
	List<GoodsEvaluation> selectEvaluationByPage(HashMap<String , Object> map);
	int delectByid(GoodsEvaluation evaluation);
}
