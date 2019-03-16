package com.ht.service;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.ht.dao.BanKuaiDao;
import com.ht.dao.PostClassDao;
import com.ht.domain.Bankuai;
import com.ht.domain.Postclass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年03月09日 20:41;
 *
 * @version: 1.0
 */
@Service("postClassService")
public class PostClassService {

    private Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();

    @Autowired
    private BanKuaiDao banKuaiDao;
    @Autowired
    private PostClassDao postClassDao;
    /**
     * 查询板块数据
     * @return
     */
    @Transactional(readOnly = true)
    public List<Bankuai> queryPostClass(){
        // 查询所有的板块信息
        List<Bankuai> banKuaiList = banKuaiDao.query(Bankuai.class, "flag", "=", "Y");
        String json = gson.toJson(banKuaiList);
        List<Bankuai> result = gson.fromJson(json,new TypeToken<List<Bankuai>>(){}.getType());
        // 查询所有的重点区域的分类
        List<Postclass> zdPost = postClassDao.query(Postclass.class, "flagZd", "=", "Y");
        for(Bankuai vo:result){
            if("1".equals(vo.getId()))
                vo.setPostclassList(new HashSet<Postclass>(zdPost));
        }
        return result;
    }






}
