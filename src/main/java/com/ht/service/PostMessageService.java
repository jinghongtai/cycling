package com.ht.service;

import com.ht.dao.PostMessageDao;
import com.ht.domain.Postmessage;
import com.ht.domain.Users;
import com.ht.utils.BeanUtil;
import com.ht.utils.SystemUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Service("postMessageService")
public class PostMessageService {


    @Resource(name = "postMessageDao")
    private PostMessageDao psotMessageDao;


    /**
     * 查询所有的帖子分类信息
     * @return
     */
    @Transactional(readOnly = true)
    public List<Postmessage> queryPostMessage(String postId) throws InvocationTargetException, IllegalAccessException {
        if(StringUtils.isEmpty(postId))
            return null;
        // 查询当前帖子的所有回复信息
        List<Postmessage> postMessags = psotMessageDao.query("postId", "=", postId," createTime asc");
        if(postMessags!=null&&postMessags.size()>0){
            Map<String, List<Postmessage>> listToMapKList = BeanUtil.getListToMapKList("toUserId", postMessags);
            listToMapKList.remove(null);
            if(listToMapKList.size()>0){
                ArrayList<String> userIds = new ArrayList<>(listToMapKList.keySet());
                // 查询有相互回复的信息
                List<Users> users = psotMessageDao.queryIn(Users.class, "id", userIds);
                Map<String, Users> userMap = BeanUtil.getListToMapKT("id", users);
                // 将之间的关系对应进去
                for(Postmessage var :postMessags){
                    if(userMap!=null&&userMap.containsKey(var.getToUserId())){
                        var.setToUserName(userMap.get(var.getToUserId()).getUsername());
                        var.setToUserImg(userMap.get(var.getToUserId()).getHeadImg());
                    }
                }

            }
        }
        return postMessags;
    }

    /**
     * 保存帖子回复信息
     * @param postmessage
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRED)
    public Map<String,String> saveMessage(Postmessage postmessage){
        Map<String,String> map = new HashMap<String,String>();
        Users users = (Users)SystemUtils.getSession().getAttribute("USER_KEY");
        if(users==null){
            map.put("status","error");
            map.put("message","请先登录在评论!");
            return map;
        }
        postmessage.setUserId(users.getId());
        postmessage.setCreateTime(new Timestamp(System.currentTimeMillis()));
        psotMessageDao.save(postmessage);
        map.put("status","success");
        return map;
    }


}
