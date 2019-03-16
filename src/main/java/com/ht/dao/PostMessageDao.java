package com.ht.dao;

import com.ht.domain.Postmessage;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年01月12日 17:38;
 *
 * @version: 1.0
 */

@Component("postMessageDao")
public class PostMessageDao extends BaseDao<Postmessage,String> {


    public List<Postmessage> query(String field, String operatorType, String obj,String orderby){
        String sql = "select new com.ht.domain.Postmessage(pos.id,pos.userId,pos.toUserId,pos.postId,pos.content,pos.createTime,u.username,u.headImg) " +
                "from Postmessage pos left join Users u on pos.userId = u.id  WHERE pos."+field.trim() + operatorType + " :name";
        sql += " order by "+orderby;
        Query query = this.getConnection().createQuery(sql);
        query.setParameter("name",obj);
        return query.list();
    }

}


