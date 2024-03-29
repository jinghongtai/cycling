package com.ht.web;

import com.ht.domain.Users;
import com.ht.service.UserService;
import com.ht.utils.FileUtil;
import com.ht.utils.PageVo;
import com.ht.utils.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.beans.IntrospectionException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年01月13日 21:40;
 *
 * @version: 1.0
 */
@RequestMapping("/userAction")
@Scope("prototype")
@Controller
public class UserAction {


    @Autowired
    private UserService userService;


    @RequestMapping("/login")
    @ResponseBody
    public Map<String,String> login(String username,String pwd) throws UnsupportedEncodingException, NoSuchAlgorithmException{
        return userService.login(username,pwd);
    }
    /**
     * 分页查询用户数据
     * @param users
     * @return
     * @throws IllegalAccessException
     * @throws IntrospectionException
     * @throws InvocationTargetException
     */
    @RequestMapping("/queryPage")
    @ResponseBody
    public PageVo queryUserPage(Users users) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        return userService.queryUserPage(users);
    }

    /**
     * 保存用户信息
     * @param users
     * @return
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping("/saveOrUpdateUser")
    @ResponseBody
    public Map<String,String> saveOrUpdateUser(MultipartFile file, Users users) throws UnsupportedEncodingException, NoSuchAlgorithmException{
        if(file!=null){
            Map<String, String> map = FileUtil.uploadFile(file, "static/upload/userImg", Arrays.asList("image/jpeg","image/jpg", "image/png"));
            if("success".equals(map.get("status"))){
                users.setHeadImg(map.get("path"));
            }else
                return map;
        }
        return userService.saveOrUpdateUser(users);
    }


    /**
     * 保存用户信息
     * @param users
     * @return
     * @throws UnsupportedEncodingException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping("/register")
    @ResponseBody
    public Map<String,String> register(String code, Users users) throws UnsupportedEncodingException, NoSuchAlgorithmException{
        users.setUtype("1");
        users.setState("1");
        users.setHeadImg("static/img/user_default.png");
        return userService.saveOrUpdateUser(users);
    }


    @RequestMapping("/saveOrUpdateUserBySelf")
    @ResponseBody
    public Map<String,String> saveOrUpdateUserBySelf(MultipartFile file, Users users) throws UnsupportedEncodingException, NoSuchAlgorithmException{
        if(file!=null){
            Map<String, String> map = FileUtil.uploadFile(file, "static/upload/userImg", Arrays.asList("image/jpeg","image/jpg", "image/png"));
            if("success".equals(map.get("status"))){
                users.setHeadImg(map.get("path"));
            }else
                return map;
        }
        Users oldUser = (Users)SystemUtils.getSession().getAttribute("USER_KEY");
        if(!StringUtils.isEmpty(users.getHeadImg()))
            oldUser.setHeadImg(users.getHeadImg());
        oldUser.setUsername(users.getUsername());
        oldUser.setAddress(users.getAddress());
        return userService.saveOrUpdateUser(users);
    }

    /**
     * 退出
     * @param ids
     * @return
     */
    @RequestMapping("/logout")
    public String logout( ){
        SystemUtils.getSession().removeAttribute("USER_KEY");
        return "redirect:/register.jsp";
    }


    /**
     * 删除用户基础信息
     * @param ids
     * @return
     */
    @RequestMapping("/deleteUserByIds")
    @ResponseBody
    public boolean deleteUserByIds(@RequestParam("ids") List<String> ids){
        return userService.deleteUserByIds(ids);
    }

    /**
     * 显示用户列表页面
     * @param users
     * @return
     * @throws IllegalAccessException
     * @throws IntrospectionException
     * @throws InvocationTargetException
     */
    @RequestMapping("/userlist")
    public ModelAndView userlist(Users users) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/user/userList");
        return mv;
    }

    /**、
     * 添加用户页面
     * @param users
     * @return
     */
    @RequestMapping("/userAddPage")
    public String userAddPage(Users users){
        return "/user/userAdd";
    }


    @RequestMapping("/modifyUserInfo")
    @ResponseBody
    public Map<String,String> modifyUserInfo(Users u) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        return userService.modifyUserInfo(u);
    }
    @RequestMapping("/moifyPwd")
    @ResponseBody
    public Map<String,String>  moifyPwd(String pwd,String  newPwd) throws IllegalAccessException, IntrospectionException, InvocationTargetException, UnsupportedEncodingException, NoSuchAlgorithmException {
        return userService.moifyPwd(pwd,newPwd);
    }
}
