package com.book.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.dto.Common;
import com.book.dto.Page;
import com.book.dto.UserInformation;
import com.book.dto.Users;
import com.book.dto.UsersBackstage;
import com.book.service.UsersService;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/register")
	public  String  registerUser(@RequestParam(name = "userName",required = false) String userName
			,@RequestParam(name="passWord",required = false ) String passWord	
			,@RequestParam(name="rePassWord",required = false ) String rePassWord
			,ModelMap model){
		Users user1 = new Users();
		user1.setUserName(userName);
		Users u=usersService.selectByName(user1);
		System.out.println(u);
		if(passWord.equals(rePassWord)&&u==null&&!"".equals(passWord)){
			Users user= new Users();
			user.setUserName(userName);
			user.setUserPassword(passWord);
			usersService.registerUser(user);
			int id=usersService.selectNextId();
			usersService.insertUserInfo(id);
			return "registerSuccess";
		}else {
			model.addAttribute("info","两次输入密码不对!");
			return "register";	
		}
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String loginUser(@RequestParam(name = "userName",required = false) String userName
			,@RequestParam(name="passWord",required = false ) String passWord
			,HttpSession session,ModelMap model){
		Users user = new Users();
		user.setUserName(userName);
		user.setUserPassword(passWord);
		Users user1=usersService.loginUser(user);
		System.out.println(user1+passWord+userName);
		if(user1!=null){
			session.setAttribute("user", user1);
			user1.setUserState("在线");
			usersService.updateState(user1);
			return "homePage";
		}else {
			model.addAttribute("info","账号或密码错误,请重新输入");
			return "login";
		}
 	}
	
	
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){
		Users user = new Users();
		Users user1=(Users)session.getAttribute("user");
		user.setUserId(user1.getUserId());
		user.setUserState("离线");
		int i=usersService.loginOut(user);
		if(i>0){
			session.removeAttribute("user");
			return "homePage";			
		}else {
			System.out.println("注销失败");
			return "exception";
		}
	}
	
	
	@RequestMapping("/userInfo")
	public String  entryInfo(HttpSession session,Model model){
		Users user=(Users)session.getAttribute("user");
		
		Integer id=user.getUserId();
		
		Common common=usersService.selectUserInfo(id);
		System.out.println(common);
		model.addAttribute("userInfo",common);
		return "userManager";
	}
	@RequestMapping("/modify")
	@ResponseBody
	public 	String  modifyInfo(@RequestParam(name = "name",required = false) String name,
			@RequestParam(name = "tel",required = false) String tel,
			@RequestParam(name = "sex",required = false) String sex,
			@RequestParam(name = "add",required = false) String add,
			HttpSession session ){
		Users users=(Users)session.getAttribute("user");
		UserInformation userInformation = new UserInformation();
		userInformation.setNickName(name);
		userInformation.setSchool(add);
		userInformation.setSex(sex);
		userInformation.setUserTel(tel);
		userInformation.setUserInfoId(users.getUserId());
		int i =usersService.updateUserInfoMessage(userInformation);
		if(i>0){
			return "成功！";
		}
		return null;
	}
	@RequestMapping("/backModify")
	public 	String  backModify(@RequestParam(name = "name",required = false) String name,
			@RequestParam(name = "tel",required = false) String tel,
			@RequestParam(name = "userId",required = false) Integer userId,RedirectAttributes attributes
			 ){
		UserInformation userInformation = new UserInformation();
		userInformation.setNickName(name);
		userInformation.setUserTel(tel);
		userInformation.setUserInfoId(userId);
		int i =usersService.updateUserInfoMessage(userInformation);
		if(i>0){
			return "redirect:/user/backUserQuery";
		}
			return "exception";
	}

	@RequestMapping("/modifyPassword")
	@ResponseBody
	public int modifyPassword(@RequestParam(name = "passWord",required = false) String passWord,
			@RequestParam(name = "newPassWord",required = false) String newPassWord,
			@RequestParam(name = "renewPassWord",required = false) String renewPassWord,HttpSession session){
		Users user = (Users) session.getAttribute("user");
		 
		String paString=user.getUserPassword();
		System.out.println(passWord);
		System.out.println(newPassWord);

		System.out.println(renewPassWord);

		if(passWord.equals(paString)&&newPassWord.equals(renewPassWord)){
			Users user1 = new Users();
			user1.setUserId(user.getUserId());
			user1.setUserPassword(newPassWord);
			usersService.updatePassword(user1);
			user1.setUserState("离线");
			usersService.loginOut(user1);
			session.removeAttribute("user");
			return 1 ;
			
		}else{
			return 0;
		}
		
	}
	@RequestMapping("/loginBack")
	@ResponseBody
	public String loginBack(@RequestParam(name = "sysUserName",required = false) String sysUserName,
			@RequestParam(name = "sysUserPassword",required = false) String sysUserPassword,
			HttpSession session){
		UsersBackstage backstage = new UsersBackstage();
		backstage.setSysUserName(sysUserName);
		backstage.setSysUserPassword(sysUserPassword);
		UsersBackstage backstage2=usersService.loginBack(backstage);
		if(backstage2!=null){
			return "登陆成功！";
		}
		return "账号或密码错误！";
		
	}
	
	@RequestMapping("/backUserQuery")
	public String backUserQuery(@RequestParam(name = "userId",required = false) Integer userId,
			@RequestParam(name = "userName",required = false) String userName,
			Model model){
		UserInformation information = new UserInformation();
		if(userId!=null){
			information.setUserInfoId(userId);
			model.addAttribute("userId", userId);
		}
		if(userName!=null&&!"".equals(userName)){			
			information.setNickName(userName);
			model.addAttribute("userName", userName);
		}
		int currentPage=1;
		int pageNumber=10;
		HashMap<String , Object> map = new HashMap<>();
		map.put("user",information);
		Page<Common> page = new Page<>();
		page.setCurrentPage(currentPage);
 		page.setPageNumber(pageNumber);
 		map.put("page", page);
 		List<Common> list=usersService.BackselectByPage(map);
 		page.setData(list);
 		model.addAttribute("page", page);
 		System.out.println(page);
		return "backUserQuery";
	}
	@RequestMapping("/backUserQueryById")
	public String backUserQueryById(@RequestParam(name = "userId",required = false) Integer userId,
			Model model){
		UserInformation information = new UserInformation();
		if(userId!=null){
			information.setUserInfoId(userId);
			model.addAttribute("userId", userId);
		}
		int currentPage=1;
		int pageNumber=10;
		HashMap<String , Object> map = new HashMap<>();
		map.put("user",information);
		Page<Common> page = new Page<>();
		page.setCurrentPage(currentPage);
 		page.setPageNumber(pageNumber);
 		map.put("page", page);
 		List<Common> list=usersService.BackselectByPage(map);
 		Common commom=list.get(0);
 		model.addAttribute("commom", commom);
 		System.out.println(commom);
		return "backUserModify";
	}
}
