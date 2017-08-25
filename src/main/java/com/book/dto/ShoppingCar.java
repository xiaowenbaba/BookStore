package com.book.dto;

import java.util.Date;

public class ShoppingCar {
    private Integer carId;

    private Integer userId;

    private Integer bookId;

    private Integer carNo;

    private Date data;
  
    

	public Integer getCarId() {
        return carId;
    }

    public void setCarId(Integer carId) {
        this.carId = carId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getCarNo() {
        return carNo;
    }

    public void setCarNo(Integer carNo) {
        this.carNo = carNo;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

	@Override
	public String toString() {
		return "ShoppingCar [carId=" + carId + ", userId=" + userId + ", bookId=" + bookId + ", carNo=" + carNo
				+ ", data=" + data + "]";
	}





    
}