package com.ht.web;

import com.ht.domain.Resource;
import com.ht.domain.UserAndRole;
import com.ht.domain.Users;
import com.ht.service.ResourceService;
import com.ht.service.UserAndRoleService;
import com.ht.utils.BeanUtil;
import com.ht.utils.SystemUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.*;


/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年01月13日 14:19;
 *
 * @version: 1.0
 */
@Controller
@RequestMapping("/")
@Scope("prototype")
public class CommonAction {

    @Autowired
    private ResourceService resourceService;


    @Autowired
    private UserAndRoleService userAndRoleService;

    /**
     * 页面跳转控制器
     * @param page
     * @return
     */
    @RequestMapping("/index/{page}")
    public String openJsp(@PathVariable("page") String page){
        if(StringUtils.isEmpty(page))
            return "main";
        return page;
    }

    @RequestMapping("/index/{page}/{page1}")
    public String openJsp(@PathVariable("page") String page,@PathVariable("page1") String page1){
        return page+"/"+page1;
    }


    /**
     * 程序启动跳转至主页
     * @return
     */
    @RequestMapping("/main")
    public ModelAndView index() throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        ModelAndView mv = new ModelAndView();
        // 查询系统的菜单  需根据授权情况查询
        HttpSession session = SystemUtils.getSession();
        Users user = (Users)session.getAttribute("USER_KEY");
        if(user==null){
            mv.setViewName("redirect:/register.jsp");
            return mv;
        }
        List<UserAndRole> userAndRoles = userAndRoleService.queryUserRole(user.getId());
        List<Resource> resources = null;
        if(userAndRoles!=null&&userAndRoles.size()>0){
            Map<String, String> roleMap = BeanUtil.beanToMapKV("rId", "uId", userAndRoles);
            if(roleMap!=null&&roleMap.size()>0){
                List<String> roleIds = new ArrayList<>(roleMap.keySet());
                // 查询角色对应的权限数据
                resources = resourceService.queryRoleResource(roleIds);
            }
        }
        Map<String, List<Resource>> map = BeanUtil.getListToMapKList("pid", resources);
        resourceService.checkChildrenNode(map,"0");
        if(!map.isEmpty()){
            Set<Resource> resourceSet = map.get("0").get(0).getResourceSet();
            List<Resource> returnResource = orderResource(new ArrayList<Resource>(resourceSet));
            mv.addObject("menuList",returnResource);
        }
        mv.setViewName("main");
        return mv;
    }

    /**
     * 对查询的结果进行排序操作
     * @param varList
     */
    private List<Resource> orderResource(List<Resource> varList){
        if(varList==null||varList.size()==0)return null;
        Collections.sort(varList, new Comparator<Resource>() {
            @Override
            public int compare(Resource o1, Resource o2) {
                if(o1.getOrderNo()>o2.getOrderNo())
                    return 1;
                else if(o1.getOrderNo()<o2.getOrderNo())
                    return -1;
                else
                    return 0;
            }
        });
        for(Resource re:varList){
            List<Resource> resources = orderResource(new ArrayList<Resource>(re.getResourceSet()));
        }
        return varList;
    }
}
