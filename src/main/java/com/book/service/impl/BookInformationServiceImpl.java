package com.book.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.book.dto.BookInformation;
import com.book.dto.BookType;
import com.book.dto.Page;
import com.book.mapper.BookInformationMapper;
import com.book.service.BookInformationService;

@Service
public class BookInformationServiceImpl implements BookInformationService {

	@Autowired
	private BookInformationMapper bookInformationMapper;

	@Override
	public List<BookInformation> selectAllBook(HashMap<String, Object> parameter) {
		
		return  bookInformationMapper.selectAllBookByPage(parameter);
	}

	@Override
	public BookInformation selectById(BookInformation bookInformation) {
		// TODO Auto-generated method stub
		return bookInformationMapper.selectById(bookInformation);
	}

	@Override
	public int backUpdateBook(BookInformation bookInformation) {
		// TODO Auto-generated method stub
		return bookInformationMapper.backUpdateBook(bookInformation);
	}

	@Override
	public List<BookType> selectType() {
		// TODO Auto-generated method stub
		return bookInformationMapper.selectType();
	}

	@Override
	public int backBookInsert(BookInformation bookInformation) {
		// TODO Auto-generated method stub
		return bookInformationMapper.backBookInsert(bookInformation);
	}

	@Override
	public List<BookType> selectTypeByPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bookInformationMapper.selectTypeByPage(map);
	}

	@Override
	public int backBookTypeInsert(BookType bookType) {
		// TODO Auto-generated method stub
		return bookInformationMapper.backBookTypeInsert(bookType);
	}

}
