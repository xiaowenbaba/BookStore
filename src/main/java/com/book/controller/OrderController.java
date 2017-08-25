package com.book.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.book.dto.AddressInformation;
import com.book.dto.BookInformation;
import com.book.dto.Common;
import com.book.dto.GoodsOrderDetialed;
import com.book.dto.ShoppingCar;
import com.book.dto.UserOrder;
import com.book.dto.Users;
import com.book.service.AddressInformationService;
import com.book.service.BookInformationService;
import com.book.service.GoodsOrderDetialedService;
import com.book.service.ShoppingCarService;
import com.book.service.UserOrderService;

@Controller
@RequestMapping("/Order")
public class OrderController {
	@Autowired
	private UserOrderService orderService;

	@Autowired
	private AddressInformationService add;
	
	@Autowired
	private GoodsOrderDetialedService detialed;
	
	@Autowired
	private ShoppingCarService shoppingcar;
	
	@RequestMapping("/create")
	public String createOrder(
			@RequestParam(name = "bookId",required = false) Integer [] bookId,
			@RequestParam(name = "goodsNo",required = false) Integer [] goodsNo,
			@RequestParam(name = "totalMoney",required = false) Integer totalMoney,
			Model model,HttpSession session) {
		List<Common> list = new ArrayList<Common>();
		Users user=(Users)session.getAttribute("user");
		Common common = new Common();
		for(int i = 0 ;i<bookId.length;i++){
			System.out.println(bookId[i]);
			common.setBookId(bookId[i]);
			System.out.println(goodsNo[i]);
			Common	common1=orderService.selectCommonById(common);
			common1.setCarNo(goodsNo[i]);
			list.add(common1);
		}
		System.out.println("用户ID为"+user.getUserId());
		AddressInformation addressInformation = new AddressInformation();
		addressInformation.setUserId(user.getUserId());
		List<Common> addList=add.selectAddress(addressInformation);
		model.addAttribute("list",list);
		System.out.println(addList);
		model.addAttribute("addList",addList);
		System.out.println(list);
		model.addAttribute("totalnum", list.size());
		model.addAttribute("totalMoney", totalMoney);
		return "createOrder";
	}
	
	@RequestMapping("/submit")
	public String submitOrder(@RequestParam(name = "bookId",required = false) Integer [] bookId,
			@RequestParam(name = "carNo",required = false) Integer [] carNo,
			@RequestParam(name = "totalMoney",required = false) Integer totalMoney,
			@RequestParam(name = "goodsName",required = false) String name,
			@RequestParam(name = "bookSelling",required = false) Integer [] bookSelling,
			@RequestParam(name = "detaAddress",required = false) String detaAddress,
			@RequestParam(name = "goodsTel",required = false) String goodsTel,
			@RequestParam(name = "totalnum",required = false) Integer totalnum,
			Model model,HttpSession session
			){
		Users user =(Users)session.getAttribute("user");
		UserOrder order = new UserOrder();
		List<GoodsOrderDetialed> list  = new ArrayList<GoodsOrderDetialed>();
		order.setGoodsNo(totalnum);
		order.setName(name);
		order.setOrderAddress(detaAddress);
		order.setTel(goodsTel);
		order.setTotalMoney(totalMoney);
		order.setUserId(user.getUserId());
		int i =orderService.insertOrder(order);
		if(i>0){
			Integer id =orderService.selectNextId();
			ShoppingCar shoppingCar1 = new ShoppingCar();
			shoppingCar1.setUserId(user.getUserId());
			for(int j=0;j<bookId.length;j++){
				GoodsOrderDetialed detialed1 = new GoodsOrderDetialed();
				detialed1.setOrderId(id);
				detialed1.setBookId(bookId[j]);
				detialed1.setOrderNum(carNo[j]);
				detialed1.setPrice(bookSelling[j]);
				int result=detialed.insertDetial(detialed1);
				ShoppingCar car = new ShoppingCar();
				car.setBookId(bookId[j]);
				car.setUserId(user.getUserId());
				int k=shoppingcar.delectByUser(car);
				if(result>0){
					System.out.println("插入明细表成功！");
				}
				if(k>0){
					System.out.println("清除购物成功！");
				}
			}
			
			Integer num=shoppingcar.selectCount(shoppingCar1);
			session.setAttribute("totalNumber",num);
			model.addAttribute("id", id);
			return "orderPay";
		}
		return "exception";
	}
	@RequestMapping("entryPay")
	public String entryPay(@RequestParam(name = "id",required = false) Integer id,Model model){
		model.addAttribute("id", id);	
		return "orderPay";
	}
	
	@RequestMapping("/pay")
	public String pay(@RequestParam(name = "id",required = false) Integer id,Model model){
		UserOrder order = new UserOrder();
		order.setOrderId(id);
		order.setOrderState("已付款，正在派送！");
		int i =orderService.updateById(order);
		if(i>0){
			model.addAttribute("id", order.getOrderId());
			 return "successPay";
		}
		return"exception";
	}
	
	@RequestMapping("/entry")
	public String entryOrder(HttpSession session,Model model){
		Users user=(Users)session.getAttribute("user");
		UserOrder order = new UserOrder();
		order.setUserId(user.getUserId());
		List<UserOrder> list=orderService.selectByUser(order);
		if(list!=null){
			model.addAttribute("list", list);
			return "orderManager";
		}
		return "exception";
	}
	@RequestMapping("detialed")
	public String entryDetialed(@RequestParam(name = "id",required = false) Integer id,Model model){
		GoodsOrderDetialed detialed1 = new GoodsOrderDetialed();
		detialed1.setOrderId(id);
		List<Common> list=detialed.selectByOrderId(detialed1);
		if(list!=null){
			model.addAttribute("list", list);
			return "orderList";
		}
		return "exception";
	}
}
