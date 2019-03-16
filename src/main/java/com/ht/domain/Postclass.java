package com.ht.domain;

import com.google.gson.annotations.Expose;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 20:39;
 *
 * @version: 1.0
 */
public class Postclass {
    @Expose
    private String id;
    @Expose
    private String name;
    @Expose
    private Integer orderNo;
    @Expose
    private String flag;
    //private String bankuiId;
    @Expose
    private String coverImg;
    @Expose
    private String flagZd;


    private Bankuai bankuai;


    public String getFlagZd() {
        return flagZd;
    }

    public void setFlagZd(String flagZd) {
        this.flagZd = flagZd;
    }

    public Bankuai getBankuai() {
        return bankuai;
    }

    public void setBankuai(Bankuai bankuai) {
        this.bankuai = bankuai;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }



    public String getCoverImg() {
        return coverImg;
    }

    public void setCoverImg(String coverImg) {
        this.coverImg = coverImg;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Postclass postclass = (Postclass) o;

        if (id != null ? !id.equals(postclass.id) : postclass.id != null) return false;
        if (name != null ? !name.equals(postclass.name) : postclass.name != null) return false;
        if (orderNo != null ? !orderNo.equals(postclass.orderNo) : postclass.orderNo != null) return false;
        if (flag != null ? !flag.equals(postclass.flag) : postclass.flag != null) return false;
        if (coverImg != null ? !coverImg.equals(postclass.coverImg) : postclass.coverImg != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (orderNo != null ? orderNo.hashCode() : 0);
        result = 31 * result + (flag != null ? flag.hashCode() : 0);
        result = 31 * result + (coverImg != null ? coverImg.hashCode() : 0);
        return result;
    }
}
