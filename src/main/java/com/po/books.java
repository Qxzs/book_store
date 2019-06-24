package com.po;

public class books {
    private Integer bookId;
    private String bookName;
    private String bookFace;
    private String bookAuthor;
    private String bookPress;
    private Integer bookPrice;
    private String bookCreate;
    private String bookImg;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookFace() {
        return bookFace;
    }

    public void setBookFace(String bookFace) {
        this.bookFace = bookFace;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPress() {
        return bookPress;
    }

    public void setBookPress(String bookPress) {
        this.bookPress = bookPress;
    }

    public String getBookCreate() {
        return bookCreate;
    }

    public void setBookCreate(String bookCreate) {
        this.bookCreate = bookCreate;
    }

    public String getBookImg() {
        return bookImg;
    }

    public void setBookImg(String bookImg) {
        this.bookImg = bookImg;
    }

    public Integer getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Integer bookPrice) {
        this.bookPrice = bookPrice;
    }

    @Override
    public String toString() {
        return "books{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookFace='" + bookFace + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPress='" + bookPress + '\'' +
                ", bookPrice=" + bookPrice +
                ", bookCreate='" + bookCreate + '\'' +
                ", bookImg='" + bookImg + '\'' +
                '}';
    }
}
