package com.book.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.dto.City;
import com.book.service.CityService;

@Controller
@RequestMapping("/city")
public class CityController {
	@Autowired
	private CityService cityService;
	
	
	@RequestMapping("/getCity")
	@ResponseBody
	public List<City>  getCity(
			@RequestParam(name="fatherId" ,required=false) String fatherId
			){
		City city = new City();
		city.setAddressFatherName(fatherId);
		List<City> city1=cityService.selectCity(city);
		System.out.println(city1);
		if(city1!=null){
			return city1;			
		}else {
			return null;
		}
	}
	@RequestMapping("/getFatherCity")
	@ResponseBody
	public City getFatherCity(
			@RequestParam(name="addressFatherId" ,required=false) String addressFatherId
			){
			System.out.println(addressFatherId);
			City city = new City();
			city.setAddressFatherName(addressFatherId);
			City city2=cityService.selectFatherCity(city);
			System.out.println(city2);
			return city2;		
	}
}
