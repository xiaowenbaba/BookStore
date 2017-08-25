package com.book.dto;

public class GoodsOrderDetialed {
    private Integer goodOrderId;

    private Integer bookId;

    private Integer orderId;

    private Integer orderNum;

    private Integer price;

    public Integer getGoodOrderId() {
        return goodOrderId;
    }

    public void setGoodOrderId(Integer goodOrderId) {
        this.goodOrderId = goodOrderId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}