package com.book.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.dto.BookType;
import com.book.dto.Common;
import com.book.dto.GoodsOrderDetialed;
import com.book.dto.Page;
import com.book.dto.UserOrder;
import com.book.service.GoodsOrderDetialedService;
import com.book.service.UserOrderService;

@Controller
@RequestMapping("/back")
public class BackUserOrderController {
	
	@Autowired
	private UserOrderService orderService;
	
	@Autowired
	private GoodsOrderDetialedService detialed;
	
	@RequestMapping("/userOrderQuery")
	public String  userOrderQuery(
			
			@RequestParam(name = "orderId",required = false) Integer orderId,
			@RequestParam(name = "orderState",required = false) String orderState,
			@RequestParam(name = "currentPage" ,required = false) Integer currentPage,
			Model model
			){
		
		UserOrder userOrder = new UserOrder();
		if(orderId!=null){
			userOrder.setOrderId(orderId);
			model.addAttribute("orderId", orderId);
		}
		if(orderState!=null&&!"".equals(orderState)){
			userOrder.setOrderState(orderState);
			model.addAttribute("orderState", orderState);
		}
		
		HashMap< String, Object> map = new HashMap<>();
		Page<UserOrder> page = new Page();
		
		int currentPage1=1;
		if(currentPage!=null){
			currentPage1=currentPage;
			page.setCurrentPage(currentPage1);
		}else {
			page.setCurrentPage(currentPage1);
		}
		System.out.println(userOrder);
		System.out.println(currentPage);
		page.setPageNumber(5);
		
		map.put("userOrder", userOrder);
		
		
		map.put("page", page);
		 
		List<UserOrder> list=orderService.BackOrderByPage(map);
		page.setData(list);
		
		model.addAttribute("page", page);
		
		return "backOrderQuery";
	}
	
	
	@SuppressWarnings("finally")
	@RequestMapping("/updateOrderState")
	@ResponseBody
	public String  updateOrderState(@RequestParam(name = "orderId",required = false) Integer orderId,
			@RequestParam(name = "orderState",required = false) String orderState){
		
		UserOrder order = new UserOrder();
		order.setOrderId(orderId);
		order.setOrderState(orderState);
		
		String MSG="更新状态失败！";
		try {
			int i =orderService.updateById(order);
			MSG="更新状态成功！";
			if(i>0){
				return MSG;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return MSG;
		}
		
	}


	@RequestMapping("/orderDetialed")
	public String entryDetialed(@RequestParam(name = "id",required = false) Integer id,Model model){
		GoodsOrderDetialed detialed1 = new GoodsOrderDetialed();
		detialed1.setOrderId(id);
		List<Common> list=detialed.selectByOrderId(detialed1);
		if(list!=null){
			model.addAttribute("list", list);
			return "backOrderdetailed";
		}
		return "exception";
	}	
	
	
	
	
}
