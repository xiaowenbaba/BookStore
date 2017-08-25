package com.book.dto;

public class AddressInformation {
    private Integer goodsAddressId;

    private Integer userId;
    
    private String  addressId ;

    private String goodsName;

    private String goodsTel;

    private Integer postId;

    private String detaAddress;
    
    public Integer getGoodsAddressId() {
        return goodsAddressId;
    }

    public void setGoodsAddressId(Integer goodsAddressId) {
        this.goodsAddressId = goodsAddressId;
    }

   
   

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsTel() {
        return goodsTel;
    }

    public void setGoodsTel(String goodsTel) {
        this.goodsTel = goodsTel == null ? null : goodsTel.trim();
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getDetaAddress() {
        return detaAddress;
    }

    public void setDetaAddress(String detaAddress) {
        this.detaAddress = detaAddress == null ? null : detaAddress.trim();
    }

	@Override
	public String toString() {
		return "AddressInformation [goodsAddressId=" + goodsAddressId + ", userId=" + userId + ", addressId="
				+ addressId + ", goodsName=" + goodsName + ", goodsTel=" + goodsTel + ", postId=" + postId
				+ ", detaAddress=" + detaAddress + "]";
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	
    
}