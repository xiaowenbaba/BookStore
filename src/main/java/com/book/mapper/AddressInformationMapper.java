package com.book.mapper;

import java.util.List;

import com.book.dto.AddressInformation;
import com.book.dto.Common;

public interface AddressInformationMapper {
	int insertAddress(AddressInformation addressInformation);
	List<Common> selectAddress(AddressInformation addressInformation);
	Integer selectNextId();
	int  updataAdd(AddressInformation AddressInformation);
	int deleteAddById(AddressInformation AddressInformation);
}
