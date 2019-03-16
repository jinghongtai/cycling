package com.ht.service;

import com.ht.dao.PostCategoryDao;
import com.ht.domain.Postcategory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by TT on 2019/3/3.
 */
@Service("postCategoryService")
public class PostCategoryService {


    @Resource(name = "postCategoryDao")
    private PostCategoryDao postCategoryDao;


    /**
     * 查询所有的帖子分类信息
     * @return
     */
    @Transactional(readOnly = true)
    public List<Postcategory> queryPostCategory(){
        List<Postcategory> result = postCategoryDao.query(Postcategory.class, null, null, null);
        return result;
    }


}
