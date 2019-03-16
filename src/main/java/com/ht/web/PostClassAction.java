package com.ht.web;

import com.ht.domain.Bankuai;
import com.ht.service.PostClassService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by TT on 2019/3/3.
 */
@Controller
@RequestMapping("/postClassAction")
@Scope("prototype")
public class PostClassAction {


    @Resource(name = "postClassService")
    private PostClassService postClassService;


    @RequestMapping("/queryInof")
    public ModelAndView queryInof(){
        ModelAndView mv = new ModelAndView("ztactive");
        List<Bankuai> bankuais = postClassService.queryPostClass();
        mv.addObject("bankuais",bankuais);
        return mv;
    }


}
