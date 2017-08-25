package com.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.City;
import com.book.mapper.CityMapper;
import com.book.service.CityService;

@Service
public class CityServiceImpl implements CityService {
	 
	@Autowired
	private CityMapper cityMapper;
	@Override
	public List<City> selectCity(City city) {
		// TODO Auto-generated method stub
		return cityMapper.selectCity(city);
	}
	@Override
	public City selectFatherCity(City city) {
		// TODO Auto-generated method stub
		return cityMapper.selectFatherCity(city);
	}

	
}
