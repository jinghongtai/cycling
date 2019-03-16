package com.ht.web;

import com.ht.domain.Cycling;
import com.ht.service.CyclingService;
import com.ht.utils.FileUtil;
import com.ht.utils.PageVo;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Controller
@RequestMapping("/cyclingAction")
@Scope("prototype")
public class CyclingAction {


    @Resource(name = "cyclingService")
    private CyclingService cyclingService;


    @RequestMapping("/queryInof")
    @ResponseBody
    public PageVo queryInof(Cycling cycling) throws IllegalAccessException, IntrospectionException, InvocationTargetException{
        return cyclingService.queryInof(cycling);
    }

    @RequestMapping("/saveCycling")
    @ResponseBody
    public Map<String,String> saveCycling(Cycling cycling){
        if(cycling.getFile()!=null){
            Map<String, String> fileResult = FileUtil.uploadFile(cycling.getFile(), "static/upload", Arrays.asList("image/jpeg", "image/jpeg", "application/x-jpg", "image/png"));
            if("success".equals(fileResult.get("status"))){
                cycling.setConverImg(fileResult.get("path"));
            }else
                return fileResult;
        }
        return cyclingService.saveCycling(cycling);
    }

    /**
     * 活动详情信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/activeDetail")
    public String activeDetail(Model model,String id){
        Cycling cycling = cyclingService.queryById(id);
        model.addAttribute("cycling",cycling);
        return "activeDetail";
    }
}
