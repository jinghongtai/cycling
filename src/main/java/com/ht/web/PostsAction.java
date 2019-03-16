package com.ht.web;

import com.ht.domain.Posts;
import com.ht.service.PostsService;
import com.ht.utils.PageVo;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Controller
@RequestMapping("/postsAction")
@Scope("prototype")
public class PostsAction {


    @Resource(name = "postsService")
    private PostsService postsService;


    @RequestMapping("/queryInof")
    @ResponseBody
    public PageVo queryInof(Posts posts) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        PageVo bankuais = postsService.queryInof(posts);
        return bankuais;
    }


    @RequestMapping("/savePosts")
    @ResponseBody
    public Map<String,String> savePosts(Posts posts) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        return postsService.savePosts(posts);
    }

    @RequestMapping("/queryPostInfo")
    public ModelAndView queryPostInfo(String banKuaiClassId){
        ModelAndView mv = new ModelAndView("posts");
        //   查询档案板块分类下面存在的帖子数
        int count = postsService.queryOPage(banKuaiClassId);
        mv.addObject("pageCount",count);
        return mv;
    }


    @RequestMapping("/queryDetail")
    public ModelAndView queryDetail(String id){
        ModelAndView mv = new ModelAndView("postdetail");
        //   查询档案板块分类下面存在的帖子数
        Posts count = postsService.queryPostDetail(id);
        mv.addObject("post",count);
        return mv;
    }
}
