package com.ht.domain;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 23:31;
 *
 * @version: 1.0
 */
public class Postmessage {
    private String id;
    private String userId;          //当前帖子的评论者
    private String toUserId;        //当前帖子的回复者
    private String postId;          //帖子的主键
    private String content;         //评论的内容
    private Timestamp createTime;   //创建时间

    private String formUserName;

    private String toUserName;

    private String forUserImg;

    private String toUserImg;

    public String getToUserImg() {
        return toUserImg;
    }

    public void setToUserImg(String toUserImg) {
        this.toUserImg = toUserImg;
    }

    public String getForUserImg() {
        return forUserImg;
    }

    public void setForUserImg(String forUserImg) {
        this.forUserImg = forUserImg;
    }

    public Postmessage() {
    }

    public Postmessage(String id, String userId, String toUserId, String postId, String content, Date createTime, String formUserName, String forUserImg) {
        this.id = id;
        this.userId = userId;
        this.toUserId = toUserId;
        this.postId = postId;
        this.content = content;
        this.createTime = createTime!=null?new Timestamp(createTime.getTime()):null;
        this.formUserName = formUserName;
        this.forUserImg = forUserImg;
    }

    public String getFormUserName() {
        return formUserName;
    }

    public void setFormUserName(String formUserName) {
        this.formUserName = formUserName;
    }

    public String getToUserName() {
        return toUserName;
    }

    public void setToUserName(String toUserName) {
        this.toUserName = toUserName;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getToUserId() {
        return toUserId;
    }

    public void setToUserId(String toUserId) {
        this.toUserId = toUserId;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Postmessage that = (Postmessage) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (toUserId != null ? !toUserId.equals(that.toUserId) : that.toUserId != null) return false;
        if (postId != null ? !postId.equals(that.postId) : that.postId != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createTime != null ? !createTime.equals(that.createTime) : that.createTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (toUserId != null ? toUserId.hashCode() : 0);
        result = 31 * result + (postId != null ? postId.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        return result;
    }
}
