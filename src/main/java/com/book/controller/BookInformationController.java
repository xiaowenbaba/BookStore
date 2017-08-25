package com.book.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.book.dto.BookInformation;
import com.book.dto.BookType;
import com.book.dto.Page;
import com.book.service.BookInformationService;

@Controller
@RequestMapping("/shopping")
public class BookInformationController {

	@Autowired
	private BookInformationService bookInformationService;
	
	
	@RequestMapping(path="")
	public String  selectAllBook(
			@RequestParam(name = "bookName",required = false) String bookName,
			@RequestParam(name = "bookId",required = false) Integer bookId,
			@RequestParam(name = "bookTypeId",required = false) Integer bookTypeId,
			@RequestParam(name = "bookAuthor" ,required = false) String bookAuthor,
			@RequestParam(name = "currentPage" ,required = false) Integer currentPage,
			Model model
			){
			BookInformation bookInformation = new BookInformation();
			if(bookId!=null){
				bookInformation.setBookId(bookId);
			}
			bookInformation.setBookName(bookName);
			bookInformation.setBookAuthor(bookAuthor);
			if(bookTypeId!=null){
				bookInformation.setBookTypeId(bookTypeId);				
			}
			Page<BookInformation> page = new Page<>();
			int currentPage1=1;
			if(currentPage!=null){
				currentPage1=currentPage;
				page.setCurrentPage(currentPage1);
			}
			System.out.println(currentPage);
			System.out.println(bookTypeId);
			page.setPageNumber(10);
			HashMap<String , Object> parameter= new HashMap<String ,Object>();  
			parameter.put("bookInformation", bookInformation);
			parameter.put("page", page);
			page.setData(bookInformationService.selectAllBook(parameter));			
			model.addAttribute("page", page);
			System.out.println(page);
		return "showGoods";
	}
	@RequestMapping(path="/book")
	public String  selectById(@RequestParam(name = "bookId",required = false) Integer bookId,Model model){
		BookInformation bookInformation = new BookInformation();
		if(bookId!=null){
			bookInformation.setBookId(bookId);			
		}
		BookInformation book=bookInformationService.selectById(bookInformation);
		model.addAttribute("book", book);
		System.out.println(book);
		return "showGoodsMessage";
	}
	@RequestMapping(path="/backBook")
	public String  backBook(@RequestParam(name = "bookId",required = false) Integer bookId,Model model){
		BookInformation bookInformation = new BookInformation();
		if(bookId!=null){
			bookInformation.setBookId(bookId);			
		}
		BookInformation book=bookInformationService.selectById(bookInformation);
		model.addAttribute("book", book);
		System.out.println(book);
		return "backBookModify";
	}
	@RequestMapping(path="/backBookQuery")
	public String  backBookQuery(
			@RequestParam(name = "bookName",required = false) String bookName,
			@RequestParam(name = "bookProperty",required = false) String bookProperty,
			@RequestParam(name = "currentPage" ,required = false) Integer currentPage,
			Model model
			){
			BookInformation bookInformation = new BookInformation();
			if(bookName!=null&&!"".equals(bookName)){
				 bookInformation.setBookName(bookName);
				 model.addAttribute("bookName", bookName);
			}
			if(bookProperty!=null&&!"".equals(bookProperty)){
				bookInformation.setBookProperty(bookProperty);
				 model.addAttribute("bookProperty", bookProperty);
			}
			Page<BookInformation> page = new Page<>();
			int currentPage1=1;
			if(currentPage!=null){
				currentPage1=currentPage;
				page.setCurrentPage(currentPage1);
			}
			System.out.println(currentPage);
			page.setPageNumber(5);
			HashMap<String , Object> parameter= new HashMap<String ,Object>();  
			parameter.put("bookInformation", bookInformation);
			parameter.put("page", page);
			page.setData(bookInformationService.selectAllBook(parameter));			
			model.addAttribute("page", page);
			System.out.println(page);
		return "backBookQuery";
	}
	
	
	
	@RequestMapping("/backBookModify")
	public String  backBookModify(@RequestParam(name = "bookName",required = false) String bookName,
			@RequestParam(name = "bookProperty",required = false) String bookProperty,
			@RequestParam(name = "bookAuthor",required = false) String bookAuthor,
			@RequestParam(name = "bookSelling",required = false) Integer bookSelling,
			@RequestParam(name = "bookId",required = false) Integer bookId,
			@RequestParam(name = "bookPublish",required = false) String bookPublish,
			@RequestParam(name = "bookStorage",required = false) Integer bookStorage
			){
		BookInformation bookInformation = new BookInformation();
		bookInformation.setBookAuthor(bookAuthor);
		bookInformation.setBookId(bookId);
		bookInformation.setBookName(bookName);
		bookInformation.setBookPublish(bookPublish);
		bookInformation.setBookSelling(bookSelling);
		bookInformation.setBookStorage(bookStorage);
		bookInformation.setBookProperty(bookProperty);
		System.out.println(bookInformation);
		int i=bookInformationService.backUpdateBook(bookInformation);
		 if(i>0){
			 return "redirect:/shopping/backBookQuery";
		 }
		 return null;
	}
	
	
	@RequestMapping("/selectBookType")
	@ResponseBody
	public     List<BookType> selectBookType(){
		
		
	return	bookInformationService.selectType();
		
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/backBookInsert")
	@ResponseBody
	public String backBookInsert(@RequestParam(name = "bookName",required = false) String bookName,
			@RequestParam(name = "bookProperty",required = false) String bookProperty,
			@RequestParam(name = "bookAuthor",required = false) String bookAuthor,
			@RequestParam(name = "bookSelling",required = false) Integer bookSelling,
			@RequestParam(name = "bookPublish",required = false) String bookPublish,
			@RequestParam(name = "bookStorage",required = false) Integer bookStorage,
			@RequestParam(name = "bookDegree",required = false) String bookDegree,
			@RequestParam(name = "bookTypeId",required = false) Integer bookTypeId,
			@RequestParam(name = "isbnId",required = false) String isbnId,
			@RequestParam(name = "bookPrice",required = false) Integer bookPrice){
		BookInformation bookInformation = new BookInformation();
		if(bookAuthor!=null&&!"".equals(bookAuthor)){
			bookInformation.setBookAuthor(bookAuthor);			
		}
		if(bookDegree!=null&&!"".equals(bookDegree)){
			
			bookInformation.setBookDegree(bookDegree);
		}
		if(bookName!=null&&!"".equals(bookName)){
			bookInformation.setBookName(bookName);
		}
		if(bookName!=null){
			bookInformation.setBookTypeId(bookTypeId);
		}
		
		bookInformation.setBookPrice(bookPrice);
		bookInformation.setBookProperty(bookProperty);
		bookInformation.setBookSelling(bookSelling);
		bookInformation.setBookStorage(bookStorage);
		
		bookInformation.setIsbnId(isbnId);
		bookInformation.setBookPublish(bookPublish);
		String MSG="插入失败！数据必须要填写完整！";
		try {
			int i =bookInformationService.backBookInsert(bookInformation);
			if(i>0){
				MSG="插入成功！";
				return MSG;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return MSG;
		}
		
	}
	
	
	@RequestMapping("/backBookTypeQuery")
	public String backBookType(@RequestParam(name = "bookTypeId",required = false) Integer bookTypeId,
			@RequestParam(name = "bookTypeName",required = false) String bookTypeName,
			@RequestParam(name = "currentPage" ,required = false) Integer currentPage,
			Model model){
		
		BookType bookType  = new BookType();
		
		if(bookTypeId!=null){
			bookType.setBookTypeId(bookTypeId);
			model.addAttribute("bookTypeId", bookTypeId);
		}
		if(bookTypeName!=null&&!"".equals(bookTypeName)){
			bookType.setBookTypeName(bookTypeName);
			model.addAttribute("bookTypeName", bookTypeName);
		}
		
		Page<BookType> page = new Page<>();
		int currentPage1=1;
		if(currentPage!=null){
			currentPage1=currentPage;
			page.setCurrentPage(currentPage1);
		}else {
			page.setCurrentPage(currentPage1);
		}
		System.out.println(bookType);
		System.out.println(currentPage);
		page.setPageNumber(5);
		HashMap<String , Object> map = new HashMap<String,Object>();
		map.put("bookType",bookType);
		map.put("page", page);
		List<BookType> list=bookInformationService.selectTypeByPage(map);
		page.setData(list);
		
		
		
		System.out.println(page);
		model.addAttribute("page", page);
		
		
		return "backBookTypeQuery";
	}
	@RequestMapping("/backBookTypeModify")
	public String backBookTypeModify(@RequestParam(name = "bookTypeId",required = false) Integer bookTypeId,
			Model model){
		
		BookType bookType  = new BookType();
		
		if(bookTypeId!=null){
			bookType.setBookTypeId(bookTypeId);
			model.addAttribute("bookTypeId", bookTypeId);
		}
		
		Page<BookType> page = new Page<>();
		int currentPage1=1;
	
			page.setCurrentPage(currentPage1);
		
		System.out.println(bookType);
		page.setPageNumber(5);
		HashMap<String , Object> map = new HashMap<String,Object>();
		map.put("bookType",bookType);
		map.put("page", page);
		List<BookType> list=bookInformationService.selectTypeByPage(map);
		page.setData(list);
		
		BookType bookType2= list.get(0);
		
		System.out.println(page);
		model.addAttribute("bookType", bookType2);
		
		return "backBookTypeModify";
		
	}
	@SuppressWarnings("finally")
	@RequestMapping("/backBookTypeSave")
	@ResponseBody
	public String backBookType(
			@RequestParam(name = "bookTypeName",required = false) String bookTypeName){
		
		BookType  bookType = new BookType();
		
		if(bookTypeName!=null&&!"".equals(bookTypeName)){
			bookType.setBookTypeName(bookTypeName);
		}
		String MSG="插入失败！请填书籍类型名称！";
		try {
        int i =			bookInformationService.backBookTypeInsert(bookType);
			if(i>0){
				MSG="插入成功！";
				return MSG;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			return MSG;
		}
				
	}
	
	
}
