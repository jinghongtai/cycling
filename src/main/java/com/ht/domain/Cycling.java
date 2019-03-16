package com.ht.domain;

import com.ht.utils.PageParam;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

/**
 * Created by TT on 2019/3/3.
 */
public class Cycling extends PageParam{

    private MultipartFile file;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    private String id;

    private String title;

    private String activeType;

    private String activeAddressBegin;

    private String activeAddressEnd;

    private Timestamp beginTime;

    private Timestamp endTime;

    private Integer activeCount;    //当flagPersonLimit为Y时，该处为最大人数

    private String flagPersonLimit; // 是否人数限制 N不限制 Y限制

    private String status;          //是否结束 N未结束 Y已结束

    private Timestamp loginTime;

    private Timestamp loginEndTime;

    private String content;

    private String converImg;

    private String createUserId;    //创建者

    private String allowRelease;   //是否允许发布

    private String flagBm;  //是否报名 非数据库隐射字段

    private String formatDat;   //页面显示的格式化时间 非数据库映射字段

    public String getAllowRelease() {
        return allowRelease;
    }

    public void setAllowRelease(String allowRelease) {
        this.allowRelease = allowRelease;
    }

    public String getFormatDat() {
        if(beginTime!=null){
            return DateFormatUtils.format(beginTime,"MM-dd E");
        }
        return formatDat;
    }

    public void setFormatDat(String formatDat) {
        this.formatDat = formatDat;
    }

    public String getFlagBm() {
        return flagBm;
    }

    public void setFlagBm(String flagBm) {
        this.flagBm = flagBm;
    }

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    public String getConverImg() {
        return converImg;
    }

    public void setConverImg(String converImg) {
        this.converImg = converImg;
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

    public String getActiveType() {
        return activeType;
    }

    public void setActiveType(String activeType) {
        this.activeType = activeType;
    }

    public String getActiveAddressBegin() {
        return activeAddressBegin;
    }

    public void setActiveAddressBegin(String activeAddressBegin) {
        this.activeAddressBegin = activeAddressBegin;
    }

    public String getActiveAddressEnd() {
        return activeAddressEnd;
    }

    public void setActiveAddressEnd(String activeAddressEnd) {
        this.activeAddressEnd = activeAddressEnd;
    }

    public Timestamp getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Timestamp beginTime) {
        this.beginTime = beginTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Integer getActiveCount() {
        return activeCount;
    }

    public void setActiveCount(Integer activeCount) {
        this.activeCount = activeCount;
    }

    public String getFlagPersonLimit() {
        return flagPersonLimit;
    }

    public void setFlagPersonLimit(String flagPersonLimit) {
        this.flagPersonLimit = flagPersonLimit;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Timestamp loginTime) {
        this.loginTime = loginTime;
    }

    public Timestamp getLoginEndTime() {
        return loginEndTime;
    }

    public void setLoginEndTime(Timestamp loginEndTime) {
        this.loginEndTime = loginEndTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Cycling cycling = (Cycling) o;

        if (id != null ? !id.equals(cycling.id) : cycling.id != null) return false;
        if (title != null ? !title.equals(cycling.title) : cycling.title != null) return false;
        if (activeType != null ? !activeType.equals(cycling.activeType) : cycling.activeType != null) return false;
        if (activeAddressBegin != null ? !activeAddressBegin.equals(cycling.activeAddressBegin) : cycling.activeAddressBegin != null)
            return false;
        if (activeAddressEnd != null ? !activeAddressEnd.equals(cycling.activeAddressEnd) : cycling.activeAddressEnd != null)
            return false;
        if (beginTime != null ? !beginTime.equals(cycling.beginTime) : cycling.beginTime != null) return false;
        if (endTime != null ? !endTime.equals(cycling.endTime) : cycling.endTime != null) return false;
        if (activeCount != null ? !activeCount.equals(cycling.activeCount) : cycling.activeCount != null) return false;
        if (flagPersonLimit != null ? !flagPersonLimit.equals(cycling.flagPersonLimit) : cycling.flagPersonLimit != null)
            return false;
        if (status != null ? !status.equals(cycling.status) : cycling.status != null) return false;
        if (loginTime != null ? !loginTime.equals(cycling.loginTime) : cycling.loginTime != null) return false;
        if (loginEndTime != null ? !loginEndTime.equals(cycling.loginEndTime) : cycling.loginEndTime != null)
            return false;
        if (content != null ? !content.equals(cycling.content) : cycling.content != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (activeType != null ? activeType.hashCode() : 0);
        result = 31 * result + (activeAddressBegin != null ? activeAddressBegin.hashCode() : 0);
        result = 31 * result + (activeAddressEnd != null ? activeAddressEnd.hashCode() : 0);
        result = 31 * result + (beginTime != null ? beginTime.hashCode() : 0);
        result = 31 * result + (endTime != null ? endTime.hashCode() : 0);
        result = 31 * result + (activeCount != null ? activeCount.hashCode() : 0);
        result = 31 * result + (flagPersonLimit != null ? flagPersonLimit.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (loginTime != null ? loginTime.hashCode() : 0);
        result = 31 * result + (loginEndTime != null ? loginEndTime.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        return result;
    }
}
