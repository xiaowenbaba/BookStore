package com.book.service;

import java.util.List;

import com.book.dto.City;

public interface CityService {
	List<City>  selectCity(City city);
	City selectFatherCity(City city);
}
