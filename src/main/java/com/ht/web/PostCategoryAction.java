package com.ht.web;

import com.ht.domain.Postcategory;
import com.ht.service.PostCategoryService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by TT on 2019/3/3.
 */
@Controller
@RequestMapping("/postCategoryAction")
@Scope("prototype")
public class PostCategoryAction {


    @Resource(name = "postCategoryService")
    private PostCategoryService postCategoryService;




    @RequestMapping("/queryPostCategory")
    @ResponseBody
    public List<Postcategory> queryPostCategory(){
        return postCategoryService.queryPostCategory();
    }
}
