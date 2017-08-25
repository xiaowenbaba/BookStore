package com.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class RedirectController {

	@RequestMapping("/homePage")
	public String redirectHomePage(){
		return "homePage";
	}
	@RequestMapping("/login")
	public String redirectLogin(){
		return "login";
	}
	@RequestMapping("/register")
	public String redirectRegister(){
		return "register";
	}
	@RequestMapping("/modifyPassword")
	public String redirectModifyPassword(){
		return "modifyPassword";
	}
	@RequestMapping("/backLogin")
	public String redirectBackLogin(){
		return "backLogin";
	}
	@RequestMapping("/backMainPage")
	public String  redirectBackMainPage(){
		return "backMainPage";
	}
	
	@RequestMapping("/backBookInsert")
	public String  redirectbackBookInsert(){
		return "backBookInsert";
	}
	@RequestMapping("/backBookTypeInsert")
	public String redrectbackBookTypeInsert(){
		return "backBookTypeInsert";
	}
}
