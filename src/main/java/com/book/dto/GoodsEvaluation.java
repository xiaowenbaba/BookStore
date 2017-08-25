package com.book.dto;

public class GoodsEvaluation {
    private Integer evaluationId;

    private Integer useOrderId;

    private Integer bookId;

    private Integer userId;

    private Integer evaluationGrade;

    public Integer getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(Integer evaluationId) {
        this.evaluationId = evaluationId;
    }

    public Integer getUseOrderId() {
        return useOrderId;
    }

    public void setUseOrderId(Integer useOrderId) {
        this.useOrderId = useOrderId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getEvaluationGrade() {
        return evaluationGrade;
    }

    public void setEvaluationGrade(Integer evaluationGrade) {
        this.evaluationGrade = evaluationGrade;
    }
}