package com.book.dto;

import java.util.Date;

public class UserMassage {
    private Integer userId;

    private String userMassage;

    private Date userMassageData;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserMassage() {
        return userMassage;
    }

    public void setUserMassage(String userMassage) {
        this.userMassage = userMassage == null ? null : userMassage.trim();
    }

    public Date getUserMassageData() {
        return userMassageData;
    }

    public void setUserMassageData(Date userMassageData) {
        this.userMassageData = userMassageData;
    }
}