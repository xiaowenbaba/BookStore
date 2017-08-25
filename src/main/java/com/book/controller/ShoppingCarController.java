package com.book.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.dto.Common;
import com.book.dto.Page;
import com.book.dto.ShoppingCar;
import com.book.dto.Users;
import com.book.service.ShoppingCarService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
@RequestMapping(path="/shoppingCar")
public class ShoppingCarController {
	@Autowired
	private ShoppingCarService shoppingCarService;
	
	@RequestMapping("/insert")
	public String   insertShoppingCar(
			@RequestParam(name = "bookId",required = false) Integer bookId,
			@RequestParam(name = "carNo",required = false) Integer carNo,
			RedirectAttributes redirectAttributes,HttpSession session){
		ShoppingCar shoppingCar = new ShoppingCar();
		Users user=(Users)session.getAttribute("user");
		Integer userId=user.getUserId();
		if(userId!=null){
			shoppingCar.setUserId(userId);
		}
		if (bookId!=null) {
			shoppingCar.setBookId(bookId);
		}
		if(carNo!=null){
			shoppingCar.setCarNo(carNo);
		}
		
		ShoppingCar car=shoppingCarService.selectById(shoppingCar);
		if(car==null ||"".equals(car) ){
			int i =shoppingCarService.insertShoppingCar(shoppingCar);
			if(i>0){
				System.out.println("添加购物车成功！");
			}
			 return "redirect:/shoppingCar/entryCar";
		}else if(car!=null) {
			int num=car.getCarNo();
			num = num+shoppingCar.getCarNo();
			shoppingCar.setCarNo(num);
			int  i = shoppingCarService.updateShoppingCar(shoppingCar);
			System.out.println("更新购物车成功！");
			return "redirect:/shoppingCar/entryCar";
		}else {			
			return "exception";
		}
	}
	
	
	
	
	@RequestMapping("/entryCar")
	public String  entryShoppingCar(Model model,HttpSession session){
		Users user = (Users) session.getAttribute("user");
		int currentPage=1;
		int pageSise=10;
		Page<ShoppingCar> page = new Page<>();
		List<ShoppingCar> data=shoppingCarService.selectByUser(user);
		HashMap<String ,Object> parameter = new HashMap<>();
		if(data==null||"".equals(data)){
			int num = 0;
			session.setAttribute("totalNumber",num);
			return "shoppingCar";
		}else {
			page.setCurrentPage(currentPage);
			page.setPageNumber(pageSise);
			parameter.put("user", user);
			parameter.put("page", page);
			List<Common> list=shoppingCarService.selectMassageByPage(parameter);
			page.setData(list);
			session.setAttribute("totalNumber",page.getTotalNumber());
			model.addAttribute("page",page);
			System.out.println(list);
			System.out.println(page);
			return "shoppingCar";
		}
	}
	@RequestMapping("/update")
	@ResponseBody
	public String   updateShoppingCar(
			@RequestParam(name = "bookId",required = false) Integer bookId,
			@RequestParam(name = "carNo",required = false) Integer carNo,
			HttpSession session){
		ShoppingCar shoppingCar = new ShoppingCar();
		Users user=(Users)session.getAttribute("user");
		Integer userId=user.getUserId();
		if(userId!=null){
			shoppingCar.setUserId(userId);
		}
		if (bookId!=null) {
			shoppingCar.setBookId(bookId);
		}
		if(carNo!=null){
			shoppingCar.setCarNo(carNo);
		}
		
		int  i = shoppingCarService.updateShoppingCar(shoppingCar);
		if(i>0){
			return "更新成功";
			
		}else {
			return "更新失败！";
		}
	}
	@RequestMapping("/delete")
	public String deleteById(@RequestParam(name = "carId",required = false) Integer carId){
			
			ShoppingCar shoppingCar = new ShoppingCar();
			shoppingCar.setCarId(carId);
		int i =	shoppingCarService.delectById(shoppingCar);
		if(i>0){
			System.out.println("删除成功！");
			return"redirect:/shoppingCar/entryCar";
		}
		return null;
	}
}
