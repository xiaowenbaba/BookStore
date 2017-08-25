package com.book.dto;

public class Users {
	private Integer userId;
	private String userName;
	private String userPassword;
	private String UserState;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserState() {
		return UserState;
	}
	public void setUserState(String userState) {
		UserState = userState;
	}
	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", UserState="
				+ UserState + "]";
	}
	
}
