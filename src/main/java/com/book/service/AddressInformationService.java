package com.book.service;

import java.util.List;

import com.book.dto.AddressInformation;
import com.book.dto.Common;

public interface AddressInformationService {
	int insertAddress(AddressInformation addressInformation);
	List<Common> selectAddress(AddressInformation addressInformation);
	Integer selectNextId();
	int  updataAdd(AddressInformation AddressInformation);
	int deleteAddById(AddressInformation AddressInformation);

}
