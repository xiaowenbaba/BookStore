package com.book.dto;

public class BookInformation {
    private Integer bookId;

    private Integer bookTypeId;

    private String isbnId;

    private String bookName;

    private String bookAuthor;

    private Integer bookPrice;

    private Integer bookSelling;

    private Integer bookStorage;

    private String bookPublish;

    private String bookPicture;

    private String bookDegree;

    private String bookProperty;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getBookTypeId() {
        return bookTypeId;
    }

    public void setBookTypeId(Integer bookTypeId) {
        this.bookTypeId = bookTypeId;
    }

    public String getIsbnId() {
        return isbnId;
    }

    public void setIsbnId(String isbnId) {
        this.isbnId = isbnId == null ? null : isbnId.trim();
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor == null ? null : bookAuthor.trim();
    }

    public Integer getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Integer bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Integer getBookSelling() {
        return bookSelling;
    }

    public void setBookSelling(Integer bookSelling) {
        this.bookSelling = bookSelling;
    }

    public Integer getBookStorage() {
        return bookStorage;
    }

    public void setBookStorage(Integer bookStorage) {
        this.bookStorage = bookStorage;
    }

    public String getBookPublish() {
        return bookPublish;
    }

    public void setBookPublish(String bookPublish) {
        this.bookPublish = bookPublish == null ? null : bookPublish.trim();
    }

    public String getBookPicture() {
        return bookPicture;
    }

    public void setBookPicture(String bookPicture) {
        this.bookPicture = bookPicture == null ? null : bookPicture.trim();
    }

    public String getBookDegree() {
        return bookDegree;
    }

    public void setBookDegree(String bookDegree) {
        this.bookDegree = bookDegree == null ? null : bookDegree.trim();
    }

    public String getBookProperty() {
        return bookProperty;
    }

    public void setBookProperty(String bookProperty) {
        this.bookProperty = bookProperty == null ? null : bookProperty.trim();
    }

	@Override
	public String toString() {
		return "BookInformation [bookId=" + bookId + ", bookTypeId=" + bookTypeId + ", isbnId=" + isbnId + ", bookName="
				+ bookName + ", bookAuthor=" + bookAuthor + ", bookPrice=" + bookPrice + ", bookSelling=" + bookSelling
				+ ", bookStorage=" + bookStorage + ", bookPublish=" + bookPublish + ", bookPicture=" + bookPicture
				+ ", bookDegree=" + bookDegree + ", bookProperty=" + bookProperty + "]";
	}
    
}