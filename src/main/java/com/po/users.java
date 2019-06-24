package com.po;

import java.util.List;

public class users {
    private Integer userId;
    private String userName;
    private String userPwd;
    private String userTel;
    private String userAddress;
    private String userStatue;
    private List<books> lendbooks;
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserStatue() {
        return userStatue;
    }

    public void setUserStatue(String userStatue) {
        this.userStatue = userStatue;
    }

    public List<books> getLendbooks() {
        return lendbooks;
    }

    public void setLendbooks(List<books> lendbooks) {
        this.lendbooks = lendbooks;
    }

    @Override
    public String toString() {
        return "users{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userAddress='" + userAddress + '\'' +
                ", userStatue='" + userStatue + '\'' +
                ", lendbooks=" + lendbooks +
                '}';
    }
}
