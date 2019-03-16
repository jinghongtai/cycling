package com.ht.service;

import com.ht.dao.PostsDao;
import com.ht.domain.Posts;
import com.ht.domain.Users;
import com.ht.utils.BeanUtil;
import com.ht.utils.PageVo;
import com.ht.utils.SystemUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Service("postsService")
public class PostsService {


    @Resource(name = "postsDao")
    private PostsDao postsDao;

    /**
     * 分页查询骑行活动信息
     * @param posts
     * @return
     * @throws IllegalAccessException
     * @throws IntrospectionException
     * @throws InvocationTargetException
     */
    @Transactional(readOnly = true)
    public PageVo queryInof(Posts posts) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        // 查询总页数
        Map<String, Object> notNullProperty = BeanUtil.getNotNullProperty(posts);
        Long aLong = postsDao.queryCount(notNullProperty, null);
        // 查询记录
        List<Posts> resultList = postsDao.query2(Posts.class,notNullProperty, null, "topFlag asc,createTime desc");
        return PageVo.returnPage(resultList,aLong);
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public Map<String,String> savePosts(Posts posts) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        Map<String,String> map = new HashMap<String,String>();
        map.put("status","error");
        if(StringUtils.isEmpty(posts.getTopFlag()))
            posts.setTopFlag("1");
        Users user = (Users)SystemUtils.getSession().getAttribute("USER_KEY");
        if(user==null){
            map.put("message","请先登录后在发帖");
            return map;
        }
        posts.setCreateUserId(user.getId());
        if(posts!=null&& StringUtils.isEmpty(posts.getId())){
            // 新增操作
            if(StringUtils.isEmpty(posts.getPostClassId())){
                map.put("message","保存失败");
                return map;
            }
            if(StringUtils.isEmpty(posts.getPostCategoryId())){
                map.put("message","请选择主题分类");
                return map;
            }
            posts.setCreateTime(new Timestamp(System.currentTimeMillis()));
            postsDao.save(posts);
        }else{
            // 更新操作
            List<Posts> oldPosts = postsDao.query("id", "=", posts.getId());
            List<String> nullProperty = BeanUtil.getNullProperty(posts);
            BeanUtils.copyProperties(posts,oldPosts.get(0),nullProperty.toArray(new String[nullProperty.size()]));
        }
        map.put("status","success");
        return map;

    }

    /**
     * 查询当前板块分类下面的帖子数
     * @param banKuaiClassId
     * @return
     */
    @Transactional(readOnly = true)
    public int queryOPage(String banKuaiClassId){
        if(StringUtils.isEmpty(banKuaiClassId))
            return 0;
        Map<String, Object> notNullProperty = new HashMap<String,Object>();
        notNullProperty.put("postClassId",banKuaiClassId);
        Long aLong = postsDao.queryCount(notNullProperty, null);
        if(aLong!=null)
            return aLong.intValue();
        return 0;
    }


    @Transactional(readOnly = true)
    public Posts queryPostDetail(String id){
        if(StringUtils.isEmpty(id))
            return null;
        List<Posts> result = postsDao.query("id", "=",id);
        // 查询当前发帖的人
        return result!=null&&result.size()>0?result.get(0):null;
    }


}
