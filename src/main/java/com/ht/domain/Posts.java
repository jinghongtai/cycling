package com.ht.domain;

import com.ht.utils.PageParam;

import java.util.Date;
import java.sql.Timestamp;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 23:31;
 *
 * @version: 1.0
 */
public class Posts extends PageParam{
    private String id;
    private String title;           //主题
    private String content;         //内容
    private Timestamp createTime;   //创建时间
    private String createUserId;    //创建者
    private String topFlag;         //是否置顶  0 置顶 1不置顶
    private Integer orderNo;        //排序字段
    private Integer lookCount;      //查看数
    private String postClassId;     //板块分类的主键
    private String flagPingLun;     //是否禁止评论
    private String postCategoryId;  //帖子的分类

    private String userName;    //非数据库映射字段 发帖人
    private String userImg;

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserName() {
        return userName;
    }

    public Posts() {
    }

    public Posts(String id, String title, String content, Date createTime, String createUserId,
                 String topFlag, Integer orderNo, Integer lookCount, String postClassId,
                 String flagPingLun, String postCategoryId, String userName,String userImg) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.createTime = createTime!=null?new Timestamp(createTime.getTime()):null;
        this.createUserId = createUserId;
        this.topFlag = topFlag;
        this.orderNo = orderNo;
        this.lookCount = lookCount;
        this.postClassId = postClassId;
        this.flagPingLun = flagPingLun;
        this.postCategoryId = postCategoryId;
        this.userName = userName;
        this.userImg = userImg;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPostCategoryId() {
        return postCategoryId;
    }

    public void setPostCategoryId(String postCategoryId) {
        this.postCategoryId = postCategoryId;
    }

    public String getFlagPingLun() {
        return flagPingLun;
    }

    public void setFlagPingLun(String flagPingLun) {
        this.flagPingLun = flagPingLun;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public String getTopFlag() {
        return topFlag;
    }

    public void setTopFlag(String topFlag) {
        this.topFlag = topFlag;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getLookCount() {
        return lookCount;
    }

    public void setLookCount(Integer lookCount) {
        this.lookCount = lookCount;
    }

    public String getPostClassId() {
        return postClassId;
    }

    public void setPostClassId(String postClassId) {
        this.postClassId = postClassId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Posts posts = (Posts) o;

        if (id != null ? !id.equals(posts.id) : posts.id != null) return false;
        if (title != null ? !title.equals(posts.title) : posts.title != null) return false;
        if (content != null ? !content.equals(posts.content) : posts.content != null) return false;
        if (createTime != null ? !createTime.equals(posts.createTime) : posts.createTime != null) return false;
        if (createUserId != null ? !createUserId.equals(posts.createUserId) : posts.createUserId != null) return false;
        if (topFlag != null ? !topFlag.equals(posts.topFlag) : posts.topFlag != null) return false;
        if (orderNo != null ? !orderNo.equals(posts.orderNo) : posts.orderNo != null) return false;
        if (lookCount != null ? !lookCount.equals(posts.lookCount) : posts.lookCount != null) return false;
        if (postClassId != null ? !postClassId.equals(posts.postClassId) : posts.postClassId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (createUserId != null ? createUserId.hashCode() : 0);
        result = 31 * result + (topFlag != null ? topFlag.hashCode() : 0);
        result = 31 * result + (orderNo != null ? orderNo.hashCode() : 0);
        result = 31 * result + (lookCount != null ? lookCount.hashCode() : 0);
        result = 31 * result + (postClassId != null ? postClassId.hashCode() : 0);
        return result;
    }
}
