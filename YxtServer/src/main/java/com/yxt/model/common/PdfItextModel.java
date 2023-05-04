package com.yxt.model.common;

public class PdfItextModel {
    private float xCoordinate;

    private float yCoordinate;

    private Integer pageNum;

    private String content;

    public float getxCoordinate() {
        return xCoordinate;
    }

    public void setxCoordinate(float xCoordinate) {
        this.xCoordinate = xCoordinate;
    }

    public float getyCoordinate() {
        return yCoordinate;
    }

    public void setyCoordinate(float yCoordinate) {
        this.yCoordinate = yCoordinate;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public PdfItextModel(float xCoordinate, float yCoordinate, Integer pageNum, String content) {
        this.xCoordinate = xCoordinate;
        this.yCoordinate = yCoordinate;
        this.pageNum = pageNum;
        this.content = content;
    }
}
