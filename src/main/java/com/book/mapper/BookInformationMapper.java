package com.book.mapper;

import java.util.HashMap;
import java.util.List;

import com.book.dto.BookInformation;
import com.book.dto.BookType;
import com.book.dto.Common;
import com.book.dto.Page;

public interface BookInformationMapper {
	
	List<BookInformation> selectAllBookByPage(HashMap<String , Object> parameter);
	BookInformation selectById(BookInformation bookInformation);
	int backUpdateBook(BookInformation bookInformation);
	List<BookType> selectType();
	int backBookInsert(BookInformation bookInformation);
	List<BookType> selectTypeByPage(HashMap<String  , Object> map);
	int backBookTypeInsert(BookType bookType);
}
