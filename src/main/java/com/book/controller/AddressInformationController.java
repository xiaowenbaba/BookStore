package com.book.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.dto.AddressInformation;
import com.book.dto.Common;
import com.book.dto.Users;
import com.book.service.AddressInformationService;


@Controller
@RequestMapping("/address")
public class AddressInformationController {
	@Autowired
	private AddressInformationService addressInformationService;
	
	
	@RequestMapping("/insert")
	@ResponseBody
	public Common  insertAdd(
			@RequestParam (name="name",required=false) String name,
			@RequestParam (name="phone",required=false) String phone,
			@RequestParam (name="detialAdd",required=false) String detialAdd,
			@RequestParam (name="proviceVal",required=false) String proviceVal,
			@RequestParam (name="cityId",required=false) String cityId,
			@RequestParam (name="cityVal",required=false) String cityVal,
			@RequestParam (name="areaId",required=false) String areaId,
			@RequestParam (name="areaVal",required=false) String areaVal,
			@RequestParam (name="proviceId",required=false) String proviceId,
			@RequestParam (name="post",required=false) Integer post,
			HttpSession session
			){
			Users user=(Users)session.getAttribute("user");
			AddressInformation addressInformation = new AddressInformation();
			addressInformation.setGoodsTel(phone);
			addressInformation.setGoodsName(name);
			addressInformation.setUserId(user.getUserId());
			addressInformation.setPostId(post);
			addressInformation.setDetaAddress(proviceVal+" "+cityVal+" "+areaVal+" "+detialAdd);
			addressInformation.setAddressId(areaId);
			System.out.println(addressInformation);
			int i=addressInformationService.insertAddress(addressInformation);
			if(i>0){	
				Integer addId= addressInformationService.selectNextId();
				addressInformation.setGoodsAddressId(addId);
				List<Common> list=addressInformationService.selectAddress(addressInformation);
				Common common=list.get(0);
				common.setDetaAddress(addressInformation.getDetaAddress());
				System.out.println(common);
				return common;
			}else{
				return	null;
			}
	}
	
	
	@RequestMapping("/update")
	@ResponseBody
	public AddressInformation  updataAdd(
			@RequestParam (name="name",required=false) String name,
			@RequestParam (name="phone",required=false) String phone,
			@RequestParam (name="detialAdd",required=false) String detialAdd,
			@RequestParam (name="proviceVal",required=false) String proviceVal,
			@RequestParam (name="cityId",required=false) String cityId,
			@RequestParam (name="cityVal",required=false) String cityVal,
			@RequestParam (name="areaId",required=false) String areaId,
			@RequestParam (name="areaVal",required=false) String areaVal,
			@RequestParam (name="proviceId",required=false) String proviceId,
			@RequestParam (name="post",required=false) Integer post,
			@RequestParam (name="goodsAddressId",required=false) Integer goodsAddressId
			){
		AddressInformation addressInformation = new AddressInformation();
		System.out.println(goodsAddressId+""+phone+""+name+post+detialAdd+areaId );
		addressInformation.setGoodsAddressId(goodsAddressId);
		addressInformation.setGoodsTel(phone);
		addressInformation.setGoodsName(name);
		addressInformation.setPostId(post);
		addressInformation.setDetaAddress(detialAdd);
		addressInformation.setAddressId(areaId);
		int i =addressInformationService.updataAdd(addressInformation);
		if(i>0){
			return addressInformation;
		}
		return null;
		
	}
	@RequestMapping("/select")
	@ResponseBody
	public Common  selectAdd(@RequestParam (name="goodsAddressId",required=false) Integer goodsAddressId){
		AddressInformation addressInformation = new AddressInformation();
		addressInformation.setGoodsAddressId(goodsAddressId);
		List<Common> list=addressInformationService.selectAddress(addressInformation);
		Common common = list.get(0);
		System.out.println(common);
		return common;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String  deleteAdd(@RequestParam ( name="goodsAddressId",required=false) Integer goodsAddressId){
		AddressInformation addressInformation = new AddressInformation();
		addressInformation.setGoodsAddressId(goodsAddressId);
		int i = addressInformationService.deleteAddById(addressInformation);
		if(i>0){
			return "删除成功！";
		}
		return "删除失败！";
	}
			
}
