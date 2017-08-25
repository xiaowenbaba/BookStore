package com.book.dto;

public class UserSale {
    private Integer saleId;

    private Integer userId;

    private String saleName;

    private String saleTel;

    private String atrribute;

    private Integer bookId;

    private Integer saleNum;

    public Integer getSaleId() {
        return saleId;
    }

    public void setSaleId(Integer saleId) {
        this.saleId = saleId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getSaleName() {
        return saleName;
    }

    public void setSaleName(String saleName) {
        this.saleName = saleName == null ? null : saleName.trim();
    }

    public String getSaleTel() {
        return saleTel;
    }

    public void setSaleTel(String saleTel) {
        this.saleTel = saleTel == null ? null : saleTel.trim();
    }

    public String getAtrribute() {
        return atrribute;
    }

    public void setAtrribute(String atrribute) {
        this.atrribute = atrribute == null ? null : atrribute.trim();
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(Integer saleNum) {
        this.saleNum = saleNum;
    }
}