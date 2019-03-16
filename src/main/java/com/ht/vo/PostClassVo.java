package com.ht.vo;

import com.ht.domain.Postclass;

import java.sql.Timestamp;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 20:42;
 *
 * @version: 1.0
 */
public class PostClassVo extends Postclass {

    private int postCount   ;   //发帖数

    private int titleCount  ;   //主题数

    private Timestamp lastPostTime  ;   //最后发帖时间


    public int getPostCount() {
        return postCount;
    }

    public void setPostCount(int postCount) {
        this.postCount = postCount;
    }

    public int getTitleCount() {
        return titleCount;
    }

    public void setTitleCount(int titleCount) {
        this.titleCount = titleCount;
    }

    public Timestamp getLastPostTime() {
        return lastPostTime;
    }

    public void setLastPostTime(Timestamp lastPostTime) {
        this.lastPostTime = lastPostTime;
    }
}
