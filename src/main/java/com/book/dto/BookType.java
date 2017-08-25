package com.book.dto;

public class BookType {
    private Integer bookTypeId;

    private Integer booFatherId;

    private String bookTypeName;

    public Integer getBookTypeId() {
        return bookTypeId;
    }

    public void setBookTypeId(Integer bookTypeId) {
        this.bookTypeId = bookTypeId;
    }

    public Integer getBooFatherId() {
        return booFatherId;
    }

    public void setBooFatherId(Integer booFatherId) {
        this.booFatherId = booFatherId;
    }

    public String getBookTypeName() {
        return bookTypeName;
    }

    public void setBookTypeName(String bookTypeName) {
        this.bookTypeName = bookTypeName == null ? null : bookTypeName.trim();
    }

	@Override
	public String toString() {
		return "BookType [bookTypeId=" + bookTypeId + ", booFatherId=" + booFatherId + ", bookTypeName=" + bookTypeName
				+ "]";
	}
    
    
}