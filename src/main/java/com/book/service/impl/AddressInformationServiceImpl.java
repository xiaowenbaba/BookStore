package com.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.AddressInformation;
import com.book.dto.Common;
import com.book.mapper.AddressInformationMapper;
import com.book.service.AddressInformationService;
@Service
public class AddressInformationServiceImpl  implements AddressInformationService{
	@Autowired
	private AddressInformationMapper informationMapper;
	@Override
	public int insertAddress(AddressInformation addressInformation) {
		// TODO Auto-generated method stub
		return  informationMapper.insertAddress(addressInformation);
	}
	@Override
	public List<Common> selectAddress(AddressInformation addressInformation) {
		// TODO Auto-generated method stub
		return informationMapper.selectAddress(addressInformation);
	}
	@Override
	public Integer selectNextId() {
		// TODO Auto-generated method stub
		return informationMapper.selectNextId();
	}
	@Override
	public int updataAdd(AddressInformation AddressInformation) {
		// TODO Auto-generated method stub
		return informationMapper.updataAdd(AddressInformation);
	}
	@Override
	public int deleteAddById(AddressInformation AddressInformation) {
		// TODO Auto-generated method stub
		return informationMapper.deleteAddById(AddressInformation);
	}



}
