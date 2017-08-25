package com.book.mapper;

import java.util.List;

import com.book.dto.City;

public interface CityMapper {
	List<City> selectCity(City city);
	City selectFatherCity(City city);
}
