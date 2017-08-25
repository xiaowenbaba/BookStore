package com.book.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.dto.GoodsEvaluation;
import com.book.dto.Page;
import com.book.dto.Users;
import com.book.service.GoodsEvaluationService;

@Controller
@RequestMapping("/evaluation")
public class GoodsEvaluationController {
	
	@Autowired
	private GoodsEvaluationService evaluationService;
	
	@RequestMapping("/add")
	public String addBook(@RequestParam(name="id",required=false) Integer id,HttpSession session){
		Users user =(Users)session.getAttribute("user");
		GoodsEvaluation evaluation = new GoodsEvaluation();
		evaluation.setBookId(id);
		evaluation.setUserId(user.getUserId());
		GoodsEvaluation goodsEvaluation=evaluationService.selectByUser(evaluation);
		if(goodsEvaluation==null){
			evaluationService.insertBybook(evaluation);
				return "redirect:/evaluation/entry" ;
		}else{
			return "redirect:/evaluation/entry" ;
		}
	}
	@RequestMapping("/entry")
	public String entryMyEval(HttpSession session , Model model){
		Users user=(Users)session.getAttribute("user");
		HashMap<String , Object> map  = new HashMap<>();
		GoodsEvaluation evaluation = new GoodsEvaluation();
		evaluation.setUserId(user.getUserId());
		int current = 1;
		int pageSize= 10;
		Page<GoodsEvaluation> p = new Page<>();
		p.setCurrentPage(current);
		p.setPageNumber(pageSize);
		map.put("page",p);
		map.put("evaluation", evaluation);
		List<GoodsEvaluation> list=evaluationService.selectEvaluationByPage(map);
		p.setData(list);
		model.addAttribute("page", p);
		System.out.println(p);
		return "myGoods";
	}
	@RequestMapping("/deleteGoods")
	@ResponseBody
	public String deleteGoods(HttpSession session,@RequestParam(name="id",required=false) Integer id){
		GoodsEvaluation evaluation = new GoodsEvaluation();
		evaluation.setBookId(id);
		Users user=(Users)session.getAttribute("user");
		evaluation.setUserId(user.getUserId());
		
		
		String MSG="删除失败！";
		try {
			int i=evaluationService.delectByid(evaluation);
			MSG="删除成功！";
			if(i>0){
				return MSG;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return MSG;
		}
		
		
		
	}
}
