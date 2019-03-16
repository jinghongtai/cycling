package com.ht.web;

import com.ht.domain.Postmessage;
import com.ht.service.PostMessageService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Controller
@RequestMapping("/postMessageAction")
@Scope("prototype")
public class PostMessageAction {


    @Resource(name = "postMessageService")
    private PostMessageService postMessageService;


    @RequestMapping("/saveMessage")
    @ResponseBody
    public Map<String,String> saveMessage(Postmessage postmessage){
        return postMessageService.saveMessage(postmessage);
    }

    @RequestMapping("/queryPostMessage")
    @ResponseBody
    public List<Postmessage> queryPostMessage(String postId) throws InvocationTargetException, IllegalAccessException{
        return postMessageService.queryPostMessage(postId);
    }

}
