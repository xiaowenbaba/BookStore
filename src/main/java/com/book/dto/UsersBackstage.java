package com.book.dto;

public class UsersBackstage {
    private Integer usersBackstageId;

    private String sysUserName;

    private String sysUserPassword;

    private String name;

    private String sex;

    private String telephone;

    public Integer getUsersBackstageId() {
        return usersBackstageId;
    }

    public void setUsersBackstageId(Integer usersBackstageId) {
        this.usersBackstageId = usersBackstageId;
    }
    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName == null ? null : sysUserName.trim();
    }

    public String getSysUserPassword() {
        return sysUserPassword;
    }

    public void setSysUserPassword(String sysUserPassword) {
        this.sysUserPassword = sysUserPassword == null ? null : sysUserPassword.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }
}