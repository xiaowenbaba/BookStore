package com.book.dto;

public class City {
    private String addressId;

    private String addressFatherName;

    private String addressName;

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId == null ? null : addressId.trim();
    }

    public String getAddressFatherName() {
        return addressFatherName;
    }

    public void setAddressFatherName(String addressFatherName) {
        this.addressFatherName = addressFatherName == null ? null : addressFatherName.trim();
    }

    public String getAddressName() {
        return addressName;
    }

    public void setAddressName(String addressName) {
        this.addressName = addressName == null ? null : addressName.trim();
    }

	@Override
	public String toString() {
		return "City [addressId=" + addressId + ", addressFatherName=" + addressFatherName + ", addressName="
				+ addressName + "]";
	}
    
}