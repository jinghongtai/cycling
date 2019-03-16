package com.ht.domain;

import com.google.gson.annotations.Expose;

import java.util.HashSet;
import java.util.Set;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 20:39;
 *
 * @version: 1.0
 */
public class Bankuai {
    @Expose
    private String id;
    @Expose
    private String name;
    @Expose
    private String flag;
    @Expose
    private Integer orderNo;

    // 关联所有的板块数据
    @Expose
    private Set<Postclass> postclassList = new HashSet<Postclass>();

    public Set<Postclass> getPostclassList() {
        return postclassList;
    }

    public void setPostclassList(Set<Postclass> postclassList) {
        this.postclassList = postclassList;
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

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Bankuai bankuai = (Bankuai) o;

        if (id != null ? !id.equals(bankuai.id) : bankuai.id != null) return false;
        if (name != null ? !name.equals(bankuai.name) : bankuai.name != null) return false;
        if (flag != null ? !flag.equals(bankuai.flag) : bankuai.flag != null) return false;
        if (orderNo != null ? !orderNo.equals(bankuai.orderNo) : bankuai.orderNo != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (flag != null ? flag.hashCode() : 0);
        result = 31 * result + (orderNo != null ? orderNo.hashCode() : 0);
        return result;
    }
}
