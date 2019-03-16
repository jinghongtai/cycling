package com.ht.dao;

import com.ht.domain.Posts;
import org.hibernate.Query;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年01月12日 17:38;
 *
 * @version: 1.0
 */

@Component("postsDao")
public class PostsDao extends BaseDao<Posts,String> {



    public <T> List<T> query2(Class t,Map<String,Object> map, String likename, String orderFile){
        StringBuffer sql = new StringBuffer("from ").append(t.getName()).append(" WHERE  1=1 ");
        for(String key:map.keySet()){
            if("page".equals(key)||"limit".equals(key)||key.indexOf("Set")!=-1||"resourcIds".equals(key))continue;
            if("likeName".equals(key)){
                sql.append(" and ").append(likename).append(" like ").append(" :"+key);
                continue;
            }
            sql.append(" and ").append(key).append(" = ").append(" :"+key);
        }
        if(orderFile!=null)
            sql.append(" order by ").append(orderFile);
        Query query = this.getConnection().createQuery(sql.toString());
        if(map.containsKey("page")&&map.containsKey("limit")){
            query.setFirstResult(((int)map.get("page")-1)*(int)map.get("limit"));
            query.setMaxResults((int)map.get("limit"));
        }
        for(String key:map.keySet()){
            if("page".equals(key)||"limit".equals(key)||key.indexOf("Set")!=-1||"resourcIds".equals(key))continue;
            if("likeName".equals(key)){
                query.setParameter(key,"%"+map.get(key)+"%");
                continue;
            }
            query.setParameter(key,map.get(key));
        }
        return query.list();
    }



    public List<Posts> query(String field,String operatorType,String obj){
        String sql = "select new com.ht.domain.Posts(pos.id,pos.title,pos.content,pos.createTime,pos.createUserId," +
                "pos.topFlag,pos.orderNo,pos.lookCount,pos.postClassId,pos.flagPingLun,pos.postCategoryId,u.username,u.headImg) " +
                "from Posts pos left join Users u on pos.createUserId = u.id  WHERE pos."+field.trim() + operatorType + " :name";
        Query query = this.getConnection().createQuery(sql);
        query.setParameter("name",obj);
        return query.list();
    }

}


